package tw.eatworld.product.model;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Optional;
import java.util.Set;
import java.util.TreeSet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.eatworld.exception.NotFoundException;
@Service
@Transactional
public class ComboService {
	@Autowired
	private ProductRepository pRepo;
	@Autowired
	private ComboRepository cRepo;
	//新增套餐內容
	public List<ComboBean> insertComboProduct(List<ComboBean> comboBeans ) {	
		return cRepo.saveAll(comboBeans);
	}
	//刪除套餐內容商品
	public void deleteComboProduct(String combo_id) {
		Integer id = Integer.parseInt(combo_id);
		cRepo.deleteById(id);
	}
	//刪除套餐
	public void deleteCombo(int store_id, String comboName) {
		Optional<List<ProductBean>> op = pRepo.findAllProductByStore(store_id);
		List<ComboBean> comboList = new ArrayList<ComboBean>();
		if(op.isEmpty()) {
			throw new NotFoundException("no product data by store");
		}
		List<ProductBean> productList = op.get();
		for (ProductBean productBean : productList) {
			for (ComboBean comboBean : productBean.getCombo()) {
				if(comboBean.getCombo_name().equals(comboName)) {
					comboList.add(comboBean);
				}
			}
		}
		cRepo.deleteAll(comboList);
	}

	
	//取得商家所有套餐
	public List<ComboBean> getProductAllCombo(int store_id) {
		Set<ComboBean> comboTreeSet = new TreeSet<ComboBean>(new Comparator<ComboBean>() {
			@Override
			public int compare(ComboBean o1, ComboBean o2) {
				return o1.getCombo_name().compareTo(o2.getCombo_name());
			}
		});
		Optional<List<ProductBean>> op = pRepo.findAllProductByStore(store_id);
		if(op.isEmpty()) {
			throw new NotFoundException("no product data by store");
		}
		for (ProductBean bean : op.get()) {
			Set<ComboBean> combo = bean.getCombo();
			for (ComboBean c : combo) {			
				comboTreeSet.add(c);
			}
		}	
		for (ComboBean combo : comboTreeSet) {
			System.out.println(combo);
		}
		ArrayList<ComboBean> comboList = new ArrayList<>(comboTreeSet);
		
		return comboList;
	}
	
	//取得商家所有套餐
	public List<ComboBean> getProductSortCombo(int store_id,Integer sort) {
		Set<ComboBean> comboTreeSet;
		if(sort==1) {
			//價格大到小
			comboTreeSet = new TreeSet<ComboBean>(new Comparator<ComboBean>() {
				@Override
				public int compare(ComboBean o1, ComboBean o2) {
					if(o1.getPrice()>o2.getPrice()) {
						return -1;
					}else if(o1.getPrice()<o2.getPrice()){
						return 1;
					}else {
						return o1.getCombo_name().compareTo(o2.getCombo_name());
					}
				}
			});
		}else if(sort==2){
			//價格小到大
			comboTreeSet = new TreeSet<ComboBean>(new Comparator<ComboBean>() {
				@Override
				public int compare(ComboBean o1, ComboBean o2) {
					if(o1.getPrice()<o2.getPrice()) {
						return -1;
					}else if(o1.getPrice()>o2.getPrice()){
						return 1;
					}else {
						return o1.getCombo_name().compareTo(o2.getCombo_name());
					}
				}
			});
		}else {
			//無排序
			comboTreeSet = new TreeSet<ComboBean>(new Comparator<ComboBean>() {
				@Override
				public int compare(ComboBean o1, ComboBean o2) {
					return o1.getCombo_name().compareTo(o2.getCombo_name());
				}
			});
		}
		
		Optional<List<ProductBean>> op = pRepo.findAllProductByStore(store_id);
		if(op.isEmpty()) {
			throw new NotFoundException("no product data by store");
		}
		for (ProductBean bean : op.get()) {
			Set<ComboBean> combo = bean.getCombo();
			for (ComboBean c : combo) {			
				comboTreeSet.add(c);
			}
		}	
		for (ComboBean combo : comboTreeSet) {
			System.out.println(combo);
		}
		ArrayList<ComboBean> comboList = new ArrayList<>(comboTreeSet);
		
		return comboList;
	}
	
	//取得特定套餐內容
	public List<ComboBean> getComboProduct(String comboName, int store_id) {
		ArrayList<ComboBean> comboList = new ArrayList<ComboBean>();
		Optional<List<ProductBean>> op = pRepo.findAllProductByStore(store_id);
		if (op.isEmpty()) {
			 throw new NotFoundException("no product data by store");
		}
		for (ProductBean productBean : op.get()) {
			Set<ComboBean> comboSet = productBean.getCombo();
			for (ComboBean combo : comboSet) {
				if(combo.getCombo_name().equals(comboName)) {
					comboList.add(combo);
				}
			}
		}
		
		return comboList;
	}
	//尋找套餐ID
	public ComboBean findComboById(Integer combo_id) {
		Optional<ComboBean> op = cRepo.findById(combo_id);
		if(!op.isEmpty()) {
			return op.get();
		}else {
			 throw new NotFoundException("no product data by store");
		}
	}
	//更新套餐價格
	public List<ComboBean> updateComboPrice(String comboName,Integer price,Integer store_id) {
		List<ComboBean> comboProductList = getComboProduct(comboName,store_id);
		for (ComboBean comboBean : comboProductList) {
			comboBean.setPrice(price);
		}
		for (ComboBean comboBean : comboProductList) {
			System.out.println("price"+comboBean.getPrice()); 
		}
		
		return cRepo.saveAll(comboProductList);
		
	}
	
}
