package tw.eatworld.event.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.eatworld.event.model.Event;
import tw.eatworld.event.model.EventService;
import tw.eatworld.event.model.Product;


@Controller
@RequestMapping("/Event")
@SessionAttributes(names = {"event","Read","allEvent","status","event_id","allProduct","AppendItem","DeleteItem","product_id",
							"storeProduct","event_Name"})
public class EventsController {
	
	@Autowired
	private EventService dao;
	ArrayList<Event>allEvent = new ArrayList<Event>();
	
	
	
	@GetMapping("/EventsStart")
	public String start(Model m) {
    	allEvent =  (ArrayList<Event>) dao.Read();
    	m.addAttribute("allEvent", allEvent);
    	m.addAttribute("status", "None");	//防止重新啟動jsp時，status內有值會印出上次執行時殘留的顯示
    	return "backendJsp/backendEvent/EventForm";
	}
	
	@PostMapping(path = "/EventsMain")   
	public String home(@RequestParam("eventSelected")String event_id,@RequestParam("submit")String submit, Model m){ 
		
//		if(("Set").equals(submit)) {
					
//			return gotoSet (m);
			
//		}
		if (("Read").equals(submit)) {
			
			return gotoRead(event_id, m);
		}
		
			return gotoDelete(event_id, m);
			
	}
    
//已修改為彈跳視窗
	//按新增按鈕，進入新增活動網頁
//	private String gotoSet(Model m){
//		m.addAttribute("status", "Set");
		
//		return "backendJsp/backendEvent/EventForm";	
//	}
	
	//查詢活動內容，並可增刪參與活動之產品
	private String gotoRead(String event_id, Model m) {		
		List<Product>allProduct =  dao.ReadProduct(event_id);
		Event event = dao.ReadEvent_id(event_id);
//		List<Product>storeProduct = null;      				先前hibernate,MVC重設為null可以，改寫為SpringBoot後重設為null沒有作用需重新new List
		List<Product> storeProduct = new ArrayList<Product>();
		m.addAttribute("storeProduct", storeProduct);
		m.addAttribute("allProduct", allProduct);
		m.addAttribute("event", event);
		m.addAttribute("status", "Read");
		m.addAttribute("Read", event_id);
		m.addAttribute("AppendItem", "False"); // Form 會判斷不會顯示新增一筆產品成功
		m.addAttribute("DeleteItem", "False"); // Form 會判斷不會顯示刪除一筆產品成功
		return "backendJsp/backendEvent/EventForm";		
	}
	
	//刪除一筆活動(連同刪除所有參與此活動之產品)
	private String gotoDelete(@RequestParam("eventSelected")String event_id, Model m) {
		dao.Delete(event_id);
		
		//刷新所有優惠活動後再回到 jsp
		allEvent =  (ArrayList<Event>) dao.Read();
		m.addAttribute("allEvent", allEvent);
		m.addAttribute("event_id", event_id);//用於jsp顯示刪除的編號
		//改變 status值, 只會顯示所有活動
		m.addAttribute("status", "Delete");
		return "backendJsp/backendEvent/EventForm";		
	}
	
	//新增活動內容
	@PostMapping("/gotoAppend")
	private String gotoAppend(@ModelAttribute("addEvent") Event bean, @RequestParam("inputImageFile") File file ,Model m) {
		//將新增圖片塞進bean裡，再新增bean(用file.getName()也可以)
		String path = file.getPath();
//		System.out.println("Img File Path: " + path );
		bean.setEvent_Img(path);
		dao.Append(bean);
		//刷新所有優惠活動後再回到 jsp
		allEvent =  (ArrayList<Event>) dao.Read();
		m.addAttribute("allEvent", allEvent);
		//改變 status值, 只會顯示所有活動
		m.addAttribute("status", "Append");
		m.addAttribute("event_Name", bean.getEvent_Name());
		return "backendJsp/backendEvent/EventForm";		
	}
	
	//刪除參加活動之一筆產品
	@PostMapping("/gotoDeleteItem")
	private String gotoDeleteItem(@RequestParam("productSelected")String product_id,@SessionAttribute("Read")String event_id, Model m){
		dao.DeleteItem(event_id, product_id);
		
		//刷新所有參與產品後再回到 jsp
		List<Product>allProduct =  dao.ReadProduct(event_id);
		m.addAttribute("allProduct", allProduct);
		m.addAttribute("DeleteItem", "True"); // Form 會判斷顯示刪除一筆產品成功
		m.addAttribute("AppendItem", "False");// 非新增先前可能設為 True
		m.addAttribute("product_id", product_id); //用於JSP顯示刪除的資料
		return "backendJsp/backendEvent/EventForm";		
	}
	
	// 載入store_id 之產品資料
	@PostMapping("/gotoReadStore")
	@ResponseBody
	private List<Product> gotoReadStore(@RequestBody Map<String, String> map, Model m) {
		String store_id = map.get("store_id");
		List<Product>storeProduct = dao.ReadStore(store_id);
		
		return storeProduct;		
	}
    
