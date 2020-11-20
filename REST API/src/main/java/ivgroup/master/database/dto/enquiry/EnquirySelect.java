package ivgroup.master.database.dto.enquiry;

import java.sql.Timestamp;
import java.util.List;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonFormat;

public class EnquirySelect 
{
	@NotNull(message = "EnquiryAccessListId cannot be NULL")
	private Long enquiryAccessListId;
	@NotNull(message = "EnquiryId cannot be NULL")
	private Long enquiryId;
	@NotNull(message = "CompanyId cannot be NULL")
	private Long companyId;
	@NotNull(message = "CompanyName cannot be NULL")
	private String companyName;
	@NotNull(message = "EnquiryRemarks cannot be NULL")
	private String enquiryRemarks;
	@NotNull(message = "EnquiryType cannot be NULL")
	private Long enquiryType;
	@NotNull(message = "EnquiryTypeName cannot be NULL")
	private String enquiryTypeName;
	@NotNull(message = "EnquiryLocationId cannot be NULL")
	private Long enquiryLocationId;
	@NotNull(message = "CountryId cannot be NULL")
	private Long countryId;
	@NotNull(message = "CountryName cannot be NULL")
	private String countryName;
	@NotNull(message = "StateId cannot be NULL")
	private Long stateId;
	@NotNull(message = "StateName cannot be NULL")
	private String stateName;
	@NotNull(message = "CityId cannot be NULL")
	private Long cityId;
	@NotNull(message = "CityName cannot be NULL")
	private String cityName;
	@NotNull(message = "AreaId cannot be NULL")
	private Long areaId;
	@NotNull(message = "AreaName cannot be NULL")
	private String areaName;
	@NotNull(message = "AddressLine1 cannot be NULL")
	private String addressLine1;
	@NotNull(message = "AddressLine2 cannot be NULL")
	private String addressLine2;
	@NotNull(message = "AddressLine3 cannot be NULL")
	private String addressLine3;
	@NotNull(message = "Pincode cannot be NULL")
	private String pincode;
	@NotNull(message = "Latitude cannot be NULL")
	private String latitude;
	@NotNull(message = "Longitude cannot be NULL")
	private String longitude;
	@NotNull(message = "StartDateAndTime cannot be NULL")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	private Timestamp startDateAndTime;
	@NotNull(message = "DeadlineDateAndTime cannot be NULL")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	private Timestamp deadlineDateAndTime;
	@NotNull(message = "EnquiryClientId cannot be NULL")
	private Long enquiryClientId;
	@NotNull(message = "ClientId cannot be NULL")
	private Long clientId;
	@NotNull(message = "ClientName cannot be NULL")
	private String clientName;
	@NotNull(message = "ContactPerson cannot be NULL")
	private String contactPerson;
	@NotNull(message = "EmailId cannot be NULL")
	@Email(message= "EmailId provider is INCORRECT")
	private String emailId;
	@NotNull(message = "ContactNumber cannot be NULL")
	private String contactNumber;
	@NotNull(message = "EnquiryProductList cannot be NULL")
	private List<EnquiryProductSelect> enquiryProductList;
	@NotNull(message = "CreatedBy cannot be NULL")
	private Long createdBy;
	@NotNull(message = "CreatedOn cannot be NULL")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	private Timestamp createdOn;
	@NotNull(message = "LastEditBy cannot be NULL")
	private Long lastEditBy;
	@NotNull(message = "LastEditOn cannot be NULL")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	private Timestamp lastEditOn;
	
	public EnquirySelect()
	{
		
	}

