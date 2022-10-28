package tw.eatworld.product.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.eatworld.order.model.OrderDetailBean;
import tw.eatworld.order.model.OrderService;
import tw.eatworld.product.model.ComboBean;
import tw.eatworld.product.model.ComboService;
import tw.eatworld.product.model.ProductBean;
import tw.eatworld.product.model.ProductClassificationBean;
import tw.eatworld.product.model.ProductClassificationService;
import tw.eatworld.product.model.ProductService;
import tw.eatworld.store.model.StoreMember;
@Controller
@SessionAttributes(names = {"user","store_id"})
@RequestMapping("/FrontProductController")
public class FrontProductController {
	@Autowired
	private ProductService pService;
	@Autowired
	private ComboService cService;
//	@Autowired
//	private OrderService orderService;
	@Autowired
	private ProductClassificationService pcService;
	
//	private final int ROOM = 0;
//	private final int FROZEN = 1;
//	private Integer CLIENT_ID=4;
	private Integer SINGLEVIEW=1;
	/*
	 * 0=全部商家
	 * 
	 */
//	private Integer STORE_ID=1;
	
	List<ProductBean> productList = new ArrayList<ProductBean>();

	@GetMapping("/initData")
	private String initData(Model m) throws ServletException, IOException {
		
		return "frontJsp/frontProduct/frontProductDisplay";
	
	}
//	//取得所有產品內容
	@GetMapping(path = "/getFrontAllProduct")
	@ResponseBody
	private List<ProductBean> getFrontAllProduct(@RequestParam("sort")Integer sort, Model m) {
		//TODO獲取STORE_ID
		String s_store_id = (String)m.getAttribute("store_id");
		int store_id = Integer.parseInt(s_store_id);
		System.out.println("商家ID"+store_id);
		productList = pService.findSortProductByStore(store_id,sort);
		
		
//
		System.out.println("讀取數量:"+productList.size());
//		
//		m.addAttribute("productList",productList);
		return productList;
	}
	/*
	 * AJAX取得所有分類
	 */
	@PostMapping("/getAllClassification")
	@ResponseBody
	private List<ProductClassificationBean> getAllClassification(Model m)  {

		String s_store_id = (String)m.getAttribute("store_id");
		int store_id = Integer.parseInt(s_store_id);
		List<ProductClassificationBean> classificationList = pcService.findByStoreid(store_id);
		System.out.println("類別大小"+classificationList.size());
		return classificationList;
	}
	/*AJAX取得各分類大小
	 * category_name = 分類名稱
	 */
	@PostMapping("/getClassificationSize")
	@ResponseBody
	private Integer getClassificationSize(@RequestParam("category_name") String category_name ,Model m)  {
		List<ProductBean> productList = new ArrayList<ProductBean>();
		String s_store_id = (String)m.getAttribute("store_id");
		int store_id = Integer.parseInt(s_store_id);
		ProductClassificationBean classification = pcService.findByNameAndStoreid(category_name,store_id);
		//讀取上架的分類數
		for (ProductBean productBean : classification.getProductSet()) {
			if (productBean.getSold()==1) {
				productList.add(productBean);
			}
		}
		
		return productList.size();
	}
	/*AJAX取得套餐或單點的數量
	 */
	
	@PostMapping("/getFilterSize")
	@ResponseBody
	private Map<String, Integer> getFilterSize(Model m)  {

		String s_store_id = (String)m.getAttribute("store_id");
		int store_id = Integer.parseInt(s_store_id);
		Map<String, Integer> filterSizeMap = new HashMap<String, Integer>();
		//讀取商品數量
		productList = pService.findFrontAllProductByStore(store_id);
		filterSizeMap.put("product", productList.size());
		//讀取套餐數量
		List<ComboBean> comboProductList = cService.getProductAllCombo(store_id);
		filterSizeMap.put("combo",comboProductList.size());
		return filterSizeMap;
	}
	/*
	 * AJAX獲取商品資訊
	 * product_id = 商品ID
	 */
	
	@PostMapping(path = "/getFrontProductModal")
	@ResponseBody
	private ProductBean getFrontProductModal(@RequestParam int product_id) {
		ProductBean productBean = pService.getFrontProductModal(product_id);

		return productBean;
	}
	/*AJAX獲取套餐資訊
	 * sort=分類ID
	 */
	@PostMapping("/getAllCombo")
	@ResponseBody
	private List<ComboBean> getAllCombo(@RequestParam("sort")Integer sort,Model m) {

		String s_store_id = (String)m.getAttribute("store_id");
		int store_id = Integer.parseInt(s_store_id);
		List<ComboBean> productAllCombo = cService.getProductSortCombo(store_id,sort);
		return productAllCombo;
	}
	
	/*AJAX獲取套餐資訊
	 * combo_id = 套餐ID
	 */
	@PostMapping("/getComboModal")
	@ResponseBody
	private ComboBean getComboModal(@RequestParam("combo_id")Integer combo_id,Model m) {

//		String s_store_id = (String)m.getAttribute("store_id");
//		int store_id = Integer.parseInt(s_store_id);
		ComboBean comboBean = cService.findComboById(combo_id);
		return comboBean;
	}
	/*AJAX套餐細項
	 * comboName = 套餐名稱
	 */
	@PostMapping(path = "/getComboProduct")
	@ResponseBody
	private List<ComboBean> getComboProduct(@RequestParam("combo_name")String comboName,Model m){

		String s_store_id = (String)m.getAttribute("store_id");
		int store_id = Integer.parseInt(s_store_id);
		List<ComboBean> comboProduct = cService.getComboProduct(comboName,store_id);
		
		return comboProduct;
	}
	
	/*AJAX更新瀏覽次數
	 * product_id = 商品ID
	 */
	@PostMapping(path = "/updateViewCount")
	@ResponseBody
	private String updateViewCount(@RequestParam("product_id")Integer product_id){
		pService.updateViewCount(product_id, SINGLEVIEW);
		
		return "ok";
	}
	

	
}
