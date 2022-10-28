package tw.eatworld.postcommit.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.eatworld.post.model.PostBean;

public interface PostcommitBeanRepository extends JpaRepository<PostcommitBean, Integer> {
	
	List<PostcommitBean> findByPostBean(PostBean postBean);
	
	List<PostcommitBean> findByPostBeanAndPid(PostBean postBean,Integer pid);
	
	List<PostcommitBean> findByPid(Integer pid);

}
