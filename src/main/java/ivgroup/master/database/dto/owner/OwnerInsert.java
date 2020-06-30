package ivgroup.master.database.dto.owner;

import java.sql.Timestamp;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.PastOrPresent;

import com.fasterxml.jackson.annotation.JsonFormat;

public class OwnerInsert {

	@NotNull(message = "OwnerName cannot be NULL")
	String ownerName;
	@NotNull(message = "OwnerContact cannot be NULL")
	String ownerContact;
	@NotNull(message = "OwnerEmail cannot be NULL")
	@Email(message= "EmailId provider is INCORRECT")
	String ownerEmail;
	@NotNull(message = "OwnerUserName cannot be NULL")
	String ownerUserName;
	@NotNull(message = "OwnerPassword cannot be NULL")
	String ownerPassword;
	@NotNull(message = "CreatedOn cannot be NULL")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	@PastOrPresent
	Timestamp createdOn;
	
	public OwnerInsert() {
		
	}

	public OwnerInsert(@NotNull(message = "OwnerName cannot be NULL") String ownerName,
			@NotNull(message = "OwnerContact cannot be NULL") String ownerContact,
			@NotNull(message = "OwnerEmail cannot be NULL") @Email(message= "EmailId provider is INCORRECT") String ownerEmail,
			@NotNull(message = "OwnerUserName cannot be NULL") String ownerUserName,
			@NotNull(message = "OwnerPassword cannot be NULL") String ownerPassword,
			@NotNull(message = "CreatedOn cannot be NULL") @PastOrPresent Timestamp createdOn) {
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
