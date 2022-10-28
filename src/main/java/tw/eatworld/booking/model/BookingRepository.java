package tw.eatworld.booking.model;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;


public interface BookingRepository extends JpaRepository<BookingBean, Integer> {
	//Repository 儲存區
	//SpringData jpa, table為javabean
	
	//booking storeListBySid
	@Query("SELECT b FROM BookingBean b WHERE b.store_id = ?1")
	public List<BookingBean> FindStorelistBySId(int sid);
	
	//booking clientListByCid
	@Query("SELECT b FROM BookingBean b WHERE b.client_id = ?1")
	public List<BookingBean> FindClientlistByCId(int cid);
	
	
	//booking storeBySid 該店家,日期,時段 訂位數
	@Query("SELECT count(b.booking_id)"
			+ "FROM StoreMemberBean AS s JOIN BookingBean AS b "
			+ "ON s.store_id = b.store_id AND s.store_id = ?1 "
			+ "WHERE b.booking_date = ?2 AND b.booking_period = ?3")
	public int FindStoreBySID(int sid, String date, String period);

}
