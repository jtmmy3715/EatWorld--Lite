package tw.eatworld.client.model;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import tw.eatworld.store.model.StoreMember;

@Entity
@Table(name = "clientcollection")
@Component
public class ClientCollection implements Serializable {
	
	@Id
	@Column(name = "collection_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int collectiontId;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "fk_client_id")
	private ClientMember client;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "fk_store_id")
	private StoreMember store;

	public int getCollectiontId() {
		return collectiontId;
	}

	public void setCollectiontId(int collectiontId) {
		this.collectiontId = collectiontId;
	}

	public ClientMember getClient() {
		return client;
	}

	public void setClient(ClientMember client) {
		this.client = client;
	}

	public StoreMember getStore() {
		return store;
	}

	public void setStore(StoreMember store) {
		this.store = store;
	}

	public ClientCollection() {
	}

	public ClientCollection(ClientMember client, StoreMember store) {
		this.client = client;
		this.store = store;
	}

	

}

