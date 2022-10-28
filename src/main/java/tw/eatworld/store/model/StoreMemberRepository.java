package tw.eatworld.store.model;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import tw.eatworld.client.model.ClientMember;

public interface StoreMemberRepository extends JpaRepository<StoreMember, Integer> {

	
	public StoreMember findBysUsername(String username);
	
	//當下正在營業的店家
	@Query(value = "select * from storeMember where CONVERT (time(0), GETDATE()) between store_openhours and store_endhours",nativeQuery=true)
	List<StoreMember> findByTime() ;
	
	// 分類查詢
		// select * from store where store_‎category = ? 可以作為link給到網頁做查詢
		@Query(value = "select * from storeMember m join storeClassification c on m.store_‎category = c.category_id where m.store_‎category=:cId",nativeQuery=true)
		List<StoreMember> findByCategory(int cId) ;
		
		@Query(value = "select * from storeMember m join storeClassification c on m.store_‎category = c.category_id ",nativeQuery=true)
		List<StoreMember> findOuter() ;

		@Query(value = "select count(*) from storeMember m join storeClassification c on m.store_‎category = c.category_id where m.store_‎category=:cId",nativeQuery=true)
		int count(int cId);
		
	
}
