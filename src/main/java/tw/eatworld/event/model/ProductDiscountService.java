package tw.eatworld.event.model;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class ProductDiscountService {
	
	@Autowired
	private ProductDiscountRepository pdRepository;
	@Autowired
	private ProductssssssRepository productRepo;
	
	//取得所有 store_id 的產品 List
	public List<Product> readAll(String storeId) {
		Integer store_id = Integer.parseInt(storeId);
		List<Product> allProducts = productRepo.findByStore(store_id);
		
		return allProducts;	
	}
	
	//查詢欲增加折扣的商品
	public Product displayAppend(String product_id) {
		Optional<Product> product = productRepo.findById(Integer.parseInt(product_id));
		return product.get();
	}
	
	//新增一筆產品折扣
	public ProductDiscount insert(ProductDiscount productDiscount, String prodcut_id) {
		//由product_id(product的PK)取得Product Bean(Optional物件.get()取得內容物)塞入ProductDiscount Bean完整所有屬性
		productDiscount.setProduct(productRepo.findById(Integer.parseInt(prodcut_id)).get());  
		pdRepository.save(productDiscount);
		return productDiscount;		
	}
	
	//刪除一筆產品折扣
	public void delete(String PD_id) {
		pdRepository.deleteById(Integer.parseInt(PD_id));
	}
	
	//傳回欲修改優惠產品的原本設定
	public ProductDiscount Update(String PD_id) {
		Optional<ProductDiscount> optional = pdRepository.findById(Integer.parseInt(PD_id));
		return optional.get();		
	}
	
	//修改一筆折扣
	public void Update_Confirm(ProductDiscount productDiscountBean) {	
		pdRepository.save(productDiscountBean);
	}
	
	//查詢Store_id廠商的所有優惠產品
	public List<ProductDiscount> readDiscount(String storeId) {
		Integer store_id = Integer.parseInt(storeId);
		List<ProductDiscount> discountProducts = pdRepository.findByStore(store_id);
		
		return discountProducts;
	}
}
