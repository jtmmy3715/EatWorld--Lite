package tw.eatworld.product.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import tw.eatworld.product.model.*;
import tw.eatworld.store.model.StoreMember;
import tw.eatworld.order.model.*;

//import tw.eatworld.service.OrderService;


@Controller
@SessionAttributes(names = {"productList","comboName","comboProductList","comboList","user","classificationList"})
@RequestMapping("/ProductController")
public class ProductController {
	
	@Autowired
	private ProductService pService;
	
	@Autowired
	private ComboService cService;
	
	@Autowired
	private ProductClassificationService pcService;
	
	private final int IS_NOT_SOLD = 0;
	private final int IS_SOLD = 1;
	private final String INIT_CLASSIFICATION_NAME = "預設分類";
	private final Integer STORE_ID = 1;
	List<ProductBean> productList = new ArrayList<ProductBean>();
	
	
	@GetMapping(path = "/backedIndex")
	public String openBackedIndex() {
		return "/backendJsp/index";
	}
	
	@GetMapping(path = "/frontIndex")
	public String openFrontIndex() {
		return "/frontJsp/frontIndex";
	}
	
	
	/*---------------------------------------------菜單顯示方法開始-------------------------------------------------------*/
	/*
	 * 初始頁面
	 */
	@GetMapping("/initData")
	private String initData(Model m) {
//		m.addAttribute("store_id",0);
//		return "redirect:/ProductController/getAllData";
		return "backendJsp/backendProduct/productDisplay";
	
	}
	/*
	 * 修改照片
	 */
	@PostMapping("/editPhoto")
	private String editPhoto(@RequestParam("product_id") String product_id,@RequestParam("file_name") String file_name) throws ServletException, IOException {
		int id = Integer.parseInt(product_id) ;

		pService.editProductPhoto(id, file_name);
		
		return "redirect:/ProductController/initData";
	}
	/*修改產品內容
	 * 
	 */
	@PostMapping(path = "/editProduct")
	private String editProduct(@RequestParam("index") String s_index,@RequestParam("tr_index") String s_tr_index,@RequestParam("value") String value,Model m)  {
//			int store_id =(Integer) m.getAttribute("store_id") ;
			StoreMember storeMember = (StoreMember)m.getAttribute("user");
			int store_id;
			if(storeMember==null) {
				store_id=STORE_ID;
			}else {
				store_id = storeMember.getId();
			}
		
			productList = pService.findAllProductByStore(store_id);
			//0起算橫的
			int index = Integer.parseInt(s_index)-1;
//			//有照片0起算直的
			int tr_index = Integer.parseInt(s_tr_index); 
//			String value = .getParameter("value");
			System.out.println("大小"+productList.size());
			ProductBean productBean = productList.get(tr_index);
			if(index==0) {
				productBean.setName(value);
			}else if (index==1) {
				productBean.setContent(value);
			}else if (index==2) {
				productBean.setPrice(Integer.parseInt(value));
			}else if (index==3) {
				productBean.setInventory(Integer.parseInt(value));
			}else if (index==4) {
				productBean.setSold(Integer.parseInt(value));
			}
		
			pService.updateProduct(productBean);
			System.out.println("index"+index+"tr_index"+tr_index+value);

			return "redirect:/ProductController/initData";
		
	}
	/*刪除產品
	 * 
	 */
	@PostMapping(path = "/deleteProduct")
	private String deleteProduct(@RequestParam("product_id") String product_id)  {
		pService.deleteProduct(product_id);

		return "redirect:/ProductController/initData";

		
	}
	//跳往新增頁面
	@PostMapping(path = "/gotoInsertJsp")
	private String gotoInsertJsp(Model m) {

		StoreMember storeMember = (StoreMember)m.getAttribute("user");
		int store_id;
		if(storeMember==null) {
			store_id=STORE_ID;
		}else {
			store_id = storeMember.getId();
		}
		List<ProductClassificationBean> classificationList = pcService.findByStoreid(store_id);
		m.addAttribute("classificationList",classificationList);
		System.out.println("form類別大小"+classificationList.size());
			
		
		
		return "backendJsp/backendProduct/productForm";
		
		
	}
	/*category :點擊0全部，1上架，2下架，3商品分類
	 * product_category :3商品分類的細項
	 */
//	//AJAX取得分類的產品內容
	@GetMapping(path = "/getCategoryDataByStoreid")
	@ResponseBody
	private List<ProductBean> getCategoryDataByStoreid(@RequestParam("category") int category,@RequestParam("product_category") int product_category,Model m) throws ServletException, IOException {

		StoreMember storeMember = (StoreMember)m.getAttribute("user");
		int store_id;
		if(storeMember==null) {
			store_id=STORE_ID;
		}else {
			store_id = storeMember.getId();
			System.out.println(store_id);
			/* 0 取得所有商品
			 * 1 取得上架商品
			 * 2 取得下架商品
			 * 3 取得商品類別
			 */
			//點擊全部
			switch (category) {
			case 0:
				//選取全部商品
				productList = pService.findAllProductByStore(store_id);
				break;
			case 1:
				productList = pService.findBySoldAndStoreid(IS_SOLD, store_id);
				break;
			case 2:
				productList = pService.findBySoldAndStoreid(IS_NOT_SOLD, store_id);
				break;
			case 3:
				//選取商品類別
				productList = pcService.findByClassification(product_category);
				break;
				
			default:
				break;
			}
		}

		System.out.println("讀取數量:"+productList.size());
		
		return productList;
	}

	
	//新增產品
	@PostMapping(path = "/gotoProductInsert")
	private String gotoProductInsert(@RequestParam Map<String, String> product,@RequestParam("product_datafile") MultipartFile mf,Model m) throws IllegalStateException, IOException  {
		
		StoreMember storeMember = (StoreMember)m.getAttribute("user");
		int store_id;
		if(storeMember==null) {
			store_id=STORE_ID;
		}else {
			store_id = storeMember.getId();
		}
		
		String name = product.get("product_name");
		String content =  product.get("product_content");
		int price = Integer.parseInt( product.get("product_price"));
		int inventory = Integer.parseInt( product.get("product_inventory"));
		String sold =  product.get("product_sold");
		Integer smallClassification = Integer.parseInt( product.get("product_small_classification"));
		//int store_id =Integer.parseInt( product.get("store_id")) ;
		//日期格式設定
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
		String fileName = mf.getOriginalFilename();
		fileName = dateFormat.format(new Date()) +"_"+fileName;
		System.out.println("fileName:"+ fileName);
		String saveFileDir = "D:/upload";
		File saveFilePath = new File(saveFileDir,fileName);
//		byte[] b = mf.getBytes();
		mf.transferTo(saveFilePath);
		if(fileName==null || fileName.length()==0) {
			fileName = " ";
		}
		

		//TODO
		//少了選擇商品分類
		ProductClassificationBean classificationBean = new ProductClassificationBean();
		classificationBean.setProduct_category_id(smallClassification);
		ProductBean productBean = new ProductBean(0,name,content, price, fileName , inventory, sold.equals("0")?IS_NOT_SOLD:IS_SOLD, classificationBean, store_id);
		productBean.setCount_sale(0);
		productBean.setCount_view(0);
		productBean.setInventory(inventory);
		ProductBean isSave = pService.insertProduct(productBean);
	

		return "redirect:/ProductController/initData";
	}

	
	//AJAX更新銷售狀態
	/*
	 * 1改為上架
	 * 0改為下架
	 */
	@PostMapping(path = "/updateSoldStatus")
	@ResponseBody
	private String updateSoldStatus(@RequestParam("product_id") Integer product_id,@RequestParam("sold") Integer sold) {
		System.out.println("更改狀態"+sold);
		Integer row = pService.updateSoldStatus(product_id,sold);
		//AJAX用
		if(row>0) {
			return "ok";
		}else {
			return "error";
		}
	}
	
	
	/*---------------------------------------------菜單顯示方法結束---------------------------------------------------------
	 * 
	 * --------------------------------------------套餐顯示方法開始---------------------------------------------------------*/
	/*刪除套餐
	 * combo_name = 套餐名稱
	 */
	@PostMapping("/deleteCombo")
	private String deleteCombo(@RequestParam("combo_name") String combo_name ,Model m){
		

		StoreMember storeMember = (StoreMember)m.getAttribute("user");
		int store_id;
		if(storeMember==null) {
			store_id=STORE_ID;
		}else {
			store_id = storeMember.getId();
		}
		System.out.println(store_id+"/"+combo_name);
		
		cService.deleteCombo(store_id,combo_name);
		List<ComboBean> comboButtonList = cService.getProductAllCombo(store_id);

		m.addAttribute("comboList",comboButtonList);
//			if (comboButtonList.size()>0) {
//				comboDisplay( store_id, comboButtonList.get(0));
		m.addAttribute("store_id",store_id);
//		m.addAttribute("comboName",comboButtonList.get(0));
		return "redirect:/ProductController/comboInit";
				//TODO
//			}else {
//				return "redirect:/ProductController/initData";
//			}
	}

