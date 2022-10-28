package tw.eatworld.order.model;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Optional;
import java.util.Set;
import java.util.TreeSet;
import java.util.stream.Collectors;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.eatworld.client.model.ClientMember;
import tw.eatworld.exception.NotFoundException;
import tw.eatworld.order.model.*;
import tw.eatworld.product.model.ProductBean;

@Service
@Transactional
public class OrderService {
	@Autowired
	OrderDetailRepository odRepo;
	@Autowired
	OrderRepository oRepo;
	//JPA標準API，可以用來手動關閉session
	@PersistenceContext
	private EntityManager entityManger;
	//Spring mail物件導入

	
	
	private static final Integer CART_STATUS = 200;
	
	private static Calendar cal;
	
	static {
		cal = Calendar.getInstance();
	}


	//新增購物車內容
	public void insertProductToCartDetail(OrderDetailBean orderDetailBean) {
		odRepo.save(orderDetailBean);
	}
	//刪除購物車內容
	public void deleteOrderDetail(int orderDetail_id) {
		odRepo.deleteById(orderDetail_id);
	}
	//更改購物車內容
	public void updateOrderDetail(OrderDetailBean orderDetailBean) {
		odRepo.save(orderDetailBean);
	}
	
	//更改所有購物車內容
	public void updateAllOrderDetail(Set<OrderDetailBean> orderDetailBeans) {
		odRepo.saveAll(orderDetailBeans);
	}
	
	
	
	public OrderDetailBean findOrderDetail(int orderDetail_id) {
		Optional<OrderDetailBean> op = odRepo.findById(orderDetail_id);
		if(!op.isEmpty()) {
			return op.get();
		}else {
			return null;
		}
		
		
	}

	public List<OrderDetailBean> getOrderDetail(int order_id) {
		Optional<OrderBean> op = oRepo.findById(order_id);
		if(op.isEmpty()) {
			throw new NotFoundException("OrderNotFoundExection");
		}
		OrderBean orderBean = op.get();
		ArrayList<OrderDetailBean> detailList = new ArrayList<OrderDetailBean>(orderBean.getOrderDetail());

		return detailList;
	}
	//判斷資料庫重複單點商品
	public OrderDetailBean checkCartRepeat(int order_id,int product_id) {
		OrderDetailBean orderDetailBean = odRepo.CheckCartItem(order_id,product_id);
		return orderDetailBean;
	}
	//判斷資料庫重複套餐商品
	public OrderDetailBean checkCartComboRepeat(int order_id,int combo_id) {
		OrderDetailBean orderDetailBean = odRepo.CheckCartComboItem(order_id,combo_id);
		return orderDetailBean;
	}
	//因有資料庫有會員參考，才用java進行判斷
	//取得購物車細項
	//可修改為資料庫查詢
	public List<OrderDetailBean> getCartOrderDetail(int client_id ,int i_filter) {

		List<OrderBean> orderBeanList = oRepo.findByStatus(CART_STATUS);
		Boolean isCartExist=false;
		//判斷不為0
		if (orderBeanList.size()!=0) {
			for (OrderBean orderBean : orderBeanList) {
				//判斷是否與會員ID相符
				if(orderBean.getClientMember().getClientId()==client_id) {
					isCartExist=true;
//					//set轉list
					Set<OrderDetailBean> cartDetail = orderBean.getOrderDetail();
//					//將重複的商品用set去除及排序
					Set<OrderDetailBean> cartDetailSet;
					if(i_filter==1) {
						cartDetailSet = new TreeSet<OrderDetailBean>(new Comparator<OrderDetailBean>() {
							@Override
							public int compare(OrderDetailBean o1, OrderDetailBean o2) {
								
									if(o1.getProductBean().getProduct_id()==o2.getProductBean().getProduct_id()) {
										return 0;
									}else if(o1.getProductBean().getProduct_id()>o2.getProductBean().getProduct_id()){
										return 1;
									}else {
										return -1;
									}
								
							}	
						});
					}else {
						cartDetailSet = new TreeSet<OrderDetailBean>(new Comparator<OrderDetailBean>() {
							@Override
							public int compare(OrderDetailBean o1, OrderDetailBean o2) {
								
									if(o1.getComboBean().getCombo_id()==o2.getComboBean().getCombo_id()) {
										return 0;
									}else if(o1.getComboBean().getCombo_id()>o2.getComboBean().getCombo_id()){
										return 1;
									}else {
										return -1;
									}
								
							}	
						});
					}
					
					
//					entityManger.clear();
					for (OrderDetailBean orderDetailBean : cartDetail) {
						if (i_filter==1 && orderDetailBean.getProductBean()!=null) {
							cartDetailSet.add(orderDetailBean);
						}else if( i_filter==2 &&orderDetailBean.getComboBean()!=null){
							cartDetailSet.add(orderDetailBean);
						}
						
					}

					return new ArrayList<OrderDetailBean>(cartDetailSet);
				}
			}
			if(!isCartExist) {
				ClientMember clientMember = new ClientMember();
				clientMember.setClientId(client_id);
				OrderBean orderBean = new OrderBean(CART_STATUS,clientMember);
				oRepo.save(orderBean);
			}
			
				
		}
		return new ArrayList<OrderDetailBean>();
	}
	
	
	//更新訂單狀態
	public void updateOrderStatus(int order_id,int status,String tradeDate,int price,int pay_type) {
		oRepo.updateOrderByStatus(order_id, status ,tradeDate,price,pay_type);
	}
	
