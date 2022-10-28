package tw.eatworld.client.model;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name = "clientmemberdetail")
@Component
public class ClientMemberDetail implements Serializable {
	
	@Id
	@Column(name = "clientdetail_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int clientDetailId;
	
	@Column(name = "client_logo")
	private String clientLogo;
	
	@Column(name = "client_phone")
	private String clientPhone;
	
	@Column(name = "client_birthday")
	private String clientBirthday;
	
	@Column(name = "client_adddate")
	private String clientAdddate;
	
	@Column(name = "client_points")
	private int clientPoint;
	
	@Column(name = "client_vip")
	private int clientVip;
	

	@OneToOne(mappedBy = "clientMemberDetail")
	private ClientMember clientMember;
	
	public ClientMemberDetail() {
		
	}
	
	public ClientMemberDetail( String clientAdddate, String clientLogo ) {
		
		this.clientLogo = clientLogo;
		this.clientAdddate = clientAdddate;
	}
	
	public ClientMemberDetail( String clientLogo, String clientPhone, String clientBirthday,
			String clientAdddate, int clientPoint, int clientVip) {
		
		this.clientLogo = "user.png";
		this.clientPhone = clientPhone;
		this.clientBirthday = clientBirthday;
		this.clientAdddate = clientAdddate;
		this.clientPoint = clientPoint;
		this.clientVip = clientVip;
	}
	
	public ClientMemberDetail( int clientDetailId, String clientLogo, String clientPhone, String clientBirthday,
			String clientAdddate, int clientPoint, int clientVip) {
		
		this.clientDetailId = clientDetailId;
		this.clientLogo = "user.png";
		this.clientPhone = clientPhone;
		this.clientBirthday = clientBirthday;
		this.clientAdddate = clientAdddate;
		this.clientPoint = clientPoint;
		this.clientVip = clientVip;
	}


	public int getClientDetailId() {
		return clientDetailId;
	}
	
	public void setClientDetailId(int clientDetailId) {
		this.clientDetailId = clientDetailId;
	}

	public String getClientLogo() {
		return clientLogo;
	}

	public void setClientLogo(String clientLogo) {
		this.clientLogo = clientLogo;
	}

	public String getClientPhone() {
		return clientPhone;
	}

	public void setClientPhone(String clientPhone) {
		this.clientPhone = clientPhone;
	}

	public String getClientBirthday() {
		return clientBirthday;
	}

	public void setClientBirthday(String clientBirthday) {
		this.clientBirthday = clientBirthday;
	}

	public String getClientAdddate() {
		return clientAdddate;
	}

	public void setClientAdddate(String clientAdddate) {
		this.clientAdddate = clientAdddate;
	}

	public int getClientPoint() {
		return clientPoint;
	}

	public void setClientPoint(int clientPoint) {
		this.clientPoint = clientPoint;
	}

	public int getClientVip() {
		return clientVip;
	}

	public void setClientVip(int clientVip) {
		this.clientVip = clientVip;
	}

	public ClientMember getClientMember() {
		return clientMember;
	}

	public void setClientMember(ClientMember clientMember) {
		this.clientMember = clientMember;
	}


	@Override
	public String toString() {
		return "ClientMemberDetail [clientDetailId=" + clientDetailId + ", clientLogo=" + clientLogo + ", clientPhone="
				+ clientPhone + ", clientBirthday=" + clientBirthday + ", clientAdddate=" + clientAdddate
				+ ", clientPoint=" + clientPoint + ", clientVip=" + clientVip + ", clientMember=" + clientMember + "]";
	}
	
}
