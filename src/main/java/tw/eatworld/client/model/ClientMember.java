package tw.eatworld.client.model;

import java.io.Serializable;

import java.util.LinkedHashSet;

import java.util.HashSet;
import java.util.List;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.OrderBy;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonIgnore;

import tw.eatworld.order.model.OrderBean;
import tw.eatworld.order.model.OrderDetailBean;

@Entity
@Table(name = "clientmember")
@Component
public class ClientMember implements Serializable {
	
	@Id
	@Column(name = "client_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int clientId;
	
	@Column(name = "client_username")
	private String clientusername;
	
	@Column(name = "client_password")
	private String clientPassword;
	
	@Column(name = "client_name")
	private String clientName;
	
	@Column(name = "client_email")
	private String clientEmail;
	
	@Column(name = "client_verify")
	private String clientVerify;
	
	@Column(name = "client_permission")
	private String clientPermission;
	
	@JsonIgnore
	@OneToMany(fetch = FetchType.EAGER,mappedBy = "client",cascade = CascadeType.ALL)
	@OrderBy("collectiontId")
	private Set<ClientCollection> collection = new LinkedHashSet<ClientCollection>();
	
	@JsonIgnore
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "fk_clientmemberdetail_id")
	private ClientMemberDetail clientMemberDetail;
	
	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY,mappedBy = "clientMember", cascade = CascadeType.REMOVE)
	private Set<OrderBean> orderBeans = new HashSet<OrderBean>();

	
	
	
	public ClientMember() {
		
	}
	
	public ClientMember(int clientId, String clientUsername, String clientPassword, String clientName,
			String clientEmail, String clientPermission, ClientMemberDetail clientMemberDetail) {
		this.clientId = clientId;
		this.clientusername = clientUsername;
		this.clientPassword = clientPassword;
		this.clientName = clientName;
		this.clientEmail = clientEmail;
		this.clientPermission = clientPermission;
		this.clientMemberDetail = clientMemberDetail;
	}

	public ClientMember(String clientUsername, String clientPassword, String clientName, String clientEmail,
			String clientVerify, String clientPermission, ClientMemberDetail clientMemberDetail) {
		this.clientusername = clientUsername;
		this.clientPassword = clientPassword;
		this.clientName = clientName;
		this.clientEmail = clientEmail;
		this.clientVerify = clientVerify;
		this.clientPermission = clientPermission;
		this.clientMemberDetail = clientMemberDetail;
	}
	
	public ClientMember(String clientUsername, String clientPassword, String clientName, String clientEmail,
			 String clientPermission, ClientMemberDetail clientMemberDetail) {
		this.clientusername = clientUsername;
		this.clientPassword = clientPassword;
		this.clientName = clientName;
		this.clientEmail = clientEmail;
		this.clientPermission = clientPermission;
		this.clientMemberDetail = clientMemberDetail;
	}

	public int getClientId() {
		return clientId;
	}

	public void setClientId(int clientId) {
		this.clientId = clientId;
	}

	public String getClientUsername() {
		return clientusername;
	}

	public void setClientUsername(String clientUsername) {
		this.clientusername = clientUsername;
	}

	public String getClientPassword() {
		return clientPassword;
	}

	public void setClientPassword(String clientPassword) {
		this.clientPassword = clientPassword;
	}

	public String getClientName() {
		return clientName;
	}

	public void setClientName(String clientName) {
		this.clientName = clientName;
	}

	public String getClientEmail() {
		return clientEmail;
	}

	public void setClientEmail(String clientEmail) {
		this.clientEmail = clientEmail;
	}

	public String getClientPermission() {
		return clientPermission;
	}

	public void setClientPermission(String clientPermission) {
		this.clientPermission = clientPermission;
	}
	

	public String getClientVerify() {
		return clientVerify;
	}

	public void setClientVerify(String clientVerify) {
		this.clientVerify = clientVerify;
	}

	public ClientMemberDetail getClientMemberDetail() {
		return clientMemberDetail;
	}

	public void setClientMemberDetail(ClientMemberDetail clientMemberDetail) {
		this.clientMemberDetail = clientMemberDetail;
	}
	
	//使用者和廠商登入前台判斷session 需要get方法
	public Integer getId() {
		return null;
	}

	public Set<ClientCollection> getCollection() {
		return collection;
	}

	public void setCollection(Set<ClientCollection> collection) {
		this.collection = collection;
	}
	

}

