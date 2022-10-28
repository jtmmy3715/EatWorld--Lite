package tw.eatworld.product.model;

import java.io.Serializable;
import java.util.ArrayList;
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
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonIgnore;

import tw.eatworld.order.model.OrderDetailBean;

@Entity
@Table(name = "product")
@Component("productBean")
public class ProductBean implements Serializable{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "product_ID")
	private Integer product_id;
	private String name;
	private String content;
	private Integer price;
	private String photo;
	private Integer inventory;
	private Double avg_rate;
	private Integer count_sale;
	private Integer count_view;
	@Column(name = "sold")
	private Integer sold;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "category")
	private ProductClassificationBean productClassificationBean;
	@Column(name = "store_id")
	private Integer storeid;
	private Integer daily_limited;
	
	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY,mappedBy = "productBean",cascade = CascadeType.REMOVE)
	private Set<ComboBean>combo = new HashSet<ComboBean>();

	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY,mappedBy = "productBean",cascade = CascadeType.REMOVE)
	private Set<OrderDetailBean>orders = new HashSet<OrderDetailBean>();
//	@ManyToMany(mappedBy = "allProducts")
//	private List<EventBean> eventBeans = new ArrayList<EventBean>();
	
	public ProductBean() {
		// TODO Auto-generated constructor stub
	}
	
	public ProductBean(Integer product_id, String name, String content, Integer price, String photo, Integer daily_limited,
			Integer sold, ProductClassificationBean productClassificationBean,Integer storeid) {
		super();
		this.product_id = product_id;
		this.content = content;
		this.name = name;
		this.price = price;
		this.photo = photo;
		this.daily_limited = daily_limited;
		this.sold = sold;
		this.productClassificationBean = productClassificationBean;
		this.storeid = storeid;
	}

	public void setProduct_id(Integer product_id) {
		this.product_id = product_id;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setAvg_rate(Double avg_rate) {
		this.avg_rate = avg_rate;
	}

	public void setCount_sale(Integer count_sale) {
		this.count_sale = count_sale;
	}

	public void setCount_view(Integer count_view) {
		this.count_view = count_view;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public void setInventory(Integer inventory) {
		this.inventory = inventory;
	}

	public void setSold(Integer sold) {
		this.sold = sold;
	}

	public ProductClassificationBean getProductClassificationBean() {
		return productClassificationBean;
	}

	public void setStoreid(Integer storeid) {
		this.storeid = storeid;
	}

	public void setDaily_limited(Integer daily_limited) {
		this.daily_limited = daily_limited;
	}

	//-------------以下get----------
	public Integer getProduct_id() {
		return product_id;
	}
	public String getContent() {
		return content;
	}
	public String getName() {
		return name;
	}
	public Integer getPrice() {
		return price;
	}
	public String getPhoto() {
		return photo;
	}
	public Integer getInventory() {
		return inventory;
	}
	public Double getAvg_rate() {
		return avg_rate;
	}
	public Integer getCount_sale() {
		return count_sale;
	}
	public Integer getCount_view() {
		return count_view;
	}
	public Integer getSold() {
		return sold;
	}



	public void setProductClassificationBean(ProductClassificationBean productClassificationBean) {
		this.productClassificationBean = productClassificationBean;
	}



	public Integer getStoreid() {
		return storeid;
	}



	public Set<ComboBean> getCombo() {
		return combo;
	}

	public void setCombo(Set<ComboBean> combo) {
		this.combo = combo;
	}
	public Integer getDaily_limited() {
		return daily_limited;
	}

//	public List<EventBean> getEventBeans() {
//		return eventBeans;
//	}
//
//	public void setEventBeans(List<EventBean> eventBeans) {
//		this.eventBeans = eventBeans;
//	}


	
}
