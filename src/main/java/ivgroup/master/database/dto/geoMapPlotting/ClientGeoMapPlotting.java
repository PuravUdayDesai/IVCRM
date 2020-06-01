package ivgroup.master.database.dto.geoMapPlotting;

import javax.validation.constraints.NotEmpty;

public class ClientGeoMapPlotting 
{
	@NotEmpty(message = "ClientId cannot be NULL")
	Long clientId;
	@NotEmpty(message = "Latitude cannot be NULL")
	String latitude;
	@NotEmpty(message = "Longitude cannot be NULL")
	String longitude;
	@NotEmpty(message = "ContactName cannot be NULL")
	String contactName;
	@NotEmpty(message = "ContactPerson cannot be NULL")
	String contactPerson;
	@NotEmpty(message = "EmailId cannot be NULL")
	String emailId;
	@NotEmpty(message = "ContactNumber cannot be NULL")
	String contactNumber;
	@NotEmpty(message = "MarkForDelete cannot be NULL")
	Boolean markForDelete;
	
	public ClientGeoMapPlotting()
	{
		
	}

	public ClientGeoMapPlotting(
			@NotEmpty(message = "ClientId cannot be NULL") Long clientId,
			@NotEmpty(message = "Latitude cannot be NULL") String latitude,
			@NotEmpty(message = "Longitude cannot be NULL") String longitude,
			@NotEmpty(message = "ContactName cannot be NULL") String contactName,
			@NotEmpty(message = "ContactPerson cannot be NULL") String contactPerson,
			@NotEmpty(message = "EmailId cannot be NULL") String emailId,
			@NotEmpty(message = "ContactNumber cannot be NULL") String contactNumber,
			@NotEmpty(message = "MarkForDelete cannot be NULL") Boolean markForDelete) {
		super();
		this.clientId = clientId;
		this.latitude = latitude;
		this.longitude = longitude;
		this.contactName = contactName;
		this.contactPerson = contactPerson;
		this.emailId = emailId;
		this.contactNumber = contactNumber;
		this.markForDelete = markForDelete;
	}

	public Long getClientId() {
		return clientId;
	}

	public void setClientId(Long clientId) {
		this.clientId = clientId;
	}

	public String getLatitude() {
		return latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}

	public String getLongitude() {
		return longitude;
	}

	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}

	public String getContactName() {
		return contactName;
	}

	public void setContactName(String contactName) {
		this.contactName = contactName;
	}

	public String getContactPerson() {
		return contactPerson;
	}

	public void setContactPerson(String contactPerson) {
		this.contactPerson = contactPerson;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public String getContactNumber() {
		return contactNumber;
	}

	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}

	public Boolean getMarkForDelete() {
		return markForDelete;
	}

	public void setMarkForDelete(Boolean markForDelete) {
		this.markForDelete = markForDelete;
	}

}
