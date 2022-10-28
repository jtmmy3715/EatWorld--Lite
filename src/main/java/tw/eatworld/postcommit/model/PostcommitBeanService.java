package tw.eatworld.postcommit.model;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.eatworld.post.model.PostBean;

@Service
@Transactional
public class PostcommitBeanService {

	@Autowired
	private PostcommitBeanRepository commitRepo;
	
	public List<PostcommitBean> findAll(){
		return commitRepo.findAll();
	}
	
	public PostcommitBean savecommit(PostcommitBean commitBean) {
		return commitRepo.save(commitBean);
	}
	
	public List<PostcommitBean> findByPostBeanAndPid(PostBean postBean,Integer pid) {
		return commitRepo.findByPostBeanAndPid(postBean,pid);
	}
	
	public List<PostcommitBean> findByPostBean(PostBean postBean) {
		return commitRepo.findByPostBean(postBean);
	}
	
	public List<PostcommitBean> findByPid(Integer pid) {
		return commitRepo.findByPid(pid);
	}
	
	public PostcommitBean findById(int postcommitId) {
		
		Optional<PostcommitBean> op = commitRepo.findById(postcommitId);
		
		if(op.isPresent()) {
			return op.get();
		}
		return null;
	}
	
	public void  delcommit(int postcommitId) {
		commitRepo.deleteById(postcommitId);
	}
	
}
