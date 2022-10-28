package tw.eatworld.product.model;

import java.io.Console;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Optional;
import java.util.Set;
import java.util.TreeSet;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.eatworld.exception.NotFoundException;


@Service
@Transactional
public class ProductService  {
	@Autowired
	protected ProductRepository pRepo;
	
	//修改照片
	public void editProductPhoto(int product_id, String file_name) {
		
		pRepo.editProductPhoto(product_id, file_name);
	}
	
	public Integer updateSoldStatus(Integer product_id,Integer sold) {
		return pRepo.updateSoldStatus(product_id,sold);
	}

	//搜尋全部
	public List<ProductBean> findAll() {
		return pRepo.findAll();
	}
	//藉由商家ID篩選後傳回商品陣列
	public List<ProductBean> findAllProductByStore(int store_id) {
		Optional<List<ProductBean>> op = pRepo.findAllProductByStore(store_id);
		if(store_id==0) {
			return findAll();
		}
		if (op.isEmpty()) {
			 throw new NotFoundException("no product data by store");
		}
		return	op.get();
	}
	
	//藉由商家ID篩選後傳回前端商品陣列
	public List<ProductBean> findFrontAllProductByStore(int store_id) {
		Optional<List<ProductBean>> op = pRepo.findFrontAllProductByStore(store_id);
		if(store_id==0) {
			return findAll();
		}
		if (op.isEmpty()) {
			 throw new NotFoundException("no product data by store");
		}
		return	op.get();
	}
	
	public List<ProductBean> findBySoldAndStoreid(int sold,int store_id) {
		List<ProductBean> productList = pRepo.findBySoldAndStoreid(sold, store_id);
		if(productList!=null) {
			return productList;
		}else {
			return Collections.EMPTY_LIST;
		}
	}
	
	//新增產品
	public ProductBean insertProduct(ProductBean product) {
		return pRepo.save(product);
	}
	
	//尋找產品
	public ProductBean findByProductId(Integer product_id) {
		Optional<ProductBean> op = pRepo.findById(product_id);
		if(!op.isEmpty()) {
			return op.get();
		}else {
			return null;
		}
	}

	//更新產品資訊
	public ProductBean updateProduct(ProductBean product) {
		return pRepo.save(product);
	}
	
	//更新所有產品資訊
		public List<ProductBean> updateAllProduct(List<ProductBean> products) {
			return pRepo.saveAll(products);
		}

	//刪除產品資訊
	public void deleteProduct(String product_id) {
		Integer id = Integer.parseInt(product_id);
		pRepo.deleteById(id);
	}

	//儲存到購物車中
	
	public ProductBean getFrontProductModal(int product_id) {
		Optional<ProductBean> op = pRepo.findById(product_id);
		if(!op.isEmpty()) {
			return op.get();
		}else {
			throw new NotFoundException("no product data by store_id");
		}
	}
	
	public List<ProductBean> findSortProductByStore(int store_id,int sort){
		
		/* 0 = 全部無排序
		 * 1 = 價格降序
		 * 2= 價格升序
		 * 3= 熱銷降序
		 */
		if(sort == 1) {
			return pRepo.findDescPriceProductByStore(store_id);
			
		}else if(sort == 2) {
			return pRepo.findAscPriceProductByStore(store_id);
		}else if (sort == 3) {
			return pRepo.findDescSaleProductByStore(store_id);
		}else {
			return findFrontAllProductByStore(store_id);
		}
	}
	//更新觀看次數
	public void updateViewCount(int product_id,int count) {
		ProductBean productBean = findByProductId(product_id);
		if(productBean!=null) {
			System.out.println("增加"+count);
			int newCount =productBean.getCount_view()+count;
			productBean.setCount_view(newCount);
			pRepo.save(productBean);
		}else {
			System.out.println("沒增加"+count);
		}
		
	}
	
	
	
	
	

}
