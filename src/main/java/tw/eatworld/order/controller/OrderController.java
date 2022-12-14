package tw.eatworld.order.controller;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Comparator;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.core.pattern.HtmlTextRenderer;
import org.apache.logging.log4j.core.pattern.TextRenderer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutOneTime;
import ecpay.payment.integration.domain.QueryTradeInfoObj;
import tw.eatworld.product.model.*;
import tw.eatworld.store.model.StoreMember;
import tw.eatworld.store.model.StoreMemberService;
import tw.eatworld.client.model.ClientMember;
import tw.eatworld.event.model.Event;
import tw.eatworld.event.model.EventService;
import tw.eatworld.event.model.Product;
import tw.eatworld.order.model.*;

@Controller
@SessionAttributes(names = {"cartOrderDetailList","orderTotal","cartOrderDetailComboList","user","store_id","o_storeMember","cart_events","discount_total"})
@RequestMapping("/OrderController")
public class OrderController {
	@Autowired
	private OrderService orderService;
	@Autowired
	private OrderMailSenderService oMailSenderService;
	@Autowired
	private ProductService pService;
	//??????????????????????????????
	@Autowired
	private EventService eventService;
	
	final static Integer CLIENT_ID=4;
	//final static Integer ORDER_ID=1;
	final static Integer STORE_ID=1;
	final static String TO_MAIL="jtmmy3715@gmail.com";
	final static String SUBJECT="EatWorld??????????????????";
	final static String TEMPLATE="orderTemplate";
	//final static String TRADE_NO="202210120005";
	//??????????????????
	final static Integer CHECKOUT_OK_STATUS=400;
	//??????????????????
	final static Integer ORDER_OK_STATUS=500;
	
	final static String MERCHANTID="2000132";
	final static Integer I_FILTER =1;
	final static Integer I_FILTER_COMBO =2;
	final static Integer CREDIT_CARD =1;
	
	
	//?????????????????????
	@GetMapping(path = "/goToCartPage")
	private String goToCartPage(Model m) {
		ClientMember clientMember = (ClientMember)m.getAttribute("user");
		int client_id;
		if(clientMember==null) {
			client_id=CLIENT_ID;
		}else {
			client_id = clientMember.getClientId();
		}//?????????ID
		OrderBean orderBean = orderService.findOrderByStatusAndClientId(client_id);
		if(orderBean.getStoreMember()!=null) {
			//??????????????????
//			StoreMember storeMember = storeService.findById(orderBean.getStoreid());
			StoreMember storeMember = orderBean.getStoreMember();
			storeMember.getsAddress();
			m.addAttribute("o_storeMember",storeMember);
		}
		System.out.println("-------------------------------------------------------------------------------------------");
		//??????????????????
		List<Event> eventList = eventService.ReadToday(new Date());
		//???????????????????????????
		Set<Event> productEventSet = new HashSet<Event>();
		for (OrderDetailBean orderDetailBean : orderBean.getOrderDetail()) {
			for (Event event : eventList) {
				for (Product product : event.getAllProducts()) {
					if(orderDetailBean.getProductBean()!=null) {
						if(orderDetailBean.getProductBean().getProduct_id()==product.getProduct_id()) {
							productEventSet.add(event);
						}
					}
					
				}
			}
		}
		m.addAttribute("cart_events",productEventSet);
		
		return "frontJsp/frontOrder/cart";
	}
	
