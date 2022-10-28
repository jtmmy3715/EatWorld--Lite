package tw.eatworld.client.model;

import java.util.List;
import java.util.Optional;
import java.util.Set;

import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service
@Transactional
public class ClientMemberService {
	
	@Autowired
	private ClientMemberRepository cRepo;
	
	@Autowired
	private ClientMemberDetailRepository cDetailRepo;
	
	@Autowired
	private ClientCollectionRepository cCollectionRepo;
	
	public ClientMember saveClient(ClientMember client) {
		return cRepo.save(client);
	}
	
	public void deleteClient(int clientId) {
		 cRepo.deleteById(clientId);
	}
	
	public ClientMember getClientById(int clientId) {
		Optional<ClientMember> client = cRepo.findById(clientId);
		if(client.isEmpty()) {
			return null;
		}
		return client.get();
	}
	
	public ClientMemberDetail getClientDetailById(int clientDetailId) {
		Optional<ClientMemberDetail> clientDetail = cDetailRepo.findById(clientDetailId);
		if(clientDetail.isEmpty()) {
			return null;
		}
		return clientDetail.get();
	}
	
	public List<ClientMember> showAllClients() {
		return cRepo.findAll();
	}
	
	public ClientMember checkLogin(String username) {

		ClientMember client = cRepo.findByClientusername(username);
		return client;
		
	}
	
	public ClientMember checkUsername(String username) {
		return cRepo.findByClientusername(username);
	}
	
	public boolean checkEmail(String checkmail) {
		ClientMember email = cRepo.findByClientEmail(checkmail);
		if(email==null) {
			return true;
		}
		return false;
	}
	
	public ClientMember findByEmail(String checkmail) {
		ClientMember client = cRepo.findByClientEmail(checkmail);
		if(client==null) {
			return null;
		}
		return client;
	}
	
	public void changePwd(String newPwd, int clientId) {
		cRepo.updateClientPwd(newPwd, clientId);
	}
	
	public ClientMember findByClientVerify(String uuid) {
		ClientMember client = cRepo.findByClientVerify(uuid);
		if(client==null) {
			return null;
		}
		return client;
	}
	
//	//找收藏
//	public Set<ClientCollection> getCollectionByClientId(int clientId) {
//		Set<ClientCollection> collections = cCollectionRepo.findByClientId(clientId);
//		return collections;
//	}
//	
	//新增收藏
	public ClientCollection saveCollection(ClientCollection collection) {
		return cCollectionRepo.save(collection);
	}
	
	//刪除收藏
	public void deleteCollection(int clientId, int storeId) {
		System.out.println("刪除ID:"+storeId);
		cCollectionRepo.deleteCollection(clientId,storeId);
	}
	
	public List<ClientMemberDetail> countReg(String date1,String date2) {
		 return cDetailRepo.findByAdddateBetween(date1,date2);
	}
	
}
