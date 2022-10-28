package tw.eatworld.event.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name = "product_discount")
@Component
public class ProductDiscount implements Serializable {
	//屬性
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "PD_id")
	private Integer PD_id;
	
	@Column(name = "Discount")
	private Integer discount;
	
	@Column(name = "Start_Date")
	private String start_Date;
	
	@Column(name = "End_Date")
	private String end_Date;
	
	@OneToOne
	@JoinColumn(name = "Product_id")
	private Product product;
	
	//Constructor
	public ProductDiscount() {
	}

	public ProductDiscount(Integer discount, String start_Date, String end_Date) {
		super();
		this.discount = discount;
		this.start_Date = start_Date;
		this.end_Date = end_Date;
	}



	//Getter & Setter
	public Integer getPD_id() {
		return PD_id;
	}

	public void setPD_id(Integer pD_id) {
		PD_id = pD_id;
	}

	public Integer getDiscount() {
		return discount;
	}

	public void setDiscount(Integer discount) {
		this.discount = discount;
	}

	public String getStart_Date() {
		return start_Date;
	}

	public void setStart_Date(String start_Date) {
		this.start_Date = start_Date;
	}

	public String getEnd_Date() {
		return end_Date;
	}

	public void setEnd_Date(String end_Date) {
		this.end_Date = end_Date;
	}

	public Product getProduct() {
		return product;
	}
	
	public void setProduct(Product product) {
		this.product = product;
	}
}
