package tw.eatworld.event.model;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface EventRepository extends JpaRepository<Event, Integer> {
	
	@Query(value = "select * from discount_event where start_Date <= :today and :today <= end_Date", nativeQuery= true)
	public List<Event> findAllByToday(@Param("today") Date date);

	@Query(value = "select * from discount_event where start_Date > :today", nativeQuery=true)
	public List<Event> findAllAfterToday(@Param("today") Date today);
	
	@Query(value = "select * from discount_event where start_Date <= :today and :today <= end_Date and Event_name like %:searchName%", nativeQuery=true)
	public List<Event> findAllByTodayAndSearchName(@Param("today") Date today, @Param("searchName") String searchName);
	
	@Query(value = "select * from discount_event where start_Date > :today and Event_name like %:searchName%", nativeQuery=true)
	public List<Event> findAllAfterTodaySearchName(@Param("today") Date today, @Param("searchName") String searchName);
	
}
