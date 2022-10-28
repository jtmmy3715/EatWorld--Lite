package tw.eatworld.booking.model;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import tw.eatworld.client.model.ClientMember;

public interface ClientRepository extends JpaRepository<ClientMemberBean, Integer> {

	
	
}
