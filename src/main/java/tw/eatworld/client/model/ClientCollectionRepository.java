package tw.eatworld.client.model;

import java.util.Optional;
import java.util.Set;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;


public interface ClientCollectionRepository extends JpaRepository<ClientCollection, Integer> {
	
//	public Set<ClientCollection> findByClientId(int clientId);

	@Modifying //刪除收藏
	@Query("delete from ClientCollection where client.clientId = ?1 and store.id = ?2")
	public void deleteCollection(int clientId, int storeId);

}