	//??????????????????
	@GetMapping(path = "/goToCheckPage")
	private String gotToCheckPage(Model m) {
		ClientMember clientMember = (ClientMember)m.getAttribute("user");
		int client_id;
		if(clientMember==null) {
			client_id=CLIENT_ID;
		}else {
			client_id = clientMember.getClientId();
		}
		//????????????
		List<OrderDetailBean> cartList=orderService.getCartOrderDetail(client_id,I_FILTER);
		List<OrderDetailBean> cartComboList=orderService.getCartOrderDetail(client_id,I_FILTER_COMBO);
		
		Integer total = 0;
		
		for (OrderDetailBean orderDetailBean : cartList) {
			total+=orderDetailBean.getProductBean().getPrice()*orderDetailBean.getQulity();
		}
		for (OrderDetailBean orderDetailBean : cartComboList) {
			total+=orderDetailBean.getComboBean().getPrice()*orderDetailBean.getQulity();
		}
		if(m.getAttribute("discount_total")!=null) {
			int discount_total = (Integer)m.getAttribute("discount_total");
			total-=discount_total;
			System.out.println("???????????????"+discount_total);
		}
		System.out.println(total+"???????????????");
		m.addAttribute("cartOrderDetailList", cartList);
		m.addAttribute("cartOrderDetailComboList", cartComboList);
		m.addAttribute("orderTotal", total);
		return "frontJsp/frontOrder/checkout";
	}	
	//??????????????????
	@PostMapping(path = "/goToCheckEcPay")
	@ResponseBody
	private String gotToCheckEcpay(Model m) {
		ClientMember clientMember = (ClientMember)m.getAttribute("user");
		int client_id;
		if(clientMember==null) {
			client_id=CLIENT_ID;
		}else {
			client_id = clientMember.getClientId();
		}
		
		List<OrderDetailBean> orderDetailList=orderService.getCartOrderDetail(client_id,I_FILTER);
		List<OrderDetailBean> orderDetailComboList=orderService.getCartOrderDetail(client_id,I_FILTER_COMBO);
		int orderid = orderDetailList.get(0).getOrderBean().getOrderid();
		SimpleDateFormat simpleDateFormatorder = new SimpleDateFormat("ssMMddHH");
		String stDate = simpleDateFormatorder.format(new Date());
		String trade_no=stDate+orderid+((int)Math.random()*100);
		System.out.println("??????:"+trade_no);
		//??????????????????
		
		int total = 0;
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		String sDate = simpleDateFormat.format(new Date());
//		String total = (String)m.getAttribute("orderTotal");
//		List<OrderDetailBean> orderDetailList = (List<OrderDetailBean>)m.getAttribute("cartOrderDetailList");
		
		AllInOne allInOne = new AllInOne("");
		AioCheckOutOneTime oneTime = new AioCheckOutOneTime();
		oneTime.setMerchantID(MERCHANTID);
		oneTime.setMerchantTradeNo(trade_no);
		oneTime.setMerchantTradeDate(sDate);
		StringBuilder sb = new StringBuilder();
		oneTime.setTradeDesc("????????????");
		for (OrderDetailBean orderDetailBean : orderDetailList) {
			sb.append(orderDetailBean.getProductBean().getName());
			//??????:??????????????????????????????????????????????????????????????????????????????????????????????????????????????????#??????
			sb.append("#");
			total +=orderDetailBean.getProductBean().getPrice()*orderDetailBean.getQulity();
		}
		for (OrderDetailBean orderDetailBean : orderDetailComboList) {
			sb.append(orderDetailBean.getComboBean().getCombo_name());
			//??????:??????????????????????????????????????????????????????????????????????????????????????????????????????????????????#??????
			sb.append("#");
			total +=orderDetailBean.getComboBean().getPrice()*orderDetailBean.getQulity();
		}
		int discount_total = (Integer)m.getAttribute("discount_total");
		total-=discount_total;
		//????????????#???
		sb.deleteCharAt(sb.length()-1);
		oneTime.setItemName(sb.toString());
		oneTime.setTotalAmount(String.valueOf(total));
//		oneTime.setItemName("testItem");
		//???????????????????????????????????????????????????server????????????URL
		oneTime.setReturnURL("http://localhost:8080/EatWorld/OrderController/checkPayStatus");
		oneTime.setOrderResultURL("http://localhost:8080/EatWorld/OrderController/checkPayStatus");
		oneTime.setNeedExtraPaidInfo("Y");
		oneTime.setRedeem("Y");
		//?????????ID???????????????????????????
		oneTime.setCustomField1(String.valueOf(client_id));
		//??????????????????
		String form = allInOne.aioCheckOut(oneTime, null);
		
		return  form;
//		return "frontJsp/frontOrder/orderDisplay";		
	}	
	//??????????????????
	/* merchantTradeNo=??????????????????
	 * tradeNo=?????????????????????
	 * rtnCode =???????????????1=????????????
	 * tradeAmt=????????????
	 * tradeDate =????????????
	 * CustomField1 = ????????????ID
	 * 
	 */
	@PostMapping(path = "/checkPayStatus")
	private String checkPayStatus(@RequestParam("MerchantTradeNo") String merchantTradeNo,@RequestParam("TradeNo") String tradeNo,
			@RequestParam("RtnCode")int rtnCode , @RequestParam("TradeAmt")int tradAmt ,@RequestParam("TradeDate")String tradeDate,
			@RequestParam("CustomField1")Integer client_id, Model m) {
		//??????????????????
		//TODO????????????session??????
//		ClientMember clientMember = (ClientMember)m.getAttribute("user");
//		int client_id;
//		if(clientMember==null) {
//			System.out.println("?????????????????????ID");
//			client_id=CLIENT_ID;
//		}else {
//			System.out.println("???????????????sessionID");
//			client_id = clientMember.getClientId();
//		}
		System.out.println("?????????"+client_id);
		//?????????ID
		OrderBean orderBean = orderService.findOrderByStatusAndClientId(client_id);
		AllInOne allInOne = new AllInOne("");
		QueryTradeInfoObj trade = new QueryTradeInfoObj();
		trade.setMerchantID(MERCHANTID);
		System.out.println("??????ID"+tradeNo);
		trade.setMerchantTradeNo(tradeNo);
		long time = System.currentTimeMillis();
		Timestamp timestamp = new Timestamp(time);
		trade.setTimeStamp(timestamp.toString());
		String tradeInfo = allInOne.queryTradeInfo(trade);
		System.out.println("????????????"+tradeInfo);
		//------------???????????????------------//
		Set<OrderDetailBean> orderDetailSet = orderBean.getOrderDetail();
		List<ProductBean> products = new ArrayList<ProductBean>();
		for (OrderDetailBean orderDetailBean : orderDetailSet) {
			int qulity = orderDetailBean.getQulity();
				//	??????????????????????????????????????????
				if(orderDetailBean.getProductBean()!=null) {
					ProductBean productBean = pService.findByProductId(orderDetailBean.getProductBean().getProduct_id());
					Integer new_sale = productBean.getCount_sale()+qulity;
					Integer new_inventory = productBean.getInventory()-qulity;
					productBean.setCount_sale(new_sale);
					productBean.setInventory(new_inventory);
					products.add(productBean);
				}
		}
		pService.updateAllProduct(products);
		
		//-----------?????????????????????----------//
		sendTemplateMail(tradeNo, tradAmt, tradeDate,m);
		orderService.updateOrderStatus(orderBean.getOrderid(), CHECKOUT_OK_STATUS,tradeDate,tradAmt,CREDIT_CARD);
//		return  "redirect:/FrontProductController/initData";
		return  "redirect:/OrderController/user/orders";
		
	}	
	//??????????????????
	public void sendTemplateMail(String orderid,Integer order_sum,String tradeDate,Model m) {
		System.out.println("test");
		ClientMember clientMember = (ClientMember)m.getAttribute("user");
		int client_id;
		if(clientMember==null) {
			client_id=CLIENT_ID;
		}else {
			client_id = clientMember.getClientId();
		}
		//String toMail, String subject,
		//List<OrderDetailBean> allOrderDetail,Integer order_sum,String template
//		String toMail="jtmmy3715@gmail.com";
//		String subject="EatWorld??????????????????";
//		Integer order_sum=200;
////		String template ="orderTemplate";
//		String orderid = "202209261232";
//		String tradeDate = "20220926";
		List<OrderDetailBean> allOrderDetail=orderService.getCartOrderDetail(CLIENT_ID,I_FILTER);
		List<OrderDetailBean> allOrderDetailCombo=orderService.getCartOrderDetail(CLIENT_ID,I_FILTER_COMBO);
//		m.addAttribute("allOrderDetail", allOrderDetail);
		oMailSenderService.sendOrderHtmlMail(TO_MAIL,SUBJECT,order_sum,TEMPLATE,allOrderDetail,orderid,tradeDate,allOrderDetailCombo);
	}
	
