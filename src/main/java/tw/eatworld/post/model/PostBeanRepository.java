package tw.eatworld.post.model;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import tw.eatworld.store.model.StoreMember;

public interface PostBeanRepository extends JpaRepository<PostBean, Integer> {
	
	List<PostBean> findTop3ByPostStateOrderByCountViewDesc(Integer postState);

	List<PostBean> findByStoreMember(StoreMember storeMember);
	
	List<PostBean> findByPostStateOrderByCountViewDesc(Integer postState);
	
	@Query(value = "from PostBean where postDate like concat('%',?1,'%') ")
	public List<PostBean> findByPostDateLike(String postDate);
	
	List<PostBean> findByPostStateAndPostTagOrderByCountViewDesc(Integer postState,Integer postTag);
	
	Page<PostBean> findAllByPostState(Integer postState,Pageable pageable);
	
	Page<PostBean> findAllByPostStateAndPostTag(Integer postState,Integer postTag,Pageable pageable);
	
	@Query(value = "from PostBean where title like concat('%',?1,'%') ")
	public List<PostBean> findByTitleLike(String title);
}
