package tw.eatworld.order.model;

import java.io.Serializable;
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
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonIgnore;

import tw.eatworld.client.model.ClientMember;
import tw.eatworld.store.model.StoreMember;

@Entity
@Table(name = "orderform")
@Component("orderBean")
public class OrderBean implements Serializable {
	@Id
	@Column(name = "order_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int orderid;
	@Column(name = "ordertime")
	private String ordertime;
	@Column(name = "finishtime")
	private String finishtime;
	private int price;
	private int status;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "client_id")
	private ClientMember clientMember;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "store_id")
	private StoreMember storeMember;
	
	@Column(name = "payment_method")
	private Integer paymentmethod;
	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY,mappedBy = "orderBean", cascade = CascadeType.REMOVE)
	private Set<OrderDetailBean> orderDetail = new HashSet<OrderDetailBean>();
	
	//TODO
	//clientMember與storeMember
	public OrderBean() {
		
	}
	


	public int getOrderid() {
		return orderid;
	}




	public void setOrderid(int orderid) {
		this.orderid = orderid;
	}


	public OrderBean(int orderid, String ordertime, String finishtime, int price, int status, ClientMember clientMember,
			 Integer paymentmethod, Set<OrderDetailBean> orderDetail) {
		super();
		this.orderid = orderid;
		this.ordertime = ordertime;
		this.finishtime = finishtime;
		this.price = price;
		this.status = status;
		this.clientMember = clientMember;
		this.paymentmethod = paymentmethod;
		this.orderDetail = orderDetail;
	}

	


	public OrderBean(int status, ClientMember clientMember) {
		super();
		this.status = status;
		this.clientMember = clientMember;
	}



	public String getOrdertime() {
		return ordertime;
	}



	public void setOrdertime(String orderTime) {
		this.ordertime = orderTime;
	}



	public String getFinishtime() {
		return finishtime;
	}



	public void setFinishtime(String finishTime) {
		this.finishtime = finishTime;
	}



	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}





	public ClientMember getClientMember() {
		return clientMember;
	}




	public void setClientMember(ClientMember clientMember) {
		this.clientMember = clientMember;
	}


	public StoreMember getStoreMember() {
		return storeMember;
	}



	public void setStoreMember(StoreMember storeMember) {
		this.storeMember = storeMember;
	}



	public Integer getPaymentmethod() {
		return paymentmethod;
	}




	public void setPaymentmethod(Integer paymentmethod) {
		this.paymentmethod = paymentmethod;
	}




	public Set<OrderDetailBean> getOrderDetail() {
		return orderDetail;
	}



	public void setOrderDetail(Set<OrderDetailBean> orderDetail) {
		this.orderDetail = orderDetail;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}