	//??????????????????????????????
	@GetMapping(path = "/queryOrderStatus")
	private String queryOrderStatus() {
		
//		oneTime.setMerchantTradeDate("2022/09/25 08:05:23");
//		oneTime.setTotalAmount("50");
//		oneTime.setTradeDesc("test Description");
//		oneTime.setItemName("TestItem");
//		oneTime.setReturnURL("http://localhost:8080/EatWorld/FrontProductController/getAllData");
//		oneTime.setNeedExtraPaidInfo("N");
//		oneTime.setRedeem("Y");
//		String form = allInOne.aioCheckOut(oneTime, null);
		
		return  null;
		
	}
	//??????????????????????????????
	@PostMapping(path = "/updateCartQulity")
	@ResponseBody
	private String updateCartQulity(@RequestParam("detail_id") int orderdetail_id,@RequestParam("qulity") int qulity) {
		OrderDetailBean orderDetailBean = orderService.findOrderDetail(orderdetail_id);
		//
		
		if(orderDetailBean!=null) {
			if (orderDetailBean.getProductBean()!=null) {
				Integer inventory = orderDetailBean.getProductBean().getInventory();
				if(qulity>inventory) {
					return "error";
				}
			}
			orderDetailBean.setQulity(qulity);
			orderService.updateOrderDetail(orderDetailBean);
		}
		
		return "ok";
		
	}
	//?????????????????????
	@PostMapping(path = "/deleteOrderDetail")
	@ResponseBody
	private String deleteOrderDetail(@RequestParam("detail_id") int orderDetail_id) {
		orderService.deleteOrderDetail(orderDetail_id);
		return "ok";
	}	
	
	
	//???????????????????????????
	/*i_filter=1 ->??????
	 * i_filter=2 ->??????
	 * 
	 */
	@GetMapping(path = "/getCartOrderDetail")
	@ResponseBody
	private List<OrderDetailBean> getCartOrderDetail(@RequestParam("i_filter")Integer i_filter ,@RequestParam("event_id")Integer event_id, Model m) {
		ClientMember clientMember = (ClientMember)m.getAttribute("user");
		int client_id;
		//????????????
		int discount_total=0;
		if(clientMember==null) {
			client_id=CLIENT_ID;
		}else {
			client_id = clientMember.getClientId();
		}
		List<OrderDetailBean> cartList = orderService.getCartOrderDetail(client_id,i_filter);
		//??????????????????????????????
		if(event_id!=0&&i_filter==1) {
			Event event = eventService.ReadEvent_id(event_id.toString());
			Double discount = Double.valueOf(event.getDiscount()) ;
			List<Product> allProducts = event.getAllProducts();
			for (OrderDetailBean orderDetailBean : cartList) {
				Double price= Double.valueOf(orderDetailBean.getProductBean().getPrice()) ;
				//???????????????0???
				orderDetailBean.setDiscount_price(0);
				//??????product_id???????????????????????????
				for (Product eventProduct : allProducts) {
					System.out.println(orderDetailBean.getProductBean().getProduct_id()+"??????2"+eventProduct.getProduct_id());
					if(orderDetailBean.getProductBean().getProduct_id()==eventProduct.getProduct_id()) {
						System.out.println("????????????"+(discount/100));
						//??????
						Double d_discount_price=price-(price*(discount/100));
						Integer discount_price=(int)Math.round(d_discount_price);
						//??????????????????*??????
						discount_total+=discount_price*orderDetailBean.getQulity();
						
						orderDetailBean.setDiscount_price(discount_price);
					}
				}
			}
			System.out.println("?????????"+discount_total);
			m.addAttribute("discount_total",discount_total);
		}else {
			System.out.println("?????????????????????");
			for (OrderDetailBean orderDetailBean : cartList) {
				orderDetailBean.setDiscount_price(0);
			}
		}
		
		System.out.println("?????????"+cartList.size());
//		int sum = 0;
//		for (OrderDetailBean orderDetailBean : cartOrderDetailList) {
////			sum += orderDetailBean.getProductBean().getPrice() * orderDetailBean.getQulity();
//			System.out.println("??????:"+orderDetailBean.getProductBean().getProduct_id()+"/"+"??????:"+orderDetailBean.getQulity());
//		}
//		m.addAttribute("cartOrderDetailList", cartList);
//		m.addAttribute("cart_sum", sum);
		return cartList;
	}	
	//?????????????????????
	@PostMapping(path = "/insertToCart")
	@ResponseBody
	private String insertToCart(@RequestParam int qulity,@RequestParam int product_id,Model m) {
//		String order_id = request.getParameter("order_id");
//		Integer order_id=1;
		ClientMember clientMember = (ClientMember)m.getAttribute("user");
		String s_session_store_id = (String)m.getAttribute("store_id");
		Integer session_store_id = Integer.parseInt(s_session_store_id);
		int client_id;
		if(clientMember==null) {
			client_id=CLIENT_ID;
		}else {
			client_id = clientMember.getClientId();
		}
		OrderBean orderBean1 = orderService.findOrderByStatusAndClientId(client_id);
		//?????????????????????????????????
		//??????????????????null?????????STORE_id????????????????????????
		
		//??????????????????null?????????STORE_id????????????????????????
		
		//?????????null??????????????????ID
		
		//????????????????????????????????????
		if(orderBean1.getStoreMember()!=null) {
			if(session_store_id!=orderBean1.getStoreMember().getId()) {
				return "repeatStore";
			}
		}else {
			System.out.println("?????????"+session_store_id);
			StoreMember storeMember = new StoreMember();
			storeMember.setId(session_store_id);
			orderBean1.setStoreMember(storeMember);
			orderService.saveOrder(orderBean1);
		}

		OrderDetailBean orderDetailBean = orderService.checkCartRepeat(orderBean1.getOrderid(), product_id);
		if(orderDetailBean==null) {
			OrderDetailBean orderDetail = new OrderDetailBean();
			ProductBean productBean = new ProductBean();
			OrderBean orderBean = new OrderBean();
			System.out.println("??????:"+qulity);
			productBean.setProduct_id(product_id);
			orderDetail.setQulity(qulity);
			orderDetail.setProductBean(productBean);
			orderBean.setOrderid(orderBean1.getOrderid());
			orderDetail.setOrderBean(orderBean);
			orderService.insertProductToCartDetail(orderDetail);
		}else {
			int oQulity = orderDetailBean.getQulity();
			//?????????+?????????
			orderDetailBean.setQulity(oQulity+qulity);
			orderService.insertProductToCartDetail(orderDetailBean);
		}
		return "ok";
	}
	