	/*套餐刪除
	 * combo_id
	 */

	/*@PostMapping("/comboInsert")
	private String deleteComboList(@RequestParam("combo_id") String combo_id,@RequestParam("comboName") String comboName) throws ServletException, IOException {
		System.out.println("delete"+combo_id+"/"+comboName);
		
		cService.deleteComboProduct(combo_id);
		
		return "redirect:/ProductController/comboDisplay";
	}*/

	/*AJAX更新套餐價格
	 * combo_name = 套餐名稱
	 * price =想修改的價格
	 */
	@PostMapping("/updateComboPrice")
	@ResponseBody
	private String updateComboPrice(@RequestParam("combo_name") String combo_name,@RequestParam("price") Integer price,Model m) throws ServletException, IOException {

		StoreMember storeMember = (StoreMember)m.getAttribute("user");
		int store_id;
		if(storeMember==null) {
			store_id=STORE_ID;
		}else {
			store_id = storeMember.getId();
		}
		
		List<ComboBean> comboList = cService.updateComboPrice(combo_name,price,store_id);
		if(comboList.size()>0) {
			return "ok";
		}else {
			return "error";
		}
		
	}
	/*套餐初始化
	 * 
	 * 
	 */
	@GetMapping("/comboInit")
	private String comboInit(Model m)  {

		StoreMember storeMember = (StoreMember)m.getAttribute("user");
		int store_id;
		if(storeMember==null) {
			store_id=STORE_ID;
			return "redirect:/ProductController/initData";
		}else {
			store_id = storeMember.getId();
			List<ComboBean> comboButtonList = cService.getProductAllCombo(store_id);
			m.addAttribute("comboList", comboButtonList);
//				if (comboButtonList.size()>0&&store_id!=0) {
//					comboDisplay(store_id, comboButtonList.get(0));
					m.addAttribute("store_id",store_id);
					m.addAttribute("comboName",comboButtonList.get(0));
					return "backendJsp/backendProduct/comboDisplay";
//				}
//					else {
//					return "redirect:/ProductController/initData";
//				}	
		}

	}
	/*
	 * 前往套餐新增頁面
	 */
	@PostMapping("/goToComboPage")
	private String goToComboPage() {
		System.out.println("addPage");
		return "backendJsp/backendProduct/comboForm";
	}
	
