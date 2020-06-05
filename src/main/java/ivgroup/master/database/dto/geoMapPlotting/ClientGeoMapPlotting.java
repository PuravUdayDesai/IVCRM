package ivgroup.master.database.dto.geoMapPlotting;

import javax.validation.constraints.NotNull;

public class ClientGeoMapPlotting 
{
	@NotNull(message = "ClientId cannot be NULL")
	Long clientId;
	@NotNull(message = "Latitude cannot be NULL")
	String latitude;
	@NotNull(message = "Longitude cannot be NULL")
	String longitude;
	@NotNull(message = "ContactName cannot be NULL")
	String contactName;
	@NotNull(message = "ContactPerson cannot be NULL")
	String contactPerson;
	@NotNull(message = "EmailId cannot be NULL")
	String emailId;
	@NotNull(message = "ContactNumber cannot be NULL")
	String contactNumber;
	@NotNull(message = "MarkForDelete cannot be NULL")
	Boolean markForDelete;
	
	public ClientGeoMapPlotting()
	{
		
	}

	public ClientGeoMapPlotting(
			@NotNull(message = "ClientId cannot be NULL") Long clientId,
			@NotNull(message = "Latitude cannot be NULL") String latitude,
			@NotNull(message = "Longitude cannot be NULL") String longitude,
			@NotNull(message = "ContactName cannot be NULL") String contactName,
			@NotNull(message = "ContactPerson cannot be NULL") String contactPerson,
			@NotNull(message = "EmailId cannot be NULL") String emailId,
			@NotNull(message = "ContactNumber cannot be NULL") String contactNumber,
			@NotNull(message = "MarkForDelete cannot be NULL") Boolean markForDelete) {
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