	//???????????????????????????
	@PostMapping(path = "/insertToComboCart")
	@ResponseBody
	private String insertToComboCart(@RequestParam("qulity") int qulity,@RequestParam("combo_id") int combo_id,Model m) {
//		String order_id = request.getParameter("order_id");
//		Integer order_id=1;
		ClientMember clientMember = (ClientMember)m.getAttribute("user");
		String s_session_store_id = (String)m.getAttribute("store_id");
		Integer session_store_id = Integer.parseInt(s_session_store_id);
		
		int client_id;
		if(clientMember==null) {
			client_id=CLIENT_ID;
		}else {
			client_id = clientMember.getClientId();
		}
		OrderBean orderBean1 = orderService.findOrderByStatusAndClientId(client_id);
		//?????????????????????????????????
		if(orderBean1.getStoreMember()!=null) {
			if(session_store_id!=orderBean1.getStoreMember().getId()) {
				return "repeatStore";
			}
		}else {
			StoreMember storeMember = new StoreMember();
			storeMember.setId(session_store_id);
			orderBean1.setStoreMember(storeMember);
			orderService.saveOrder(orderBean1);
		}
		
		OrderDetailBean orderDetailBean = orderService.checkCartComboRepeat(client_id, combo_id);
		if(orderDetailBean==null) {
			OrderDetailBean orderDetail = new OrderDetailBean();
			ComboBean comboBean = new ComboBean();
			OrderBean orderBean = new OrderBean();
			System.out.println("??????:"+qulity);
			comboBean.setCombo_id(combo_id);
			orderDetail.setQulity(qulity);
			orderDetail.setComboBean(comboBean);
			orderBean.setOrderid(orderBean1.getOrderid());
			orderDetail.setOrderBean(orderBean);
			orderService.insertProductToCartDetail(orderDetail);
		}else {
			int oQulity = orderDetailBean.getQulity();
			//?????????+?????????
			orderDetailBean.setQulity(oQulity+qulity);
			orderService.insertProductToCartDetail(orderDetailBean);
		}
		return "ok";
	}
	//????????????????????????
	@GetMapping("/user/orders")
	public String processOrdersAction(Model m) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		//??????????????????
		Set<OrderBean> orderSet = new TreeSet<OrderBean>(new Comparator<OrderBean>() {
			@Override
			public int compare(OrderBean o1, OrderBean o2) {
				 Date date1,date2;
				try {
					date1 = sdf.parse(o1.getOrdertime());
					date2 = sdf.parse(o2.getOrdertime());
					if(date1.after(date2)) {
						return -1;
					}else if(date1.before(date2)){
						return 1;
					}
				} catch (ParseException e) {
					e.printStackTrace();
				}
				return 0;
			}
		});
		