	/*AJAX取得所有套餐
	 * 
	 */
	@PostMapping("/getAllCombo")
	@ResponseBody
	private List<ComboBean> getAllCombo(Model m) {

		StoreMember storeMember = (StoreMember)m.getAttribute("user");
		int store_id;
		if(storeMember==null) {
			store_id=STORE_ID;
		}else {
			store_id = storeMember.getId();
		}
		List<ComboBean> productAllCombo = cService.getProductAllCombo(store_id);
		return productAllCombo;
	}
	/*AJAX取得特定告餐內容
	 * comboName = 套餐名稱
	 */
	@PostMapping(path = "/getComboProduct")
	@ResponseBody
	private List<ComboBean> getComboProduct(@RequestParam("combo_name")String comboName,Model m){

		StoreMember storeMember = (StoreMember)m.getAttribute("user");
		int store_id;
		if(storeMember==null) {
			store_id=STORE_ID;
		}else {
			store_id = storeMember.getId();
		}
		List<ComboBean> comboProduct = cService.getComboProduct(comboName,store_id);
		
		return comboProduct;
	}
	/*form表單傳進來新增套餐
	 * combo = 所有表單內容
	 * mf = 套餐照片
	 */
	@PostMapping(path = "/insertCombo")
	private String insertCombo(@RequestParam Map<String, String> combo,@RequestParam("combo_datafile") MultipartFile mf) throws IOException {


		//套餐名稱
		String name = combo.get("combo_name");
		//套餐價格
		Integer price = Integer.parseInt(combo.get("combo_price"));
		//取得批次增加的ID
		String list = combo.get("combo_product_list");
		//套餐商品陣列
		String[] productStringList = list.split(",");

		//日期格式設定
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
		String fileName = mf.getOriginalFilename();
		fileName = dateFormat.format(new Date()) +"_"+fileName;
		System.out.println("fileName:"+ fileName);
		String saveFileDir = "D:/upload";
		File saveFilePath = new File(saveFileDir,fileName);
//		byte[] b = mf.getBytes();
		mf.transferTo(saveFilePath);
		if(fileName==null || fileName.length()==0) {
			fileName = " ";
		}
		List<ComboBean> comboBeanList = new ArrayList<ComboBean>();
		for (String product_id : productStringList) {
			ProductBean productBean = new ProductBean();
			productBean.setProduct_id(Integer.parseInt(product_id));
			ComboBean comboBean = new ComboBean(name,price,fileName,productBean);
			comboBeanList.add(comboBean);
		}
		cService.insertComboProduct(comboBeanList);
		
		
		return "redirect:/ProductController/comboInit";
		
	}
	
