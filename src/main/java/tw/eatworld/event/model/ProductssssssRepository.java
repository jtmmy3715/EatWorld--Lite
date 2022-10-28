package tw.eatworld.event.model;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface ProductssssssRepository extends JpaRepository<Product, Integer> {

	
	public List<Product> findByStore(int store_id);
		
	@Query(value = "select product_id,name,content,price,photo,store_id from product where product_ID in (select [fk_product_id] from [Event_Product] where [fk_product_id] in (select [product_ID] from [product] where [store_id] =2) and [fk_event_id] =:id)", nativeQuery=true)	  
	public List<Product> findEventStore2(Integer id);
}