	public EnquirySelect(@NotNull(message = "EnquiryAccessListId cannot be NULL") Long enquiryAccessListId,
			@NotNull(message = "EnquiryId cannot be NULL") Long enquiryId,
			@NotNull(message = "CompanyId cannot be NULL") Long companyId,
			@NotNull(message = "CompanyName cannot be NULL") String companyName,
			@NotNull(message = "EnquiryRemarks cannot be NULL") String enquiryRemarks,
			@NotNull(message = "EnquiryType cannot be NULL") Long enquiryType,
			@NotNull(message = "EnquiryTypeName cannot be NULL") String enquiryTypeName,
			@NotNull(message = "EnquiryLocationId cannot be NULL") Long enquiryLocationId,
			@NotNull(message = "CountryId cannot be NULL") Long countryId,
			@NotNull(message = "CountryName cannot be NULL") String countryName,
			@NotNull(message = "StateId cannot be NULL") Long stateId,
			@NotNull(message = "StateName cannot be NULL") String stateName,
			@NotNull(message = "CityId cannot be NULL") Long cityId,
			@NotNull(message = "CityName cannot be NULL") String cityName,
			@NotNull(message = "AreaId cannot be NULL") Long areaId,
			@NotNull(message = "AreaName cannot be NULL") String areaName,
			@NotNull(message = "AddressLine1 cannot be NULL") String addressLine1,
			@NotNull(message = "AddressLine2 cannot be NULL") String addressLine2,
			@NotNull(message = "AddressLine3 cannot be NULL") String addressLine3,
			@NotNull(message = "Pincode cannot be NULL") String pincode,
			@NotNull(message = "Latitude cannot be NULL") String latitude,
			@NotNull(message = "Longitude cannot be NULL") String longitude,
			@NotNull(message = "StartDateAndTime cannot be NULL") Timestamp startDateAndTime,
			@NotNull(message = "DeadlineDateAndTime cannot be NULL") Timestamp deadlineDateAndTime,
			@NotNull(message = "EnquiryClientId cannot be NULL") Long enquiryClientId,
			@NotNull(message = "ClientId cannot be NULL") Long clientId,
			@NotNull(message = "ClientName cannot be NULL") String clientName,
			@NotNull(message = "ContactPerson cannot be NULL") String contactPerson,
			@NotNull(message = "EmailId cannot be NULL") @Email(message= "EmailId provider is INCORRECT") String emailId,
			@NotNull(message = "ContactNumber cannot be NULL") String contactNumber,
			@NotNull(message = "EnquiryProductList cannot be NULL") List<EnquiryProductSelect> enquiryProductList,
			@NotNull(message = "CreatedBy cannot be NULL") Long createdBy,
			@NotNull(message = "CreatedOn cannot be NULL") Timestamp createdOn,
			@NotNull(message = "LastEditBy cannot be NULL") Long lastEditBy,
			@NotNull(message = "LastEditOn cannot be NULL") Timestamp lastEditOn) {
		super();
		this.enquiryAccessListId = enquiryAccessListId;
		this.enquiryId = enquiryId;
		this.companyId = companyId;
		this.companyName = companyName;
		this.enquiryRemarks = enquiryRemarks;
		this.enquiryType = enquiryType;
		this.enquiryTypeName = enquiryTypeName;
		this.enquiryLocationId = enquiryLocationId;
		this.countryId = countryId;
		this.countryName = countryName;
		this.stateId = stateId;
		this.stateName = stateName;
		this.cityId = cityId;
		this.cityName = cityName;
		this.areaId = areaId;
		this.areaName = areaName;
		this.addressLine1 = addressLine1;
		this.addressLine2 = addressLine2;
		this.addressLine3 = addressLine3;
		this.pincode = pincode;
		this.latitude = latitude;
		this.longitude = longitude;
		this.startDateAndTime = startDateAndTime;
		this.deadlineDateAndTime = deadlineDateAndTime;
		this.enquiryClientId = enquiryClientId;
		this.clientId = clientId;
		this.clientName = clientName;
		this.contactPerson = contactPerson;
		this.emailId = emailId;
		this.contactNumber = contactNumber;
		this.enquiryProductList = enquiryProductList;
		this.createdBy = createdBy;
		this.createdOn = createdOn;
		this.lastEditBy = lastEditBy;
		this.lastEditOn = lastEditOn;
	}

	public Long getEnquiryAccessListId() {
		return enquiryAccessListId;
	}

	public void setEnquiryAccessListId(Long enquiryAccessListId) {
		this.enquiryAccessListId = enquiryAccessListId;
	}

	public Long getEnquiryId() {
		return enquiryId;
	}

	public void setEnquiryId(Long enquiryId) {
		this.enquiryId = enquiryId;
	}

