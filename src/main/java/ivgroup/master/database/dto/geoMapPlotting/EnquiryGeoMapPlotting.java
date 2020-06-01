package ivgroup.master.database.dto.geoMapPlotting;

import javax.validation.constraints.NotEmpty;

public class EnquiryGeoMapPlotting 
{
	@NotEmpty(message = "EnquiryId cannot be NULL")
	Long enquiryId;
	@NotEmpty(message = "Latitude cannot be NULL")
	String latitude;
	@NotEmpty(message = "Longitude cannot be NULL")
	String longitude;
	@NotEmpty(message = "CompanyName cannot be NULL")
	String companyName;
	@NotEmpty(message = "ClientName cannot be NULL")
	String clientName;
	@NotEmpty(message = "ContactPerson cannot be NULL")
	String contactPerson;
	@NotEmpty(message = "EmailId cannot be NULL")
	String emailId;
	@NotEmpty(message = "ContactNumber cannot be NULL")
	String contactNumber;
	@NotEmpty(message = "EnquiryTypeName cannot be NULL")
	String enquiryTypeName;
	
	public EnquiryGeoMapPlotting()
	{
		
	}

	public EnquiryGeoMapPlotting(
			@NotEmpty(message = "EnquiryId cannot be NULL") Long enquiryId,
			@NotEmpty(message = "Latitude cannot be NULL") String latitude,
			@NotEmpty(message = "Longitude cannot be NULL") String longitude,
			@NotEmpty(message = "CompanyName cannot be NULL") String companyName,
			@NotEmpty(message = "ClientName cannot be NULL") String clientName,
			@NotEmpty(message = "ContactPerson cannot be NULL") String contactPerson,
			@NotEmpty(message = "EmailId cannot be NULL") String emailId,
			@NotEmpty(message = "ContactNumber cannot be NULL") String contactNumber,
			@NotEmpty(message = "EnquiryTypeName cannot be NULL") String enquiryTypeName) {
		super();
		this.enquiryId = enquiryId;
		this.latitude = latitude;
		this.longitude = longitude;
		this.companyName = companyName;
		this.clientName = clientName;
		this.contactPerson = contactPerson;
		this.emailId = emailId;
		this.contactNumber = contactNumber;
		this.enquiryTypeName = enquiryTypeName;
	}

	public Long getEnquiryId() {
		return enquiryId;
	}

	public void setEnquiryId(Long enquiryId) {
		this.enquiryId = enquiryId;
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

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getClientName() {
		return clientName;
	}

	public void setClientName(String clientName) {
		this.clientName = clientName;
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

	public String getEnquiryTypeName() {
		return enquiryTypeName;
	}

	public void setEnquiryTypeName(String enquiryTypeName) {
		this.enquiryTypeName = enquiryTypeName;
	}
	
	
}
