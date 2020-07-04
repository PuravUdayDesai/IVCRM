package ivgroup.master.database.dto.geoMapPlotting;

import javax.validation.constraints.NotNull;

public class EnquiryGeoMapPlotting 
{
	@NotNull(message = "EnquiryId cannot be NULL")
	private Long enquiryId;
	@NotNull(message = "Latitude cannot be NULL")
	private String latitude;
	@NotNull(message = "Longitude cannot be NULL")
	private String longitude;
	@NotNull(message = "CompanyName cannot be NULL")
	private String companyName;
	@NotNull(message = "ClientName cannot be NULL")
	private String clientName;
	@NotNull(message = "ContactPerson cannot be NULL")
	private String contactPerson;
	@NotNull(message = "EmailId cannot be NULL")
	private String emailId;
	@NotNull(message = "ContactNumber cannot be NULL")
	private String contactNumber;
	@NotNull(message = "EnquiryTypeName cannot be NULL")
	private String enquiryTypeName;
	
	public EnquiryGeoMapPlotting()
	{
		
	}

	public EnquiryGeoMapPlotting(
			@NotNull(message = "EnquiryId cannot be NULL") Long enquiryId,
			@NotNull(message = "Latitude cannot be NULL") String latitude,
			@NotNull(message = "Longitude cannot be NULL") String longitude,
			@NotNull(message = "CompanyName cannot be NULL") String companyName,
			@NotNull(message = "ClientName cannot be NULL") String clientName,
			@NotNull(message = "ContactPerson cannot be NULL") String contactPerson,
			@NotNull(message = "EmailId cannot be NULL") String emailId,
			@NotNull(message = "ContactNumber cannot be NULL") String contactNumber,
			@NotNull(message = "EnquiryTypeName cannot be NULL") String enquiryTypeName) {
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