	public Long getCompanyId() {
		return companyId;
	}

	public void setCompanyId(Long companyId) {
		this.companyId = companyId;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getEnquiryRemarks() {
		return enquiryRemarks;
	}

	public void setEnquiryRemarks(String enquiryRemarks) {
		this.enquiryRemarks = enquiryRemarks;
	}

	public Long getEnquiryType() {
		return enquiryType;
	}

	public void setEnquiryType(Long enquiryType) {
		this.enquiryType = enquiryType;
	}

	public String getEnquiryTypeName() {
		return enquiryTypeName;
	}

	public void setEnquiryTypeName(String enquiryTypeName) {
		this.enquiryTypeName = enquiryTypeName;
	}

	public Long getEnquiryLocationId() {
		return enquiryLocationId;
	}

	public void setEnquiryLocationId(Long enquiryLocationId) {
		this.enquiryLocationId = enquiryLocationId;
	}

	public Long getCountryId() {
		return countryId;
	}

	public void setCountryId(Long countryId) {
		this.countryId = countryId;
	}

	public String getCountryName() {
		return countryName;
	}

	public void setCountryName(String countryName) {
		this.countryName = countryName;
	}

	public Long getStateId() {
		return stateId;
	}

	public void setStateId(Long stateId) {
		this.stateId = stateId;
	}

	public String getStateName() {
		return stateName;
	}

	public void setStateName(String stateName) {
		this.stateName = stateName;
	}

	public Long getCityId() {
		return cityId;
	}

	public void setCityId(Long cityId) {
		this.cityId = cityId;
	}

	public String getCityName() {
		return cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	public Long getAreaId() {
		return areaId;
	}

	public void setAreaId(Long areaId) {
		this.areaId = areaId;
	}

	public String getAreaName() {
		return areaName;
	}

	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}

	public String getAddressLine1() {
		return addressLine1;
	}

	public void setAddressLine1(String addressLine1) {
		this.addressLine1 = addressLine1;
	}

	public String getAddressLine2() {
		return addressLine2;
	}

	public void setAddressLine2(String addressLine2) {
		this.addressLine2 = addressLine2;
	}

	public String getAddressLine3() {
		return addressLine3;
	}

	public void setAddressLine3(String addressLine3) {
		this.addressLine3 = addressLine3;
	}

	public String getPincode() {
		return pincode;
	}

	public void setPincode(String pincode) {
		this.pincode = pincode;
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

	public Timestamp getStartDateAndTime() {
		return startDateAndTime;
	}

	public void setStartDateAndTime(Timestamp startDateAndTime) {
		this.startDateAndTime = startDateAndTime;
	}

	public Timestamp getDeadlineDateAndTime() {
		return deadlineDateAndTime;
	}

	public void setDeadlineDateAndTime(Timestamp deadlineDateAndTime) {
		this.deadlineDateAndTime = deadlineDateAndTime;
	}

	public Long getEnquiryClientId() {
		return enquiryClientId;
	}

	public void setEnquiryClientId(Long enquiryClientId) {
		this.enquiryClientId = enquiryClientId;
	}

	public Long getClientId() {
		return clientId;
	}

	public void setClientId(Long clientId) {
		this.clientId = clientId;
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

	public List<EnquiryProductSelect> getEnquiryProductList() {
		return enquiryProductList;
	}

	public void setEnquiryProductList(List<EnquiryProductSelect> enquiryProductList) {
		this.enquiryProductList = enquiryProductList;
	}

	public Long getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(Long createdBy) {
		this.createdBy = createdBy;
	}

	public Timestamp getCreatedOn() {
		return createdOn;
	}

	public void setCreatedOn(Timestamp createdOn) {
		this.createdOn = createdOn;
	}

	public Long getLastEditBy() {
		return lastEditBy;
	}

	public void setLastEditBy(Long lastEditBy) {
		this.lastEditBy = lastEditBy;
	}

	public Timestamp getLastEditOn() {
		return lastEditOn;
	}

	public void setLastEditOn(Timestamp lastEditOn) {
		this.lastEditOn = lastEditOn;
	}
}
