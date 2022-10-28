package tw.eatworld.post.model;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.eatworld.store.model.StoreMember;

@Service
@Transactional
public class PostBeanService {
	
	@Autowired
	private PostBeanRepository pbRepo;
	
	public List<PostBean> findAll(){
		return pbRepo.findAll(Sort.by(Sort.Direction.DESC,"postDate"));
	}
	
	public List<PostBean> findTop3ByPostStateOrderByCountViewDesc(Integer postState){
		return pbRepo.findTop3ByPostStateOrderByCountViewDesc(postState);
	}
	
	public List<PostBean> findByPostStateOrderByCountViewDesc(Integer postState){
		return pbRepo.findByPostStateOrderByCountViewDesc(postState);
	}
	
	public PostBean findById(int postId) {
		Optional<PostBean> op = pbRepo.findById(postId);
		
		if(op.isPresent()) {
			return op.get();
		}
		return null;
	}
	
	public List<PostBean> findByStoreMember(StoreMember storeMember) {
		return pbRepo.findByStoreMember(storeMember);
	}
	
	public PostBean savepost(PostBean postBean) {
		return pbRepo.save(postBean);
	}
	
	public void deleteById(int postId) {
		pbRepo.deleteById(postId);
	}
	
	public Page<PostBean> findAllByPostState(Integer postState,Pageable pageable){
		return pbRepo.findAllByPostState(postState,pageable);
	}
	
	public Page<PostBean> findAllByPostStateAndPostTag(Integer postState,Integer postTag,Pageable pageable){
		return pbRepo.findAllByPostStateAndPostTag(postState,postTag,pageable);
	}
	
	public List<PostBean> findByPostStateAndPostTagOrderByCountViewDesc(Integer postState,Integer postTag){
		return pbRepo.findByPostStateAndPostTagOrderByCountViewDesc(postState,postTag);
	}
	
	public List<PostBean> findByTitleLike(String title) {
		return pbRepo.findByTitleLike(title);
	}
	
	public List<PostBean> findByPostDateLike(String postDate) {
		return pbRepo.findByPostDateLike(postDate);
	}
}
