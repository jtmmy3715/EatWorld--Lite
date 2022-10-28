package tw.eatworld.event.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.eatworld.event.model.*;

@Controller
@RequestMapping("/Event")
@SessionAttributes(names = {"store_id","allProducts","discountProducts","product_id","productBean","status","PD_id","productDiscountBean"})
public class RestaurantsController {

	@Autowired
	private ProductDiscountService dao;
      
	@GetMapping("/DiscountStart")
	public String DiscountStart(Model m) {
	    return "backendJsp/backendEvent/DiscountForm";
	}
	
	//由jsp 得到 store_id 開始啟動  
	@PostMapping("/login")
	public String login(@RequestParam("store_id")String store_id, Model m) {
				
		//因為store_id 只在第一次由 login 進入時可以取得,所以將 store_id 放入 session Attribute裡,以利後面程式取用
		if(store_id != null)
			m.addAttribute("store_id", store_id);
			
		// 執行DAO得到store_id裡所有產品與優惠產品的javaBean
		List<Product>allProducts = dao.readAll(store_id);
		List<ProductDiscount> discountProducts = dao.readDiscount(store_id);
			
		m.addAttribute("allProducts", allProducts);
		m.addAttribute("discountProducts", discountProducts);
		
		return "backendJsp/backendEvent/DiscountForm";
		}
		
	// 按欲新增的折扣項目Submit,執行在RestaurantForm.jsp增加一選擇新增折扣的畫面
	@PostMapping("/All")	
	public String all(@RequestParam("productSelected")String product_id, Model m) {
			// 取得欲新增的 product_id 然後DAO讀取後放入javaBean
			m.addAttribute("product_id", product_id);      //以利後面新增折扣項目使用
			
			Product productBean = dao.displayAppend(product_id);			
		    m.addAttribute("productBean", productBean);   //以利傳到JSP使用
		    
		    m.addAttribute("status", "1");
		    
		    return "backendJsp/backendEvent/DiscountForm";
	}
		
	//執行新增折扣項目至DB
	@PostMapping("/Insert")
	public String insert (@ModelAttribute("add")ProductDiscount productDiscountBean, Model m) {
		
			String product_id = (String) m.getAttribute("product_id");
			//取得store_id 以利dao使用
			String store_id = (String) m.getAttribute("store_id");
		
			//dao 執行新增一筆新優惠,並更新顯示的優惠項目
			ProductDiscount productDiscountBean1 = dao.insert(productDiscountBean, product_id);
			
			List<ProductDiscount> discountProducts = dao.readDiscount(store_id);				
			m.addAttribute("discountProducts", discountProducts);							      
			m.addAttribute("procductDiscountBean", productDiscountBean1);
			m.addAttribute("status", "3");
			return "backendJsp/backendEvent/DiscountForm";
	}
		
	@PostMapping("/UpDateAndDelete")
	public String UpDateAndDelete(@RequestParam("submit")String place, @RequestParam("update")String PD_id, Model m) {
		//執行刪除優惠產品
		if (("Delete").equals(place)) {
			String store_id = (String) m.getAttribute("store_id");			
			
			dao.delete(PD_id);
			//更新顯示優惠產品
			List<ProductDiscount> discountProducts = dao.readDiscount(store_id);				
			m.addAttribute("discountProducts", discountProducts);						      
			m.addAttribute("status", "2");
			
			return "backendJsp/backendEvent/DiscountForm";
		}		
		//place=="Update" 執行修改優惠產品進入RestaurantForm.jsp並增加修改畫面選項
		m.addAttribute("PD_id", PD_id);      //以利後面修改折扣項目使用		
		ProductDiscount productDiscountBean = dao.Update(PD_id);
		m.addAttribute("productDiscountBean", productDiscountBean);	
		m.addAttribute("status", "4");

		return "backendJsp/backendEvent/DiscountForm";		
		}
		
		//執行RestaurantForm回傳確認修改項目的內容，放入javaBean後再用DAO完成修改
	@PostMapping("/Update_Confirm")
	public String Update_Confirm(@RequestParam("discount")String discount, @RequestParam("start")String start, @RequestParam("end")String end, Model m) {
			ProductDiscount oldone = (ProductDiscount) m.getAttribute("productDiscountBean");
			
			ProductDiscount productDiscountBean = new ProductDiscount();
			
			//有輸入值用輸入值，不然用舊值。
			Integer PD_id = Integer.parseInt((String)m.getAttribute("PD_id")) ;			
			productDiscountBean.setPD_id(PD_id);
			productDiscountBean.setProduct(oldone.getProduct());
			if (start != "") {
			productDiscountBean.setStart_Date(start);}
			else { productDiscountBean.setStart_Date(oldone.getStart_Date());}
			
			if (discount != "") {
			productDiscountBean.setDiscount(Integer.parseInt(discount));}
			else {productDiscountBean.setDiscount(oldone.getDiscount());}
			
			if (end != "") {
			productDiscountBean.setEnd_Date(end);}
			else {productDiscountBean.setEnd_Date(oldone.getEnd_Date());}
							
			String store_id = (String) m.getAttribute("store_id");
			
			//執行DAO更新一筆優惠資料並將所有優惠產品更新印出
			dao.Update_Confirm(productDiscountBean);
			
			List<ProductDiscount> discountProducts = dao.readDiscount(store_id);				
			m.addAttribute("discountProducts", discountProducts);			  	
			m.addAttribute("status", "5");
	
			return "backendJsp/backendEvent/DiscountForm";		
	}

}
