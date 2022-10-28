package tw.eatworld.product.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonIgnore;
@Entity
@Table(name = "productclassification")
@Component
public class ProductClassificationBean {
	
	@Id
	@Column(name = "product_category_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer product_category_id;
	
	private String name;
	@Column(name = "store_id")
	private Integer storeid;
	
	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY,mappedBy = "productClassificationBean",cascade = CascadeType.REMOVE)
	private Set<ProductBean>productSet = new HashSet<ProductBean>();
	
	public ProductClassificationBean() {
	}
	
	
	
	public ProductClassificationBean(Integer product_category_id, String name, Integer storeid) {
		super();
		this.product_category_id = product_category_id;
		this.name = name;
		this.storeid = storeid;
	}



	public ProductClassificationBean(String name, Integer storeid) {
		super();
		this.name = name;
		this.storeid = storeid;
	}

	public Integer getProduct_category_id() {
		return product_category_id;
	}

	public void setProduct_category_id(Integer product_category_id) {
		this.product_category_id = product_category_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getStoreid() {
		return storeid;
	}

	public void setStoreid(Integer storeid) {
		this.storeid = storeid;
	}



	public Set<ProductBean> getProductSet() {
		return productSet;
	}



	public void setProductSet(Set<ProductBean> productSet) {
		this.productSet = productSet;
	}



	
	
	
	
	

}
