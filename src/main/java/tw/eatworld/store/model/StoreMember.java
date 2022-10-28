package tw.eatworld.store.model;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.Set;

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
import javax.persistence.OneToOne;
import javax.persistence.OrderBy;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;

import tw.eatworld.client.model.ClientCollection;
import tw.eatworld.order.model.OrderBean;
import tw.eatworld.store.*;

@Entity

@Table(name = "storemember")
public class StoreMember  {
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "store_id")
	private Integer id;
	
	@Column(name = "store_username")
	private String sUsername;
	@Column(name = "store_password")
	private String sPwd;
	@Column(name = "store_name")
	private String sName;
	@Column(name = "store_logo")
	private String sLogo;
	@Column(name = "store_introduction")
	private String sIntroduction;
	@Column(name = "store_address")
	private String sAddress;
	@Column(name = "store_phone")
	private String sPhone;
	@Column(name = "store_email")
	private String sEmail;
	@Column(name = "store_openhours")
	private String openTime;
	@Column(name = "store_endhours")
	private String endTime;
	@Column(name = "store_adddate")
	private String addDate;
	@Column(name = "store_booking")
	private Integer sBooking;
	
	
	
	@ManyToOne
	@JoinColumn(name = "store_‎category",referencedColumnName = "category_id")
	private StoreClassification storeclassification;
	
	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY,mappedBy = "storeMember", cascade = CascadeType.REMOVE)
	private Set<OrderBean> orderBeans = new HashSet<OrderBean>();
	
//	@JsonBackReference
//	@ManyToOne(fetch=FetchType.LAZY)
//	@JoinColumn(name = "store_‎category")
//	private StoreClassification storeclassification;
	
	
	@JsonIgnore
	@OneToMany(fetch = FetchType.EAGER,mappedBy = "store",cascade = CascadeType.ALL)
	private Set<ClientCollection> collection = new LinkedHashSet<ClientCollection>();
	
	
	public StoreMember() {
	}
	
	

	public StoreMember(String sUsername, String sPwd, String sName, String sAddress, String sPhone, String sEmail,
			String openTime, String endTime,String sIntroduction) {
		super();
		this.sUsername = sUsername;
		this.sPwd = sPwd;
		this.sName = sName;
		this.sAddress = sAddress;
		this.sPhone = sPhone;
		this.sEmail = sEmail;
		this.openTime = openTime;
		this.endTime = endTime;
		this.sIntroduction=sIntroduction;
	}

	

	public StoreMember(String sUsername, String sPwd, String sName, String sAddress, String sPhone, String sEmail,
			String openTime, String endTime, String sIntroduction, StoreClassification classification) {
		this.sUsername = sUsername;
		this.sPwd = sPwd;
		this.sName = sName;
		this.sAddress = sAddress;
		this.sPhone = sPhone;
		this.sEmail = sEmail;
		this.openTime = openTime;
		this.endTime = endTime;
		this.sIntroduction=sIntroduction;
		this.storeclassification=classification;
	}



	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getsUsername() {
		return sUsername;
	}
	public void setsUsername(String sUsername) {
		this.sUsername = sUsername;
	}
	public String getsPwd() {
		return sPwd;
	}
	public void setsPwd(String sPwd) {
		this.sPwd = sPwd;
	}
	public String getsName() {
		return sName;
	}
	public void setsName(String sName) {
		this.sName = sName;
	}
	public String getsLogo() {
		return sLogo;
	}
	public void setsLogo(String sLogo) {
		this.sLogo = sLogo;
	}
	public String getsIntroduction() {
		return sIntroduction;
	}
	public void setsIntroduction(String sIntroduction) {
		this.sIntroduction = sIntroduction;
	}
	public String getsAddress() {
		return sAddress;
	}
	public void setsAddress(String sAddress) {
		this.sAddress = sAddress;
	}
	public String getsPhone() {
		return sPhone;
	}
	public void setsPhone(String sPhone) {
		this.sPhone = sPhone;
	}
	public String getsEmail() {
		return sEmail;
	}
	public void setsEmail(String sEmail) {
		this.sEmail = sEmail;
	}
	public String getOpenTime() {
		return openTime;
	}
	public void setOpenTime(String openTime) {
		this.openTime = openTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public String getAddDate() {
		return addDate;
	}
	public void setAddDate(String addDate) {
		this.addDate = addDate;
	}
	public Integer getsBooking() {
		return sBooking;
	}
	public void setsBooking(Integer sBooking) {
		this.sBooking = sBooking;
	}



	public StoreClassification getStoreclassification() {
		return storeclassification;
	}

	public void setStoreclassification(StoreClassification storeclassification) {
		this.storeclassification = storeclassification;
	}

	//使用者和廠商登入前台判斷session 需要get方法
	public Integer getClientId() {
		return null;
	}



	public Set<ClientCollection> getCollection() {
		return collection;
	}

	public void setCollection(Set<ClientCollection> collection) {
		this.collection = collection;
	}
	
	
}
