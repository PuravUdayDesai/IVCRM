package ivgroup.master.database.dto.owner;

import java.sql.Timestamp;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.PastOrPresent;

import com.fasterxml.jackson.annotation.JsonFormat;

public class OwnerUpdate {
	
	private String ownerName;
	private String ownerContact;
	@Email(message= "EmailId provider is INCORRECT")
	private String ownerEmail;
	private Boolean isActive;
	private String ownerUserName;
	@NotNull(message = "LastEditOn cannot be NULL")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	@PastOrPresent
	private Timestamp lastEditOn;
	
	public OwnerUpdate() {
		
	}

	public OwnerUpdate(
			String ownerName, 
			String ownerContact, 
			@Email(message= "EmailId provider is INCORRECT") String ownerEmail, 
			Boolean isActive, 
			String ownerUserName,
			@NotNull(message = "LastEditOn cannot be NULL") @PastOrPresent Timestamp lastEditOn) {
		super();
		this.ownerName = ownerName;
		this.ownerContact = ownerContact;
		this.ownerEmail = ownerEmail;
		this.isActive = isActive;
		this.ownerUserName = ownerUserName;
		this.lastEditOn = lastEditOn;
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

	public Boolean getIsActive() {
		return isActive;
	}

	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}

	public String getOwnerUserName() {
		return ownerUserName;
	}

	public void setOwnerUserName(String ownerUserName) {
		this.ownerUserName = ownerUserName;
	}

	public Timestamp getLastEditOn() {
		return lastEditOn;
	}

	public void setLastEditOn(Timestamp lastEditOn) {
		this.lastEditOn = lastEditOn;
	}

	
}
