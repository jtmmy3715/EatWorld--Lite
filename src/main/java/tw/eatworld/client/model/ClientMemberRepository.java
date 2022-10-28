package tw.eatworld.client.model;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;


public interface ClientMemberRepository extends JpaRepository<ClientMember, Integer> {
	
	public ClientMember findByClientusername(String username);
	
	public ClientMember findByClientEmail(String checkmail);
	
	public ClientMember findByClientVerify(String uuid);
	
	@Modifying
	@Query("update ClientMember set clientPassword = ?1 where clientId = ?2")
	public void updateClientPwd(String newPwd,int clientId);

}
