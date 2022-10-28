package tw.eatworld.booking.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity @Table(name="storemember")
@Component
public class StoreMemberBean implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int store_id;
	private String store_username;
	private String store_password;
	private String store_name;
	private String store_logo;
	private String store_introduction;
	private String store_address;
	private String store_phone;
	private String store_email;
	private String store_openhours;
	private String store_endhours;
	private String store_adddate;
	private int store_booking;
	private int store_people;
	private int store_balance;
	
	/*Constructor*/
	public StoreMemberBean() {
	}
	
	public StoreMemberBean(int store_id, String store_username, String store_password, String store_name, String store_logo, String store_introduction,
			String store_address, String store_phone, String store_email, String store_openhours, String store_endhours,
			String store_adddate, int store_booking, int store_people, int store_balance) {
		super();
		this.store_id = store_id;
		this.store_username = store_username;
		this.store_password = store_password;
		this.store_name = store_name;
		this.store_logo = store_logo;
		this.store_introduction = store_introduction;
		this.store_address = store_address;
		this.store_phone = store_phone;
		this.store_email = store_email;
		this.store_openhours = store_openhours;
		this.store_endhours = store_endhours;
		this.store_adddate = store_adddate;
		this.store_booking = store_booking;
		this.store_people = store_people;
		this.store_balance = store_balance;
	}
	
	/*Getter & Setter*/
	public int getStore_id() {
		return store_id;
	}
	public void setStore_id(int store_id) {
		this.store_id = store_id;
	}
	public String getStore_username() {
		return store_username;
	}
	public void setStore_username(String store_username) {
		this.store_username = store_username;
	}
	public String getStore_password() {
		return store_password;
	}
	public void setStore_password(String store_password) {
		this.store_password = store_password;
	}
	public String getStore_name() {
		return store_name;
	}
	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}
	public String getStore_logo() {
		return store_logo;
	}
	public void setStore_logo(String store_logo) {
		this.store_logo = store_logo;
	}
	public String getStore_introduction() {
		return store_introduction;
	}
	public void setStore_introduction(String store_introduction) {
		this.store_introduction = store_introduction;
	}
	public String getStore_address() {
		return store_address;
	}
	public void setStore_address(String store_address) {
		this.store_address = store_address;
	}
	public String getStore_phone() {
		return store_phone;
	}
	public void setStore_phone(String store_phone) {
		this.store_phone = store_phone;
	}
	public String getStore_email() {
		return store_email;
	}
	public void setStore_email(String store_email) {
		this.store_email = store_email;
	}
	public String getStore_openhours() {
		return store_openhours;
	}
	public void setStore_openhours(String store_openhours) {
		this.store_openhours = store_openhours;
	}
	public String getStore_endhours() {
		return store_endhours;
	}
	public void setStore_endhours(String store_endhours) {
		this.store_endhours = store_endhours;
	}
	public String getStore_adddate() {
		return store_adddate;
	}
	public void setStore_adddate(String store_adddate) {
		this.store_adddate = store_adddate;
	}
	public int getStore_booking() {
		return store_booking;
	}
	public void setStore_booking(int store_booking) {
		this.store_booking = store_booking;
	}
	public int getStore_people() {
		return store_people;
	}
	public void setStore_people(int store_people) {
		this.store_people = store_people;
	}
	public int getStore_balance() {
		return store_balance;
	}
	public void setStore_balance(int store_balance) {
		this.store_balance = store_balance;
	}
	
	
}
