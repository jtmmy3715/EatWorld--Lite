package tw.eatworld.event.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name = "discount_event")
@Component
public class Event implements Serializable{
	//屬性
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Event_id")
	private Integer event_id;
	
	@Column(name = "Event_name")
	private String event_Name;
	
	@Column(name = "Description")
	private String description;
	
	@Column(name = "Discount")
	private Integer discount;
	
	@Column(name = "Start_Date")
	private String start_Date;
	
	@Column(name = "End_Date")
	private String end_Date;
	
	@Column(name = "Code")
	private String code;
	
	@Column(name = "Event_Img")
	private String event_Img;
	
	@ManyToMany(fetch = FetchType.EAGER)
	@JoinTable(name = "Event_Product",
	 joinColumns = {@JoinColumn(name="fk_event_id",referencedColumnName = "Event_id")},
	 inverseJoinColumns = {@JoinColumn(name="fk_product_id",referencedColumnName = "product_ID")}
	 )
	private List<Product> allProducts = new ArrayList<Product>();

	//constructor
	public Event() {
		
	}
	
	public Event(Integer event_id, String event_Name, String description, Integer discount, String start_Date, String end_Date, String code, String event_Img, List<Product> allProducts) {
		this.event_id = event_id;
		this.event_Name = event_Name;
		this.description = description;
		this.discount = discount;
		this.start_Date = start_Date;
		this.end_Date = end_Date;
		this.code = code;
		this.event_Img = event_Img;
		this.allProducts = allProducts;
	
	}

	//getter & Setter
	public Integer getEvent_id() {
		return event_id;
	}

	public void setEvent_id(Integer event_id) {
		this.event_id = event_id;
	}

	public String getEvent_Name() {
		return event_Name;
	}

	public void setEvent_Name(String event_Name) {
		this.event_Name = event_Name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
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

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getEvent_Img() {
		return event_Img;
	}

	public void setEvent_Img(String event_Img) {
		this.event_Img = event_Img;
	}

	public List<Product> getAllProducts() {
		return allProducts;
	}

	public void setAllProducts(List<Product> allProducts) {
		this.allProducts = allProducts;
	}
	

}
