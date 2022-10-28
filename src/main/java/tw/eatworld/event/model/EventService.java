package tw.eatworld.event.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class EventService {
	
	@Autowired
	private EventRepository eventRepo;
	
	@Autowired
	private ProductssssssRepository productRepo;
	
	//讀取所有優惠活動
	public List<Event> Read() {
		return eventRepo.findAll();
	}
	
	//讀取event_id 單一筆資料
	public Event ReadEvent_id(String event_id) {
		return eventRepo.findById(Integer.parseInt(event_id)).get();
	}
	
	// 讀取 event_id 優惠活動參與之產品與廠家
	public List<Product> ReadProduct(String event_id){
		Optional<Event> optional = eventRepo.findById(Integer.parseInt(event_id));
		Event event = optional.get();
		List<Product> allProducts = event.getAllProducts();
		List<Product> allProducts2 = new ArrayList<Product>(allProducts);
				
		return allProducts2;		
	}
	
	//刪除一筆活動(連同刪除參與活動之產品)
	public void Delete(String event_id){
		eventRepo.deleteById(Integer.parseInt(event_id));
	}
	
	//刪除參與活動之產品
	@SuppressWarnings("deprecation")
	public void DeleteItem(String event_id, String product_id){
		Event event = eventRepo.getById(Integer.parseInt(event_id));
		List<Product> products = event.getAllProducts();
		Iterator<Product> it = products.iterator();
		while (it.hasNext()) {
			Product product = (Product) it.next();
			Integer id = product.getProduct_id();
			
			if(id == Integer.parseInt(product_id)) {
				it.remove();
			}
		}
	}
	
	//讀取某store_id的所有產品
	public List<Product> ReadStore(String storeId){
		Integer store_id = Integer.parseInt(storeId);
		List<Product> storeProducts  = productRepo.findByStore(store_id);
			
		return storeProducts;
	}
	
	//優惠活動新增一筆配合產品
	@SuppressWarnings("deprecation")
	public void AppendItem(String product_id, String event_id){
		Event event = eventRepo.getById(Integer.parseInt(event_id));
		List<Product>products = event.getAllProducts();
		Product product = productRepo.getById(Integer.parseInt(product_id));		
		products.add(product);
	}
	
	//新增一筆活動
	public void Append(Event bean){	
		eventRepo.save(bean);
	}
	
	//修改一筆活動
	public void UpdateConfirm(Event bean){	
		eventRepo.save(bean);
	}

/*------------------------------------------ 前端方法 ------------------------------------------ */	
	//前端讀取今天所有的優惠活動
	public List<Event> ReadToday(Date today) {
		List<Event>todayEvents =  eventRepo.findAllByToday(today);
		return todayEvents;	
	}
	
	//前端讀取今天以後所有優惠活動
	public List<Event> ReadNextday(Date today) {
		List<Event>nextdayEvents = eventRepo.findAllAfterToday(today);
		return nextdayEvents;
	}
	
	//前端讀取今天所有優惠活動模糊查詢
	public List<Event> SearchReadToday(Date today, String name){
		List<Event>searchTodayEvents = eventRepo.findAllByTodayAndSearchName(today, name);
		return searchTodayEvents;
	}
	
	//前端讀取今天以後所有優惠活動模糊查詢
	public List<Event> SearchReadNextday(Date today, String name) {
		List<Event>searchnextdayEvents = eventRepo.findAllAfterTodaySearchName(today, name);
		return searchnextdayEvents;
	}
	
/*-------------------------------------- 廠商管理方法(未使用)--------------------------------------- */

	//廠商管理讀取store_id=2的優惠活動
	public List<Product> ReadEventStore2(String event_id) {
		List<Product> products = productRepo.findEventStore2(Integer.parseInt(event_id));
		System.out.println("1234");
		return products;
	}
	
}
