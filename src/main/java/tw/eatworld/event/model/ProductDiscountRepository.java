package tw.eatworld.event.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface ProductDiscountRepository extends JpaRepository<ProductDiscount, Integer> {

	@Query(value = "from ProductDiscount p where p.product.store = :id")
	public List<ProductDiscount> findByStore(Integer id);

}
