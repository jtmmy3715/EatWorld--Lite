package tw.eatworld.booking.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity @Table(name="clientmember")
@Component
public class ClientMemberBean implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int client_id;
	private String client_username;
	private String client_password;
	private String client_name;
	private String client_email;
	private String client_permission;
	
	/*Constructor*/
	public ClientMemberBean() {
	}
	
	public ClientMemberBean(int client_id, String client_username, String client_password, String client_name,
			String client_email, String client_permission) {
		super();
		this.client_id = client_id;
		this.client_username = client_username;
		this.client_password = client_password;
		this.client_name = client_name;
		this.client_email = client_email;
		this.client_permission = client_permission;
	}
	
	/*Getter & Setter*/
	public int getClient_id() {
		return client_id;
	}
	
	public void setClient_id(int client_id) {
		this.client_id = client_id;
	}
	public String getClient_username() {
		return client_username;
	}
	public void setClient_username(String client_username) {
		this.client_username = client_username;
	}
	public String getClient_password() {
		return client_password;
	}
	public void setClient_password(String client_password) {
		this.client_password = client_password;
	}
	public String getClient_name() {
		return client_name;
	}
	public void setClient_name(String client_name) {
		this.client_name = client_name;
	}
	public String getClient_email() {
		return client_email;
	}
	public void setClient_email(String client_email) {
		this.client_email = client_email;
	}
	public String getClient_permission() {
		return client_permission;
	}
	public void setClient_permission(String client_permission) {
		this.client_permission = client_permission;
	}
	
	
	
}
