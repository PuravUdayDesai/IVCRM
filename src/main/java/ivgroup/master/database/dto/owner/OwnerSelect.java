package ivgroup.master.database.dto.owner;

import java.sql.Timestamp;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonFormat;

public class OwnerSelect {
	@NotNull(message = "Id cannot be NULL")
	private Long id;
	@NotNull(message = "OwnerName cannot be NULL")
	private String ownerName;
	@NotNull(message = "OwnerContact cannot be NULL")
	private String ownerContact;
	@NotNull(message = "OwnerEmail cannot be NULL")
	@Email(message= "EmailId provider is INCORRECT")
	private String ownerEmail;
	@NotNull(message = "UserName cannot be NULL")
	private String userName;
	@NotNull(message = "Password cannot be NULL")
	private String password;
	@NotNull(message = "IsActive cannot be NULL")
	private Boolean isActive;
	@NotNull(message = "CreatedOn cannot be NULL")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	private Timestamp createdOn;
	@NotNull(message = "CreatedOn cannot be NULL")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	private Timestamp lastEditOn;
	
	public OwnerSelect() {
		
	}

	public OwnerSelect(@NotNull(message = "Id cannot be NULL") Long id,
			@NotNull(message = "OwnerName cannot be NULL") String ownerName,
			@NotNull(message = "OwnerContact cannot be NULL") String ownerContact,
			@NotNull(message = "OwnerEmail cannot be NULL") @Email(message= "EmailId provider is INCORRECT") String ownerEmail,
			@NotNull(message = "UserName cannot be NULL") String userName,
			@NotNull(message = "Password cannot be NULL") String password,
			@NotNull(message = "IsActive cannot be NULL") Boolean isActive,
			@NotNull(message = "CreatedOn cannot be NULL") Timestamp createdOn,
			@NotNull(message = "CreatedOn cannot be NULL") Timestamp lastEditOn) {
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
