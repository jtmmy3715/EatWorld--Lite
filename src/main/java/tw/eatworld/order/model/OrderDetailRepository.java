package tw.eatworld.order.model;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface OrderDetailRepository extends JpaRepository<OrderDetailBean, Integer> {
	
	@Query("from OrderDetailBean where order_id = ?1 and product_id =?2")
	public OrderDetailBean CheckCartItem(int order_id,int product_id);
	
	@Query("from OrderDetailBean where order_id = ?1 and combo_id =?2")
	public OrderDetailBean CheckCartComboItem(int order_id,int combo_id);
	
	
}
