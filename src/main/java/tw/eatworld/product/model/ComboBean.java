package tw.eatworld.product.model;

import java.io.Serializable;
import java.util.HashSet;
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
import javax.persistence.Transient;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonIgnore;

import tw.eatworld.order.model.OrderDetailBean;
@Entity
@Table(name = "productcombo")
@Component("comboBean")
public class ComboBean implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "combo_id")
	private Integer combo_id;
	@Column(name = "name")
	private String combo_name;

	private int price;
	private String photo;
	

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "product_id")
	private ProductBean productBean;
	
	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY,mappedBy = "comboBean", cascade = CascadeType.REMOVE)
	private Set<OrderDetailBean> orderDetail = new HashSet<OrderDetailBean>();
	
	
	public ComboBean() {
		// TODO Auto-generated constructor stub
	}



	

	public ComboBean(String combo_name, int price, String photo, ProductBean productBean) {
		super();
		this.combo_name = combo_name;
		this.price = price;
		this.photo = photo;
		this.productBean = productBean;
	}





	public ComboBean(String comboName, ProductBean productBean) {
		super();
		this.combo_name = comboName;
		this.productBean = productBean;
	}


	public ComboBean(Integer combo_id, String comboName) {
		super();
		this.combo_id = combo_id;
		this.combo_name = comboName;
	}


	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}


	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}



	public String getCombo_name() {
		return combo_name;
	}


	public void setCombo_name(String combo_name) {
		this.combo_name = combo_name;
	}


	public ProductBean getProductBean() {
		return productBean;
	}


	public void setProductBean(ProductBean productBean) {
		this.productBean = productBean;
	}


	public Integer getCombo_id() {
		return combo_id;
	}


	public void setCombo_id(Integer combo_id) {
		this.combo_id = combo_id;
	}

	
}
