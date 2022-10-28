package tw.eatworld.client.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

public interface ClientMemberDetailRepository extends JpaRepository<ClientMemberDetail, Integer> {
	
	@Modifying
	@Query("SELECT clientDetailId FROM ClientMemberDetail c WHERE c.clientAdddate between ?1 and ?2")
	public List<ClientMemberDetail> findByAdddateBetween(String date1,String date2);

}
