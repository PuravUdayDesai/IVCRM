package ivgroup.master.database.dto.client;

import javax.validation.constraints.NotNull;

public class ClientContactCheckSelect
{
	@NotNull(message = "Check cannot be NULL")
	private Boolean check;
	@NotNull(message = "ClientId cannot be NULL")
	private Long clientId;
	@NotNull(message = "ContactName cannot be NULL")
	private String contactName;
	
	public ClientContactCheckSelect()
	{
		
	}

	public ClientContactCheckSelect(
			@NotNull(message = "Check cannot be NULL") Boolean check,
			@NotNull(message = "ClientId cannot be NULL") Long clientId,
			@NotNull(message = "ContactName cannot be NULL") String contactName) {
		super();
		this.check = check;
		this.clientId = clientId;
		this.contactName = contactName;
	}

	public Boolean getCheck() {
		return check;
	}

	public void setCheck(Boolean check) {
		this.check = check;
	}

	public Long getClientId() {
		return clientId;
	}

	public void setClientId(Long clientId) {
		this.clientId = clientId;
	}

	public String getContactName() {
		return contactName;
	}

	public void setContactName(String contactName) {
		this.contactName = contactName;
	}
	
}
