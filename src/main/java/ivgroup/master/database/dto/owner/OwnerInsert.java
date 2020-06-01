package ivgroup.master.database.dto.owner;

import java.sql.Timestamp;

import javax.validation.constraints.NotEmpty;

import com.fasterxml.jackson.annotation.JsonFormat;

public class OwnerInsert {

	@NotEmpty(message = "OwnerName cannot be NULL")
	String ownerName;
	@NotEmpty(message = "OwnerContact cannot be NULL")
	String ownerContact;
	@NotEmpty(message = "OwnerEmail cannot be NULL")
	String ownerEmail;
	@NotEmpty(message = "OwnerUserName cannot be NULL")
	String ownerUserName;
	@NotEmpty(message = "OwnerPassword cannot be NULL")
	String ownerPassword;
	@NotEmpty(message = "CreatedOn cannot be NULL")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	Timestamp createdOn;
	
	public OwnerInsert() {
		
	}

	public OwnerInsert(@NotEmpty(message = "OwnerName cannot be NULL") String ownerName,
			@NotEmpty(message = "OwnerContact cannot be NULL") String ownerContact,
			@NotEmpty(message = "OwnerEmail cannot be NULL") String ownerEmail,
			@NotEmpty(message = "OwnerUserName cannot be NULL") String ownerUserName,
			@NotEmpty(message = "OwnerPassword cannot be NULL") String ownerPassword,
			@NotEmpty(message = "CreatedOn cannot be NULL") Timestamp createdOn) {
		super();
		this.ownerName = ownerName;
		this.ownerContact = ownerContact;
		this.ownerEmail = ownerEmail;
		this.ownerUserName = ownerUserName;
		this.ownerPassword = ownerPassword;
		this.createdOn = createdOn;
	}

	public String getOwnerName() {
		return ownerName;
	}

	public void setOwnerName(String ownerName) {
		this.ownerName = ownerName;
	}

	public String getOwnerContact() {
		return ownerContact;
	}

	public void setOwnerContact(String ownerContact) {
		this.ownerContact = ownerContact;
	}

	public String getOwnerEmail() {
		return ownerEmail;
	}

	public void setOwnerEmail(String ownerEmail) {
		this.ownerEmail = ownerEmail;
	}

	public String getOwnerUserName() {
		return ownerUserName;
	}

	public void setOwnerUserName(String ownerUserName) {
		this.ownerUserName = ownerUserName;
	}

	public String getOwnerPassword() {
		return ownerPassword;
	}

	public void setOwnerPassword(String ownerPassword) {
		this.ownerPassword = ownerPassword;
	}

	public Timestamp getCreatedOn() {
		return createdOn;
	}

	public void setCreatedOn(Timestamp createdOn) {
		this.createdOn = createdOn;
	}

}
