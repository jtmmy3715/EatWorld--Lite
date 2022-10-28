package tw.eatworld.booking.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.ParseException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import tw.eatworld.booking.model.BookingBean;
import tw.eatworld.booking.model.BookingService;
import tw.eatworld.booking.model.ClientMemberBean;
import tw.eatworld.booking.model.StoreMemberBean;

@Controller
@RequestMapping("/booking")
public class BookingController {
	
	@Autowired
	private BookingService bService;
	
	//amin list
	@GetMapping("/list")
	public String listBooking(Model m) {
		List<BookingBean> bookingBeans = bService.BookingListAll();
		m.addAttribute("bookingBeans",bookingBeans);
		System.out.println("*進入管理員訂位管理*");
		return "backendJsp/backendBooking/bookingment";
	}
	
	
	
	
	
	//store list
	@GetMapping("/storelist/{sid}")
	public String storelistBooking(@PathVariable int sid,Model m ) {
		List<BookingBean> bookingBeans = bService.FindStorelistBySId(sid);
		System.out.println("*進入店家訂位管理, 店家編號為" + sid +"*");
		m.addAttribute("bookingBeans",bookingBeans);
		return "backendJsp/backendBooking/storeBookingment";
	}
	
	@GetMapping("/storecount/{sid}")
	@ResponseBody
	public String storecountBooking(@PathVariable int sid) {
		List<BookingBean> bookingBeans = bService.FindStorelistBySId(sid);
		HashMap<String,String> storeDetails = new HashMap<>();
		storeDetails.put("count", String.valueOf(bookingBeans.size()));
		return storeDetails.get("count");
	}
	
	
	

	//amin newForm
	@GetMapping("/form")
	public String showFormForAdd(Model m) {
		BookingBean bookingBean = new BookingBean();
		m.addAttribute("bookingBean",bookingBean);
		return "backendJsp/backendBooking/bookingForm";
	}
	//store newForm
	@GetMapping("/storeform")
	public String storeshowFormForAdd(Model m) {
		BookingBean bookingBean = new BookingBean();
		m.addAttribute("bookingBean",bookingBean);
		return "backendJsp/backendBooking/storeBookingForm";
	}
	
	//amin saveForm
	@PostMapping("/save")
	public RedirectView bookingSave(@ModelAttribute("bookingBean") BookingBean bookingBean,@RequestParam("photoUpload") MultipartFile mf)throws IOException, ParseException {
		String fileName = mf.getOriginalFilename();
		bookingBean.setBooking_photo(fileName);
		
		String filePath = "D:/upload";
		File saveFilePath = new File(filePath,fileName);
		FileCopyUtils.copy(mf.getInputStream(), Files.newOutputStream(saveFilePath.toPath()));//代替transferTo
//		mf.transferTo(saveFilePath);	//MultipartFile實現不同, 不使用絕對路徑就會去找tomcat虛擬預設暫存目錄, 沒創建該目錄會找不到文件路徑
		bService.save(bookingBean);
		return new RedirectView("/booking/list",true);
	}
	
	
	//store saveForm
	@PostMapping("/storesave")
	public RedirectView storebookingSave(@ModelAttribute("bookingBean") BookingBean bookingBean,@RequestParam("photoUpload") MultipartFile mf)throws IOException, ParseException {
		String fileName = mf.getOriginalFilename();
		bookingBean.setBooking_photo(fileName);
		
		String filePath = "D:/upload";
		File saveFilePath = new File(filePath,fileName);
		FileCopyUtils.copy(mf.getInputStream(), Files.newOutputStream(saveFilePath.toPath()));//代替transferTo
//		mf.transferTo(saveFilePath);	//MultipartFile實現不同, 不使用絕對路徑就會去找tomcat虛擬預設暫存目錄, 沒創建該目錄會找不到文件路徑
		
		bService.save(bookingBean);
		return new RedirectView("/booking/storelist/"+bookingBean.getStore_id(),true);
	}
	
	
	// search storeName list
		@GetMapping("/storeName/list")
		@ResponseBody
		public List <StoreMemberBean> searchStoreName(@RequestParam("key") String key) {
			List<StoreMemberBean> storeBeans = bService.StoreListAll();
			ArrayList<StoreMemberBean> result = new ArrayList<StoreMemberBean>();
			System.out.println("Skey: " + key);
			for(StoreMemberBean s:storeBeans) {	//第 s 筆 storeBeans 資料和帶過來的值 (key) 比對, 並且帶過來的值長度不等於 0
				//模糊搜尋關鍵字店家
				if( s.getStore_name().contains(key) && key.length()!=0 ) {
					result.add(s);}
				//搜尋店家訂位人數
				};
			return result;//傳回搜尋結果
		}
	
		// 找店家詳細資訊
		@GetMapping("/order/booking/{storeID}")
		@ResponseBody
		public StoreMemberBean orderBooking(@PathVariable int storeID) throws ParseException {
			StoreMemberBean storeBean = bService.FindBySId(storeID);
			return storeBean;
		}
	
		// search clientName list
				@GetMapping("/clientName/list")
				@ResponseBody
				public List <ClientMemberBean> searchClientName(@RequestParam("key") String key) {
					List<ClientMemberBean> clientBeans = bService.ClientListAll();
					ArrayList<ClientMemberBean> result = new ArrayList<ClientMemberBean>();
					System.out.println("Skey: " + key);
					for(ClientMemberBean c: clientBeans) {	
						//模糊搜尋關鍵字店家
						if( c.getClient_name().contains(key) && key.length()!=0 ) {
							result.add(c);}
						//搜尋店家訂位人數
						};
					return result;//傳回搜尋結果
				}
	
		// 找店家詳細資訊
		@GetMapping("/order/clientName/{clientID}")
		@ResponseBody
		public ClientMemberBean clientBooking(@PathVariable int clientID) throws ParseException {
			ClientMemberBean clientBean = bService.FindByCId(clientID);
			return clientBean;
		}
	
	//amin delete
	@GetMapping("/delete/{bookingID}")
	public String bookingDelete(@PathVariable int bookingID) {
		bService.deleteById(bookingID);
		return "redirect:/booking/list";
	}
	//store delete
	@GetMapping("/storedelete/{sid}/{bookingID}")
	public String storebookingDelete(@PathVariable int sid,@PathVariable int bookingID) {
		bService.deleteById(bookingID);
		return "redirect:/booking/storelist/"+sid;
	}
	
	//amin updateForm
	@GetMapping("/update/{bookingID}")
	public ModelAndView bookingUpdate(@PathVariable int bookingID) {
		ModelAndView mav = new ModelAndView("backendJsp/backendBooking/bookingEditForm");
		BookingBean bookingBean =  bService.FindById(bookingID);
		mav.addObject("bookingBean", bookingBean);
		return mav;
	}
	//store updateForm
	@GetMapping("/storeupdate/{bookingID}")
	public ModelAndView storebookingUpdate(@PathVariable int bookingID) {
		ModelAndView mav = new ModelAndView("backendJsp/backendBooking/storeBookingEditForm");
		BookingBean bookingBean =  bService.FindById(bookingID);
		mav.addObject("bookingBean", bookingBean);
		return mav;
	}
}
