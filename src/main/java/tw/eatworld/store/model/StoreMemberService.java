package tw.eatworld.store.model;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class StoreMemberService {
	@Autowired
	private StoreMemberRepository sRepository;
	//增
	public StoreMember inset(StoreMember storeMember) {
		return sRepository.save(storeMember);
	}
	//改
	public StoreMember update(StoreMember storeMember) {
		return sRepository.save(storeMember);
	}
	//查
	public StoreMember findById(Integer id) {
		Optional<StoreMember> option = sRepository.findById(id);
		if (option.isPresent()) {
			return option.get();
		}
		return null;
	}
	
	public List<StoreMember> findAll() {
		return sRepository.findAll();
	}
	//刪
	public void delete(Integer id) {
		sRepository.deleteById(id);
	}
	
	public List<StoreMember> findByTime() {
		return sRepository.findByTime();
		
	}
	
	public StoreMember findBysUsername(String username) {
		return sRepository.findBysUsername(username);
	};
	
	public List<StoreMember> findByCategory(int cId){
		return sRepository.findByCategory(cId); 	
	}
	
	public List<StoreMember> findOuter() {
		return sRepository.findOuter();
	} 
	
	public int count(int cId){
		return sRepository.count(cId);
	}
	
	
}
