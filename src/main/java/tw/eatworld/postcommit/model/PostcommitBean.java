package tw.eatworld.postcommit.model;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

import tw.eatworld.client.model.ClientMember;
import tw.eatworld.post.model.PostBean;
import tw.eatworld.store.model.StoreMember;

@Entity 
@Table(name="postcommit")
@Component
public class PostcommitBean {
	
	public PostcommitBean() {}    
	
	@Id
	@Column(name = "postcommit_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer postcommitId;
	
	@Column(name = "commit_content")
	private String commitContent;
	
	@Column(name = "commit_date")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date commitDate;
	
	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "post_id")
    private PostBean postBean; //文章id
	
	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "store_id")
    private StoreMember storeMember; //廠商id
	
	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "client_id" )
    private ClientMember clientMember; //管理者id
	
	@Column(name ="pid")
    private Integer pid = 0;//父评论，如果不设置，默认为0

	@OneToMany(fetch = FetchType.LAZY)
    @JoinColumn(name = "pid")
	private List<PostcommitBean> commentList;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "reply_store_id")
    private StoreMember replyStoreMember;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "reply_client_id")
    private ClientMember replyClientMember;



	public Integer getPostcommitId() {
		return postcommitId;
	}

	public void setPostcommitId(Integer postcommitId) {
		this.postcommitId = postcommitId;
	}

	public String getCommitContent() {
		return commitContent;
	}

	public void setCommitContent(String commitContent) {
		this.commitContent = commitContent;
	}


	public Date getCommitDate() {
		return commitDate;
	}

	public void setCommitDate(Date commitDate) {
		this.commitDate = commitDate;
	}

	public PostBean getPostBean() {
		return postBean;
	}

	public void setPostBean(PostBean postBean) {
		this.postBean = postBean;
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

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("PostcommitBean [postcommitId=");
		builder.append(postcommitId);
		builder.append(", commitContent=");
		builder.append(commitContent);
		builder.append(", commitDate=");
		builder.append(commitDate);
		builder.append(", postBean=");
		builder.append(postBean);
		builder.append(", storeMember=");
		builder.append(storeMember);
		builder.append(", clientMember=");
		builder.append(clientMember);
		builder.append("]");
		return builder.toString();
	}

	public Integer getPid() {
		return pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

	public List<PostcommitBean> getCommentList() {
		return commentList;
	}

	public void setCommentList(List<PostcommitBean> commentList) {
		this.commentList = commentList;
	}

	public StoreMember getReplyStoreMember() {
		return replyStoreMember;
	}

	public void setReplyStoreMember(StoreMember replyStoreMember) {
		this.replyStoreMember = replyStoreMember;
	}

	public ClientMember getReplyClientMember() {
		return replyClientMember;
	}

	public void setReplyClientMember(ClientMember replyClientMember) {
		this.replyClientMember = replyClientMember;
	}
	
	

}
