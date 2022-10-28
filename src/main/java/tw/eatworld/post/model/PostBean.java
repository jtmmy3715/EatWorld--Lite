package tw.eatworld.post.model;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Where;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

import tw.eatworld.client.model.ClientMember;
import tw.eatworld.postcommit.model.PostcommitBean;
import tw.eatworld.store.model.StoreMember;

@Entity 
@Table(name="post")
@Component
public class PostBean {
	
	@Id
	@Column(name = "post_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer postId;
	
	@Column(name = "title")
	private String title;
	
	@Column(name = "title_photo")
	private String titlePhoto;
	
	@Column(name = "post_content")
	private String postContent;
	
	@Column(name = "post_date")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date postDate;
	
	@Column(name = "update_date")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date updateDate;
	
	@Column(name = "post_state")
	private Integer postState;
	
	@Column(name = "post_tag")
	private Integer postTag;
	
	@Column(name = "count_view")
	private Integer countView; //瀏覽人數
	
	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "store_id")
    private StoreMember storeMember; //廠商id
	
	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "client_id")
    private ClientMember clientMember; //管理者id
	
	@OneToMany(mappedBy = "postBean", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	private List<PostcommitBean> postcommentList; //回覆
	

	public Integer getPostId() {
		return postId;
	}

	public void setPostId(Integer postId) {
		this.postId = postId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getTitlePhoto() {
		return titlePhoto;
	}

	public void setTitlePhoto(String titlePhoto) {
		this.titlePhoto = titlePhoto;
	}

	public String getPostContent() {
		return postContent;
	}

	public void setPostContent(String postContent) {
		this.postContent = postContent;
	}

	public Date getPostDate() {
		return postDate;
	}

	public void setPostDate(Date postDate) {
		this.postDate = postDate;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public Integer getPostState() {
		return postState;
	}

	public void setPostState(Integer postState) {
		this.postState = postState;
	}

	public Integer getCountView() {
		return countView;
	}

	public void setCountView(Integer countView) {
		this.countView = countView;
	}

	public StoreMember getStoreMember() {
		return storeMember;
	}

	public void setStoreMember(StoreMember storeMember) {
		this.storeMember = storeMember;
	}

	public ClientMember getClientMember() {
		return clientMember;
	}

	public void setClientMember(ClientMember clientMember) {
		this.clientMember = clientMember;
	}

	public List<PostcommitBean> getPostcommentList() {
		return postcommentList;
	}

	public void setPostcommentList(List<PostcommitBean> postcommentList) {
		this.postcommentList = postcommentList;
	}

	public Integer getPostTag() {
		return postTag;
	}

	public void setPostTag(Integer postTag) {
		this.postTag = postTag;
	}

	
	
}
