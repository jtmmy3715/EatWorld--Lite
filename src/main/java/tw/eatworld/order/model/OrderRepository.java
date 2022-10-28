package tw.eatworld.order.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

public interface OrderRepository extends JpaRepository<OrderBean, Integer> {

	public List<OrderBean> findByStatus(int status);
	@Query(value="select * from orderform where client_id=?2 and status=?1",nativeQuery=true)
	public OrderBean findOrderByStatusAndClientId(int status ,int client);
	
	@Modifying
	@Query(value="update OrderBean set status=?2,ordertime=?3,price=?4,payment_method=?5 where orderid=?1")
	public void updateOrderByStatus(int order_id,int status,String tradeDate,int price,int pay_type);
	
	@Modifying
	@Query(value="update OrderBean set status=?2,finishtime=?3 where orderid=?1")
	public void updateOrderByStatus(int order_id,int status,String finishDate);

	@Query(value="select * from orderform where client_id=?1 and status not in (200)",nativeQuery=true)
	public List<OrderBean> findOrderByClientid(int clientid);
	@Query(value="select * from orderform where store_id=?1 and status not in (200)",nativeQuery=true)
	public List<OrderBean> findOrderByStoreid(int store_id);
	
	//chart ----時間內訂單-----
	@Query(value = "select * from orderform where store_id=?1  and finishtime>=?2 and status not in (200)",nativeQuery=true)
	public List<OrderBean> findThisYearOrderByStoreid(int store_id , String nowDate);
	
	@Query(value = "select * from orderform where store_id=?1  and finishtime>=?3 and finishtime<?2  and status not in (200)",nativeQuery=true)
	public List<OrderBean> findLastYearOrderByStoreid(int store_id , String thisYear,String lastYear);
	
}
