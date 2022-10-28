package tw.eatworld.event.model;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name = "product")
@Component
public class Product implements Serializable {
	//屬性
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "product_id")
	private Integer product_id;
	
	@Column(name = "name")
	private String name;
	
	@Column(name = "content")
	private String content;
	
	@Column(name = "price")
	private Integer price;
	
	@Column(name = "photo")
	private String photo;
	
	@Column(name = "store_id")
	private Integer store;
//  有一對一, 也有多對多會衝突，因為不需返回找，全部刪掉	
//	@OneToOne(mappedBy ="product")
//	private ProductDiscount productDiscountBean = new ProductDiscount();
//	
//	@ManyToMany(mappedBy = "allProducts")
//	private List<EventBean> eventBeans = new ArrayList<EventBean>();

	//constructor
	public Product() {
	}

	//getter & setter
	public Integer getProduct_id() {
		return product_id;
	}

	public void setProduct_id(Integer product_id) {
		this.product_id = product_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public Integer getStore() {
		return store;
	}

	public void setStore(Integer store) {
		this.store = store;
	}
	

	
}
