package tw.eatworld.product.model;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductClassificationRepository extends JpaRepository<ProductClassificationBean, Integer> {
	
	public ProductClassificationBean findByNameAndStoreid(String name,Integer storeid);
	
	public List<ProductClassificationBean> findByStoreid(Integer storeid);
	
	public List<ProductClassificationBean> findByNameLike(String name);
	
}
