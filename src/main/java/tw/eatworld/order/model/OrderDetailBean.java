package tw.eatworld.order.model;

import java.io.Serializable;

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
import javax.persistence.Transient;

import org.hibernate.annotations.ValueGenerationType;
import org.springframework.stereotype.Component;

import tw.eatworld.product.model.ComboBean;
import tw.eatworld.product.model.ProductBean;
@Entity
@Table(name = "orderdetail")
@Component("orderDetailBean")
public class OrderDetailBean implements Serializable {	
	@Id
	@Column(name = "orderdetail_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int orderdetail_id;
	
	@Column(name = "qulity")
	private int qulity;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "product_id")
	private ProductBean productBean;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "order_id")
	private OrderBean orderBean;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "combo_id")
	private ComboBean comboBean;
	
	@Transient
	private Integer discount_price;
	
	public int getOrderdetail_id() {
		return orderdetail_id;
	}

	public void setOrderdetail_id(int orderdetail_id) {
		this.orderdetail_id = orderdetail_id;
	}

	public OrderDetailBean() {}
	
	public int getQulity() {
		return qulity;
	}

	public void setQulity(int qulity) {
		this.qulity = qulity;
	}



	public ProductBean getProductBean() {
		return productBean;
	}



	public void setProductBean(ProductBean productBean) {
		this.productBean = productBean;
	}



	public OrderBean getOrderBean() {
		return orderBean;
	}



	public void setOrderBean(OrderBean orderBean) {
		this.orderBean = orderBean;
	}

	public ComboBean getComboBean() {
		return comboBean;
	}

	public void setComboBean(ComboBean comboBean) {
		this.comboBean = comboBean;
	}

	public Integer getDiscount_price() {
		return discount_price;
	}

	public void setDiscount_price(Integer discount_price) {
		this.discount_price = discount_price;
	}

}