		ClientMember clientMember = (ClientMember)m.getAttribute("user");
		int client_id;
		if(clientMember==null) {
			client_id=CLIENT_ID;
		}else {
			client_id = clientMember.getClientId();
		}
		List<OrderBean> orderList = orderService.findOrderByClientid(client_id);
		for (OrderBean orderBean : orderList) {
			orderSet.add(orderBean);
		}
		
		
		if(orderList.isEmpty()) {
			m.addAttribute("orderList",new ArrayList<OrderBean>());
		}else {

			
			m.addAttribute("orderList",orderSet);
		}
		
		return "frontJsp/frontClientMember/my-orders";
		
	}


	
/****************************************????????????***********************************/
	
	@GetMapping("/backend/orders")
	public String showBackendOrdersPage(Model m) {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		//??????????????????
		Set<OrderBean> orderSet = new TreeSet<OrderBean>(new Comparator<OrderBean>() {
			@Override
			public int compare(OrderBean o1, OrderBean o2) {
				 Date date1,date2;
				try {
					date1 = sdf.parse(o1.getOrdertime());
					date2 = sdf.parse(o2.getOrdertime());
					if(date1.after(date2)) {
						return -1;
					}else if(date1.before(date2)){
						return 1;
					}
				} catch (ParseException e) {
					e.printStackTrace();
				}
				return 0;
			}
		});
		
		StoreMember storeMember = (StoreMember)m.getAttribute("user");
		int store_id;
		if(storeMember==null) {
			store_id=STORE_ID;
		}else {
			store_id = storeMember.getId();
		}
		//clientMember.getClientId()
		List<OrderBean> orderList = orderService.findOrderByStoreid(store_id);
		for (OrderBean orderBean : orderList) {
			orderSet.add(orderBean);
		}
		
		
		
		if(orderList.isEmpty()) {
			m.addAttribute("orderList",new ArrayList<OrderBean>());
		}else {

			m.addAttribute("orderList",orderSet);
		}
		
		return "/backendJsp/backendOrder/orderDisplay";
	}
	
	
	//????????????????????????
	@GetMapping("/updateOrderStatus")
	@ResponseBody
	public String updateOrderStatus(@RequestParam("order_id")Integer order_id, Model m) {
		
		orderService.updateOrderStatus(order_id, ORDER_OK_STATUS);
		
		return "ok";
	}
	
