package tw.eatworld.booking.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity @Table(name="booking")
@Component
public class BookingBean implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer booking_id;
	private String booking_cteatetime;
	
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private String booking_date;
	private int booking_people;
	private String booking_period;
	private String booking_photo;
	private String booking_status;
	private int booking_table;
	
	
	private int client_id;
	@OneToOne(cascade = {CascadeType.PERSIST})
	@JoinColumn(name = "client_id",insertable = false, updatable = false) //只能讀ClientMember有的client_id
	@JsonIgnore
	private ClientMemberBean clientMemberBean;

	private int store_id;
	@OneToOne(cascade = {CascadeType.PERSIST})
	@JoinColumn(name = "store_id",insertable = false, updatable = false)
	@JsonIgnore
	private StoreMemberBean storeMemberBean;
	
	
//	private int client_id;
//	private int store_id;
	
	/*Constructor*/
	public BookingBean() {
	}

	//bakend
	public BookingBean(String booking_cteateTime, String booking_date, int booking_people, String booking_period,
			String booking_status, int booking_table, int client_id, int store_id) {
		super();
		this.booking_cteatetime = booking_cteateTime;
		this.booking_date = booking_date;
		this.booking_people = booking_people;
		this.booking_period = booking_period;
		this.booking_status = booking_status;
		this.booking_table = booking_table;
		this.client_id = client_id;
		this.store_id = store_id;
	}
	
	//bakend
	public BookingBean(Integer booking_id, String booking_cteateTime, String booking_date, int booking_people,
			String booking_period, String booking_status, int booking_table, int client_id, int store_id) {
		super();
		this.booking_id = booking_id;
		this.booking_cteatetime = booking_cteateTime;
		this.booking_date = booking_date;
		this.booking_people = booking_people;
		this.booking_period = booking_period;
		this.booking_status = booking_status;
		this.booking_table = booking_table;
		this.client_id = client_id;
		this.store_id = store_id;
	}

	//frontend
	public BookingBean(String booking_date, int booking_people, String booking_period,
			String booking_status, int client_id, int store_id) {
		super();
		this.booking_date = booking_date;
		this.booking_people = booking_people;
		this.booking_period = booking_period;
		this.booking_status = booking_status;
		this.client_id = client_id;
		this.store_id = store_id;
	}
	

	/*Getter & Setter*/
	public Integer getBooking_id() {
		return booking_id;
	}
	
	public void setBooking_id(int booking_id) {
		this.booking_id = booking_id;
	}
	public String getBooking_cteateTime() {
		return booking_cteatetime;
	}
	public void setBooking_cteateTime(String booking_cteateTime) {
		this.booking_cteatetime = booking_cteateTime;
	}
	public String getBooking_date() {
		return booking_date;
	}
	public void setBooking_date(String booking_date) {
		this.booking_date = booking_date;
	}
	public int getBooking_people() {
		return booking_people;
	}
	public void setBooking_people(int booking_people) {
		this.booking_people = booking_people;
	}
	public String getBooking_period() {
		return booking_period;
	}
	public void setBooking_period(String booking_period) {
		this.booking_period = booking_period;
	}
	public String getBooking_photo() {
		return booking_photo;
	}
	public void setBooking_photo(String booking_photo) {
		this.booking_photo = booking_photo;
	}
	public String getBooking_status() {
		return booking_status;
	}
	public void setBooking_status(String booking_status) {
		this.booking_status = booking_status;
	}
	public int getBooking_table() {
		return booking_table;
	}
	public void setBooking_table(int booking_table) {
		this.booking_table = booking_table;
	}
	public int getClient_id() {
		return client_id;
	}
	public void setClient_id (int client_id) {
		this.client_id = client_id;
	}
	public int getStore_id() {
		return store_id;
	}
	public void setStore_id(int store_id) {
		this.store_id = store_id;
	}

	//OneToOne Get&Set Client
	public ClientMemberBean getClientMemberBean() {
		return clientMemberBean;
	}

	public void setClientMemberBean(ClientMemberBean clientMemberBean) {
		this.clientMemberBean = clientMemberBean;
	}

	//OneToOne Get&Set Store
	public StoreMemberBean getStoreMemberBean() {
		return storeMemberBean;
	}

	public void setStoreMemberBean(StoreMemberBean storeMemberBean) {
		this.storeMemberBean = storeMemberBean;
	}
	
	
	

	
	

	
	
}
