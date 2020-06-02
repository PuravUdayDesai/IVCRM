package ivgroup.master.database.dto.owner;

import java.sql.Timestamp;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;

import com.fasterxml.jackson.annotation.JsonFormat;

public class OwnerSelect {
	@NotEmpty(message = "Id cannot be NULL")
	Long id;
	@NotEmpty(message = "OwnerName cannot be NULL")
	String ownerName;
	@NotEmpty(message = "OwnerContact cannot be NULL")
	String ownerContact;
	@NotEmpty(message = "OwnerEmail cannot be NULL")
	@Email(message= "EmailId provider is INCORRECT")
	String ownerEmail;
	@NotEmpty(message = "UserName cannot be NULL")
	String userName;
	@NotEmpty(message = "Password cannot be NULL")
	String password;
	@NotEmpty(message = "IsActive cannot be NULL")
	Boolean isActive;
	@NotEmpty(message = "CreatedOn cannot be NULL")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	Timestamp createdOn;
	@NotEmpty(message = "CreatedOn cannot be NULL")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	Timestamp lastEditOn;
	
	public OwnerSelect() {
		
	}

	public OwnerSelect(@NotEmpty(message = "Id cannot be NULL") Long id,
			@NotEmpty(message = "OwnerName cannot be NULL") String ownerName,
			@NotEmpty(message = "OwnerContact cannot be NULL") String ownerContact,
			@NotEmpty(message = "OwnerEmail cannot be NULL") @Email(message= "EmailId provider is INCORRECT") String ownerEmail,
			@NotEmpty(message = "UserName cannot be NULL") String userName,
			@NotEmpty(message = "Password cannot be NULL") String password,
			@NotEmpty(message = "IsActive cannot be NULL") Boolean isActive,
			@NotEmpty(message = "CreatedOn cannot be NULL") Timestamp createdOn,
			@NotEmpty(message = "CreatedOn cannot be NULL") Timestamp lastEditOn) {
		super();
		this.id = id;
		this.ownerName = ownerName;
		this.ownerContact = ownerContact;
		this.ownerEmail = ownerEmail;
		this.userName = userName;
		this.password = password;
		this.isActive = isActive;
		this.createdOn = createdOn;
		this.lastEditOn = lastEditOn;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
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

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Boolean getIsActive() {
		return isActive;
	}

	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}

	public Timestamp getCreatedOn() {
		return createdOn;
	}

	public void setCreatedOn(Timestamp createdOn) {
		this.createdOn = createdOn;
	}

	public Timestamp getLastEditOn() {
		return lastEditOn;
	}

	public void setLastEditOn(Timestamp lastEditOn) {
		this.lastEditOn = lastEditOn;
	}


}
