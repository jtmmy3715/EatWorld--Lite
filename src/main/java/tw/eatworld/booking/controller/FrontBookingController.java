package tw.eatworld.booking.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.thymeleaf.TemplateEngine;
import org.thymeleaf.context.Context;

import tw.eatworld.booking.model.BookingBean;
import tw.eatworld.booking.model.BookingService;
import tw.eatworld.booking.model.ClientMemberBean;
import tw.eatworld.booking.model.StoreMemberBean;

@Controller
@RequestMapping("/front/booking")
public class FrontBookingController {

	@Autowired
	private BookingService bService;
	@Autowired
    private JavaMailSender mailSender;
	@Autowired
    private TemplateEngine templateEngine;

	// store list
	@GetMapping("/store/list")
	public String listBooking(Model m) {
		
		List<StoreMemberBean> storeBeans = bService.StoreListAll();
		m.addAttribute("storeBeans", storeBeans);
		
		HashMap<String,String> storeDetails = new HashMap<>();
		storeDetails.put("count", String.valueOf(storeBeans.size()));
		System.out.println("店家數量: "+storeDetails.get("count"));
		m.addAttribute("storeDetails",storeDetails);
		
		
		
		return "frontJsp/frontBooking/bookingList";
	}

	// bookingBycid list
		@GetMapping("/client/{cid}")
		public String storelistBooking(@PathVariable int cid,Model m ) {
			List<BookingBean> bookingBeans = bService.FindClientlistByCId(cid);
			System.out.println("*進入會員訂位管理, 會員編號為" + cid +"*");
			m.addAttribute("bookingBeans",bookingBeans);
			return "frontJsp/frontClientMember/my-booking";
		}
	
	

		@PostMapping("/bookingPeopleBalance")
		@ResponseBody
		public String storeBookingPeople(@RequestBody BookingBean b,Model m) {
//			int bookingPeopleBalance = bService.FindStoreBySID(sid, "2022-10-29", "上午");
			int bookingPeopleBalance = bService.FindStoreBySID(b.getStore_id(), b.getBooking_date(), b.getBooking_period());
			if(bookingPeopleBalance != 0) {
				return "剩餘訂位人數: "+bookingPeopleBalance;
			}else {
			System.out.println(b.getStore_id());
			System.out.println(b.getBooking_date());
			System.out.println(b.getBooking_period());
				return  "此店家已無訂位!";
			}
			
		}
	
	
	// search storeName list
	@GetMapping("/storeName/list")
	@ResponseBody
	public List <StoreMemberBean> searchStoreName(@RequestParam("key") String key) {
		
		List<StoreMemberBean> storeBeans = bService.StoreListAll();
		ArrayList<StoreMemberBean> result = new ArrayList<StoreMemberBean>();
		System.out.println("key: " + key);
		
		for(StoreMemberBean s:storeBeans) {	//第 s 筆 storeBeans 資料和帶過來的值 (key) 比對, 並且帶過來的值長度不等於 0
			
			//模糊搜尋關鍵字店家
			if( s.getStore_name().contains(key) && key.length()!=0 ) {	//true, 則將 '第 s 筆 storeBeans 資料' 塞到 result 動態陣列
				result.add(s);
				
			//搜尋是否有訂位功能店家	
//			}else if( String.valueOf(s.getStore_booking()).equals(key) ){
				
			//搜尋店家訂位人數
			}else if(key.equals("尚有訂位") && s.getStore_people() > 0 ){
				result.add(s);
			}else if(key.equals("未有訂位") && s.getStore_people() <= 0 ){
				result.add(s);
			
			//空值則傳回所有店家	
			}else if(key.equals("空值")||key.equals("")){return storeBeans;};
		}
		return result;//傳回搜尋結果
	}
	