	//更新完成訂單狀態
		public void updateOrderStatus(int order_id,int status) {
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			String date = simpleDateFormat.format(new Date());
			oRepo.updateOrderByStatus(order_id, status,date );
		}
	
	
	public List<OrderBean> findOrderByClientid(int client) {
		return oRepo.findOrderByClientid(client);
	}
	
	public List<OrderBean> findOrderByStoreid(int store_id) {
		return oRepo.findOrderByStoreid(store_id);
	}
	
	//查看購物車ID
	public OrderBean findOrderByStatusAndClientId(int client_id) {
		//放入購物車狀態
		return oRepo.findOrderByStatusAndClientId(CART_STATUS,client_id);
	}
	
	//儲存購物車
		public OrderBean saveOrder(OrderBean orderBean) {
			//放入購物車狀態
			return oRepo.save(orderBean);
		}
	//--------------------------chart.js-------------------------------------------
		/*
		 *陣列0->Q1總金額
		 *陣列1->Q2總金額
		 *陣列2->Q3總金額
		 *陣列3->Q4總金額
		 */
		public List<Integer> findOrderAllQuarterly(int store_id, Date d_nowDate , Date d_oldDate){
			int q1Total=0;
			int q2Total=0;
			int q3Total=0;
			int q4Total=0;
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy");
			String nowDate = simpleDateFormat.format(d_nowDate);
			String oldDate = simpleDateFormat.format(d_oldDate);
			System.out.println(nowDate+"時間"+oldDate);
			//新增出陣列
			List<Integer> quarterlyPriceList = new ArrayList<Integer>();
			List<OrderBean> orderList;
			//相同為今年
			if(nowDate.equals(oldDate)) {
				System.out.println("今年");
				orderList = oRepo.findThisYearOrderByStoreid(store_id, nowDate);
			}else {
				System.out.println("前年");
				orderList = oRepo.findLastYearOrderByStoreid(store_id, nowDate,oldDate);
				
			}
			System.out.println("訂單大小"+orderList.size());
			SimpleDateFormat simpleDateFormat2 = new SimpleDateFormat("yyyy-MM-dd");
			//日期比較
			for (OrderBean orderBean : orderList) {
				if(orderBean.getFinishtime()!=null) {
					Date orderDate;
					try {
						orderDate = simpleDateFormat2.parse(orderBean.getFinishtime());
						cal.setTime(orderDate);
						int mouth = cal.get(cal.MONTH)+1;
						System.out.println("月"+mouth);
						if(mouth<=3) {
							//Q1
							q1Total+=orderBean.getPrice();
						}else if(mouth<=6) {
							//Q2
							q2Total+=orderBean.getPrice();
						}else if (mouth<=9) {
							//Q3
							q3Total+=orderBean.getPrice();
						}else {
							//Q4
							q4Total+=orderBean.getPrice();
						}
					} catch (ParseException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
				}
			}
			quarterlyPriceList.add(q1Total);
			quarterlyPriceList.add(q2Total);
			quarterlyPriceList.add(q3Total);
			quarterlyPriceList.add(q4Total);
			
			return quarterlyPriceList;
			 
			 
		}
		
}

