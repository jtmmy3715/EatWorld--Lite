package tw.eatworld.product.model;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import javax.el.ArrayELResolver;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.eatworld.exception.NotFoundException;

@Service
@Transactional
public class ProductClassificationService {
	@Autowired
	private ProductClassificationRepository pcRepo;
	
	//尋找有沒有重複名稱
	public ProductClassificationBean findByNameAndStoreid(String name,Integer storeid) {
		return pcRepo.findByNameAndStoreid(name, storeid);
	}
	

	
	public List<ProductBean> findByClassification(Integer classifiaction_id) {
		Optional<ProductClassificationBean> op = pcRepo.findById(classifiaction_id);
		if(op!=null) {
			ProductClassificationBean classificationBean = op.get();
			Set<ProductBean> productSet = classificationBean.getProductSet();
			return new ArrayList<ProductBean>(productSet);
		}else {
			return Collections.EMPTY_LIST;
		}
		
	}
	
	//藉由商店id尋找商品
	public List<ProductClassificationBean> findByStoreid(Integer storeid) {
		if(storeid!=0) {
			return pcRepo.findByStoreid(storeid);
		}else {
			//TODO
			return Collections.EMPTY_LIST;
		}
	}
	
	public ProductClassificationBean insertClassification(ProductClassificationBean productClassificationBean) {
		return pcRepo.save(productClassificationBean);
	}
	
	public List<ProductClassificationBean> findByNameLike(String name){
		return pcRepo.findByNameLike(name);
	}
	
	public void deleteByClassificationid(Integer classification_id){
		pcRepo.deleteById(classification_id);
	}
	
	public void updateClassification(ProductClassificationBean pClassificationBean){
		pcRepo.save(pClassificationBean);
	}
	
	
}