	//判斷現在時段
	@GetMapping("/bookingtime")
	@ResponseBody
	public String storeBookingTime() throws ParseException {
		SimpleDateFormat df = new SimpleDateFormat("HH:mm");//設置日期格式
		Date now = df.parse(df.format(new Date()));
		Calendar nowTime = Calendar.getInstance();
		nowTime.setTime(df.parse(df.format(new Date())));
		Calendar noonTime = Calendar.getInstance();
		noonTime.setTime(df.parse("11:00"));
		Calendar afternoonTime = Calendar.getInstance();
		afternoonTime.setTime(df.parse("15:00"));
		Calendar startTime = Calendar.getInstance();
		startTime.setTime(df.parse("00:00"));
		Calendar endTime = Calendar.getInstance();
		endTime.setTime(df.parse("24:00"));
		
		if(nowTime.before(noonTime) && nowTime.after(startTime)) {
			return "上午";
		}else if (nowTime.before(afternoonTime) && nowTime.after(noonTime)) {
			return "中午";
		}else if (nowTime.before(endTime) && nowTime.after(afternoonTime)) {
			return "下午";
		}
		return "??"+now;
	}
	
	
	
	
	// 找店家詳細資訊
	@GetMapping("/order/booking/{storeID}")
	@ResponseBody
	public StoreMemberBean orderBooking(@PathVariable int storeID) throws ParseException {
		StoreMemberBean storeBean = bService.FindBySId(storeID);
		//int bookingPeopleBalance = bService.FindStoreBySID(b.getStore_id(), b.getBooking_date(), b.getBooking_period());
		
		//現在時段剩餘人數
		String todaysDate = String.valueOf(LocalDate.now());
		int bookingPeopleBalance = bService.FindStoreBySID(storeBean.getStore_id(),todaysDate,storeBookingTime());
		System.out.println(storeBookingTime() + "," +bookingPeopleBalance);
		System.out.println(storeBean.getStore_name());
		storeBean.setStore_people(bookingPeopleBalance);
		System.out.println(storeBean.getStore_people());
		
		return storeBean;
	}


	
	// booking check 展示
	@RequestMapping("/order/send")
	public ModelAndView checkBooking(HttpServletRequest request, Model m) {
		ModelAndView mav = new ModelAndView("frontJsp/frontBooking/bookingCheck");//跳轉頁面
		
		BookingBean bookingBean = new BookingBean();//訂位
		bookingBean.setBooking_period(request.getParameter("booking_period"));
		bookingBean.setBooking_date(request.getParameter("booking_date"));
		bookingBean.setBooking_people(Integer.valueOf(request.getParameter("booking_people")));
		
		StoreMemberBean storeBean = bService.FindBySId(Integer.valueOf(request.getParameter("store_id")));//店家
		ClientMemberBean clientBean = bService.FindByCId(Integer.valueOf(request.getParameter("client_id")));//會員
		
		System.out.println(Integer.valueOf(request.getParameter("client_id")));
		mav.addObject("bookingBean", bookingBean);
		mav.addObject("storeBean", storeBean);
		mav.addObject("clientBean", clientBean);
		return mav;
	}
	
	// booking save
	@PostMapping("/order/save")
	@ResponseBody
	public BookingBean saveBooking(@RequestBody BookingBean bookingBean,Model m) {
		m.addAttribute("bookingBean",bookingBean);
		bookingBean.setBooking_status("訂位成功");
		bService.save(bookingBean);
		
		StoreMemberBean storeBean =  bService.FindBySId(bookingBean.getStore_id());
		ClientMemberBean clientBean =  bService.FindByCId(bookingBean.getClient_id());
		
		System.out.println(bookingBean.getBooking_id() + clientBean.getClient_name() + storeBean.getStore_name() +  
				bookingBean.getBooking_date() + bookingBean.getBooking_period() + bookingBean.getBooking_people());
		
		
		sendMail(bookingBean.getBooking_id(), clientBean.getClient_name(), storeBean.getStore_name(), 
				bookingBean.getBooking_date(), bookingBean.getBooking_period(), bookingBean.getBooking_people());
		

		
		
//		return new RedirectView("/front/booking/store/list",true);
		return bookingBean;
	}

	public void sendMail(int bid, String cname, String sname, String bdate, String bperiod, int bpeople) {
		
		System.out.println("訂位通知信即將發送");
		 try {
//		String fromEmail = "EatWorld2022@gmail.com";
		Context context = new Context();
	    context.setVariable("booking_id", bid);
	    context.setVariable("client_name", cname);
	    context.setVariable("store_name", sname);
	    context.setVariable("booking_date", bdate);
	    context.setVariable("booking_period", bperiod);
	    context.setVariable("booking_people", bpeople);
	    
       String templateContent = templateEngine.process("bookingTemplate", context); //把資料傳進模板
       MimeMessage mimeMessage = mailSender.createMimeMessage();
       MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage,true);
       
       mimeMessageHelper.setTo("yunchieh1997@gmail.com");
      
		mimeMessageHelper.setSubject("EatWorld 訂位通知信");
       mimeMessageHelper.setText(templateContent,true);
       mimeMessageHelper.setFrom(new InternetAddress("EatWorld吃窩 <EatWorld2022@gmail.com>"));
       
       mailSender.send(mimeMessage);
       
       System.out.println("訂位通知發信成功");
		 } catch (MessagingException e) {
			 System.out.println("訂位通知發信失敗");
				e.printStackTrace();
			}
		
	}

}