	//新增一筆參與活動之產品
	@PostMapping("/gotoAppendItem")
	private String gotoAppendItem(@RequestParam("idSelected")String product_id, Model m){
//		String product_id = request.getParameter("storeProduct");
		String event_id = (String) m.getAttribute("Read");
		dao.AppendItem(product_id, event_id);
		
		//刷新所有參與產品後再回到 jsp
		List<Product>allProduct =   dao.ReadProduct(event_id);
		m.addAttribute("allProduct", allProduct);
		m.addAttribute("AppendItem", "True");       //以方便Form判斷顯示新增一筆產品成功
		m.addAttribute("DeleteItem", "False");      //先前可能設為True
		m.addAttribute("product_id", product_id); //用於JSP顯示刪除的資料
		return "backendJsp/backendEvent/EventForm";		
	}
//已改成彈跳視窗
	//	@PostMapping("/gotoUpdate")
//	private String gotoUpdate(Model m) {
//		m.addAttribute("status", "Update");
//		return "backendJsp/backendEvent/EventForm";		
//	}
	
	//按確定修改按鈕，進入修改活動內容
	@PostMapping("/gotoUpdateConfirm")
	private String gotoUpdateConfirm(@ModelAttribute("updateEvent") Event eventBean, @RequestParam("inputImageFile") File file ,Model m) {
		//eventBean是從jsp輸入的新資料,event是原有資料。新資料有值要修改就用eventBean的新資料，沒有輸入值就沿用event舊資料。
		Event event = (Event) m.getAttribute("event");
		String event_Name = eventBean.getEvent_Name();
		if(event_Name == "") event_Name = event.getEvent_Name();
		String description = eventBean.getDescription();
		if(description == "") description = event.getDescription();
		Integer discount;
		if(eventBean.getDiscount() != null) discount = eventBean.getDiscount();
		else {
			discount = event.getDiscount();
		}
		String start_Date = eventBean.getStart_Date();
		if(start_Date == "") start_Date = event.getStart_Date();
		String end_Date = eventBean.getEnd_Date();
		if(end_Date == "") end_Date = event.getEnd_Date();
		String code = eventBean.getCode();
		if(code == "") code = event.getCode();	
		String path = file.getPath();
		String event_Img = path;
		if(event_Img == "") event_Img = event.getEvent_Img();
		
		Event bean = new Event (event.getEvent_id(), event_Name, description, discount, start_Date, end_Date, code, event_Img, event.getAllProducts());
		dao.UpdateConfirm(bean);
		
		//刷新所有優惠活動後再回到 jsp
		allEvent =  (ArrayList<Event>) dao.Read();
		m.addAttribute("allEvent", allEvent);
		//改變 status值, 只會顯示所有活動與修改一筆成功
		m.addAttribute("status", "UpdateConfirm");
		m.addAttribute("event_id", event.getEvent_id());//用於jsp顯示刪除的編號
		
		return "backendJsp/backendEvent/EventForm";	
	}
	
/*-------------------------------- 以下為廠商後台管理 -------------------------------------------------------*/

	//起始路徑
	@GetMapping("/storeStart")
	public String storeStart(Model m) {
    	allEvent =  (ArrayList<Event>) dao.Read();
    	List<Product>storeProduct = dao.ReadStore("4");
    	m.addAttribute("allEvent", allEvent);
    	m.addAttribute("storeProduct",storeProduct);
    	return "backendJsp/backendEvent/storeEventForm";
	}
	
	//選擇優惠活動內容
	@PostMapping("/storeSelected")
	public String storeSelected(@RequestParam("eventSelected")String event_id ,Model m) {
		Event event = dao.ReadEvent_id(event_id);
//		List<Product> products = dao.ReadEventStore2(event_id);
		m.addAttribute("event",event);
		m.addAttribute("event_id",event_id);
//		m.addAttribute("allProduct", products);		
		return "backendJsp/backendEvent/storeEventSelected";		
	}
	
	//刪除優惠活動中參加之產品
	@PostMapping("/storeDeleteItem")
	public String storeDeleteItem(@RequestParam("productSelected")String product_id,@SessionAttribute("event_id")String event_id, Model m) {
		//刪除一筆參與之商品
		dao.DeleteItem(event_id, product_id);
		//重新載入event內容
		Event event = dao.ReadEvent_id(event_id);
		m.addAttribute("event",event);
		return "backendJsp/backendEvent/storeEventSelected";	
	}
	
	//增加一參與活動之商品
	@PostMapping("/storeAppendItem")
	public String storeAppendItem(@RequestParam("idSelected")String product_id, @SessionAttribute("event_id")String event_id, Model m) {
		//增加一筆參與之產品
		dao.AppendItem(product_id, event_id);
		//重新載入event內容
		Event event = dao.ReadEvent_id(event_id);
		m.addAttribute("event",event);
		return "backendJsp/backendEvent/storeEventSelected";
		
	}
		
	
	
}
