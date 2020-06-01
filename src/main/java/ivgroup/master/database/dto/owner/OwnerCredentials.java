package ivgroup.master.database.dto.owner;

import javax.validation.constraints.NotEmpty;

public class OwnerCredentials {

	@NotEmpty(message = "OwnerContact cannot be NULL")
	String ownerContact;
	@NotEmpty(message = "OwnerEmail cannot be NULL")
	String ownerEmail;
	@NotEmpty(message = "UserName cannot be NULL")
	String userName;
	
	public OwnerCredentials() {
		
	}

	public OwnerCredentials(@NotEmpty(message = "OwnerContact cannot be NULL") String ownerContact,
			@NotEmpty(message = "OwnerEmail cannot be NULL") String ownerEmail,
			@NotEmpty(message = "UserName cannot be NULL") String userName) {
		super();
		this.ownerContact = ownerContact;
		this.ownerEmail = ownerEmail;
		this.userName = userName;
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

}
