package tw.eatworld.store.model;

import java.io.Serializable;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import tw.eatworld.store.model.StoreMember;

@Entity
@Component
@Table(name = "storeclassification")
public class StoreClassification {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "category_id")
	private Integer cId;
	
	private String name;
	private String photo;
	private String content;
	
	
	//一對多描述(此為一方)
//	@JsonManagedReference
//	@OneToMany(fetch =FetchType.EAGER,mappedBy = "storeclassification")
//	private Set<StoreMember> storeMember = new LinkedHashSet<StoreMember>();
	
//	//一對多描述(此為一方)
//	@JsonManagedReference
//	@OneToMany(fetch =FetchType.LAZY,mappedBy = "storeclassification")
//	private List<StoreMember> storeMember ;

	
	@JsonIgnore
	@OneToMany(mappedBy = "storeclassification")
	private Set<StoreMember> storeMember = new LinkedHashSet<StoreMember>();
	
	public StoreClassification() {
		super();
	}
	public StoreClassification(Integer id, String name, String photo, String content) {
		super();
		this.cId = id;
		this.name = name;
		this.photo = photo;
		this.content = content;
	}
	public Integer getId() {
		return cId;
	}
	public void setId(Integer id) {
		this.cId = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Integer getcId() {
		return cId;
	}
	public void setcId(Integer cId) {
		this.cId = cId;
	}
	public Set<StoreMember> getStoreMember() {
		return storeMember;
	}
	public void setStoreMember(Set<StoreMember> storeMember) {
		this.storeMember = storeMember;
	}
	
	

	
	
	
}
