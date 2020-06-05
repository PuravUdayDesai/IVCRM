package ivgroup.master.database.dto.owner;

import javax.validation.constraints.NotNull;

public class OwnerCredentials {

	@NotNull(message = "OwnerContact cannot be NULL")
	String ownerContact;
	@NotNull(message = "OwnerEmail cannot be NULL")
	String ownerEmail;
	@NotNull(message = "UserName cannot be NULL")
	String userName;
	
	public OwnerCredentials() {
		
	}

	public OwnerCredentials(@NotNull(message = "OwnerContact cannot be NULL") String ownerContact,
			@NotNull(message = "OwnerEmail cannot be NULL") String ownerEmail,
			@NotNull(message = "UserName cannot be NULL") String userName) {
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