/*-----------------------------------------chart.js----------------------------------------------*/
		//????????????????????????
		@PostMapping("/findThisYearOrderAllQuarterly")
		@ResponseBody
		public List<Integer> findThisYearOrderAllQuarterly(Model m) {
			
			StoreMember storeMember = (StoreMember)m.getAttribute("user");
			int store_id;
			if(storeMember==null) {
				store_id=STORE_ID;
			}else {
				store_id = storeMember.getId();
			}
			Date date = new Date();
			List<Integer> priceList = orderService.findOrderAllQuarterly(store_id,date, date);
			return priceList;
		}
	
	//????????????????????????
		@PostMapping("/findLastYearOrderAllQuarterly")
		@ResponseBody
		public List<Integer> findLastYearOrderAllQuarterly(Model m) {
			
			StoreMember storeMember = (StoreMember)m.getAttribute("user");
			int store_id;
			if(storeMember==null) {
				store_id=STORE_ID;
			}else {
				store_id = storeMember.getId();
			}
			Date date = new Date();
			Calendar c = Calendar.getInstance();
			c.setTime(date);
			c.add(Calendar.YEAR, -1);
			Date old_date = c.getTime();
			return orderService.findOrderAllQuarterly(store_id,date, old_date);
		}
		
		//????????????????????????
		/* orderInfList
		 * ??????0?????????????????????
		 * ??????1??????????????????
		 */
		@PostMapping("/findAllOrderInf")
		@ResponseBody
		public List<Integer> findAllOrderInf(Model m) {
			
			List<Integer> orderInfList = new ArrayList<Integer>();
			int orderTotal = 0; 
			
			StoreMember storeMember = (StoreMember)m.getAttribute("user");
			int store_id;
			if(storeMember==null) {
				store_id=STORE_ID;
			}else {
				store_id = storeMember.getId();
			}
			List<OrderBean> orderList = orderService.findOrderByStoreid(store_id);
			for (OrderBean orderBean : orderList) {
				orderTotal+=orderBean.getPrice();
			}
			orderInfList.add(orderTotal);
			orderInfList.add(orderList.size());
			
			return orderInfList;
		}
	
}