	/* --------------------------------------------套餐顯示方法結束---------------------------------------------------------
	*	
	* ---------------------------------------------商品分類方法開始---------------------------------------------------------*/
	/*
	 * 取得所有分類
	 * 
	 */
	@PostMapping(path = "/getAllClassificationByStoreid")
	@ResponseBody
	private List<ProductClassificationBean> getAllClassificationByStoreid(Model m) {

		StoreMember storeMember = (StoreMember)m.getAttribute("user");
		int store_id;
		if(storeMember==null) {
			store_id=STORE_ID;
			List<ProductClassificationBean> classificationList = pcService.findByStoreid(store_id);
			for (ProductClassificationBean productClassificationBean : classificationList) {
				System.out.println("分類ID:"+productClassificationBean.getProduct_category_id());
			}
			return classificationList;
		}else {
			store_id = storeMember.getId();
			store_id = storeMember.getId();
			List<ProductClassificationBean> classificationList = pcService.findByStoreid(store_id);
			return classificationList;
		}

	}
	/*AJAX商家新增分類
	 * 
	 */
	@PostMapping(path = "/insertClassification")
	@ResponseBody
	private String insertClassification(Model m) {
		
		StoreMember storeMember = (StoreMember)m.getAttribute("user");
		int store_id;
		if(storeMember==null) {
			store_id=STORE_ID;
			return "error";
		}else {
			store_id = storeMember.getId();
			List<ProductClassificationBean> classificationList = pcService.findByNameLike(INIT_CLASSIFICATION_NAME+"%");
			String name = "預設分類0";
			//預設分類不為空
			if(!classificationList.isEmpty()) {
				for (ProductClassificationBean classificationBean : classificationList) {
					name=classificationBean.getName();
					
				}
			}
			String str1 = name.substring(0, name.indexOf("類"));
			//預設分類後數字
		    String str2 = name.substring(str1.length()+1, name.length());
		    System.out.println("擷取預設分類之後字串:"+str2);
			int last_number = Integer.parseInt(str2);
			//得知已有的分類數後+1
			ProductClassificationBean classificationBean = new ProductClassificationBean(INIT_CLASSIFICATION_NAME+(last_number+1),store_id);
			pcService.insertClassification(classificationBean);
			return "ok";
		}

 	}
	
	/*修改分類名稱的方法
	 * classification_id 被修改的分類id
	 * name 想要修改成的名稱
	 */
	@PostMapping(path = "/updateClassification")
	@ResponseBody
	private String updateClassification(@RequestParam("classification_id") int classification_id,@RequestParam("name") String name ,Model m) throws ServletException, IOException {
		StoreMember storeMember = (StoreMember)m.getAttribute("user");
		int store_id;
		if(storeMember==null) {
			store_id=STORE_ID;
			return "error";
		}else {
			System.out.println("名字"+name);
			store_id = storeMember.getId();
			if(name.isEmpty()) {
				//執行刪除分類的方法
				pcService.deleteByClassificationid(classification_id);
				
			}else {
				//執行修改分類的方法
				ProductClassificationBean classificationBean = new ProductClassificationBean(classification_id,name,store_id);
				pcService.updateClassification(classificationBean);
			}
			return "ok";
		}

 	}
	

	
	
}
