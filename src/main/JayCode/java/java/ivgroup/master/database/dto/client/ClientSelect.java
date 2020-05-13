package ivgroup.master.database.dto.client;

import java.sql.Timestamp;

import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonFormat;

public class ClientSelect 
{
	@NotNull(message = "ClientId cannot be NULL")
	Long clientId;
	@NotNull(message = "ContactName cannot be NULL")
	String contactName;
	@NotNull(message = "ContactPerson cannot be NULL")
	String contactPerson;
	@NotNull(message = "EmailId cannot be NULL")
	String emailId;
	@NotNull(message = "ContactNumber cannot be NULL")
	String contactNumber;
	@NotNull(message = "CompanyId cannot be NULL")
	Long companyId;
	@NotNull(message = "CompanyName cannot be NULL")
	String companyName;
	@NotNull(message = "CountryId cannot be NULL")
	Long countryId;
	@NotNull(message = "CountryName cannot be NULL")
	String countryName;
	@NotNull(message = "StateId cannot be NULL")
	Long stateId;
	@NotNull(message = "StateName cannot be NULL")
	String stateName;
	@NotNull(message = "CityId cannot be NULL")
	Long cityId;
	@NotNull(message = "CityName cannot be NULL")
	String cityName;
	@NotNull(message = "AreaId cannot be NULL")
	Long areaId;
	@NotNull(message = "AreaName cannot be NULL")
	String areaName;
	@NotNull(message = "AddressLine1 cannot be NULL")
	String addressLine1;
	@NotNull(message = "AddressLine2 cannot be NULL")
	String addressLine2;
	@NotNull(message = "AddressLine3 cannot be NULL")
	String addressLine3;
	@NotNull(message = "Pincode cannot be NULL")
	String pincode;
	@NotNull(message = "Latitude cannot be NULL")
	String latitude;
	@NotNull(message = "Longitude cannot be NULL")
	String longitude;
	@NotNull(message = "ClientCreatedOn cannot be NULL")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	Timestamp clientCreatedOn;
	@NotNull(message = "ClientCreatedBy cannot be NULL")
	Long clientCreatedBy;
	@NotNull(message = "ClientLastEditOn cannot be NULL")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	Timestamp clientLastEditOn;
	@NotNull(message = "ClientLastEditBy cannot be NULL")
	Long clientLastEditBy;
	@NotNull(message = "ClientIsActive cannot be NULL")
	Boolean clientIsActive;
	@NotNull(message = "ClientLocationCreatedOn cannot be NULL")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	Timestamp clientLocationCreatedOn;
	@NotNull(message = "ClientLocationCreatedBy cannot be NULL")
	Long clientLocationCreatedBy;
	@NotNull(message = "ClientLocationLastEditOn cannot be NULL")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	Timestamp clientLocationLastEditOn;
	@NotNull(message = "ClientLocationLastEditBy cannot be NULL")
	Long clientLocationLastEditBy;
	@NotNull(message = "ClientLocationIsActive cannot be NULL")
	Boolean clientLocationIsActive;
	
	public ClientSelect()
	{
		
	}

	public ClientSelect(
			@NotNull(message = "ClientId cannot be NULL") Long clientId,
			@NotNull(message = "ContactName cannot be NULL") String contactName,
			@NotNull(message = "ContactPerson cannot be NULL") String contactPerson,
			@NotNull(message = "EmailId cannot be NULL") String emailId,
			@NotNull(message = "ContactNumber cannot be NULL") String contactNumber,
			@NotNull(message = "CompanyId cannot be NULL") Long companyId,
			@NotNull(message = "CompanyName cannot be NULL") String companyName,
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
			@NotNull(message = "ClientCreatedOn cannot be NULL") Timestamp clientCreatedOn,
			@NotNull(message = "ClientCreatedBy cannot be NULL") Long clientCreatedBy,
			@NotNull(message = "ClientLastEditOn cannot be NULL") Timestamp clientLastEditOn,
			@NotNull(message = "ClientLastEditBy cannot be NULL") Long clientLastEditBy,
			@NotNull(message = "ClientIsActive cannot be NULL") Boolean clientIsActive,
			@NotNull(message = "ClientLocationCreatedOn cannot be NULL") Timestamp clientLocationCreatedOn,
			@NotNull(message = "ClientLocationCreatedBy cannot be NULL") Long clientLocationCreatedBy,
			@NotNull(message = "ClientLocationLastEditOn cannot be NULL") Timestamp clientLocationLastEditOn,
			@NotNull(message = "ClientLocationLastEditBy cannot be NULL") Long clientLocationLastEditBy,
			@NotNull(message = "ClientLocationIsActive cannot be NULL") Boolean clientLocationIsActive) {
		super();
		this.clientId = clientId;
		this.contactName = contactName;
		this.contactPerson = contactPerson;
		this.emailId = emailId;
		this.contactNumber = contactNumber;
		this.companyId = companyId;
		this.companyName = companyName;
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
		this.clientCreatedOn = clientCreatedOn;
		this.clientCreatedBy = clientCreatedBy;
		this.clientLastEditOn = clientLastEditOn;
		this.clientLastEditBy = clientLastEditBy;
		this.clientIsActive = clientIsActive;
		this.clientLocationCreatedOn = clientLocationCreatedOn;
		this.clientLocationCreatedBy = clientLocationCreatedBy;
		this.clientLocationLastEditOn = clientLocationLastEditOn;
		this.clientLocationLastEditBy = clientLocationLastEditBy;
		this.clientLocationIsActive = clientLocationIsActive;
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

	public Timestamp getClientCreatedOn() {
		return clientCreatedOn;
	}

	public void setClientCreatedOn(Timestamp clientCreatedOn) {
		this.clientCreatedOn = clientCreatedOn;
	}

	public Long getClientCreatedBy() {
		return clientCreatedBy;
	}

	public void setClientCreatedBy(Long clientCreatedBy) {
		this.clientCreatedBy = clientCreatedBy;
	}

	public Timestamp getClientLastEditOn() {
		return clientLastEditOn;
	}

	public void setClientLastEditOn(Timestamp clientLastEditOn) {
		this.clientLastEditOn = clientLastEditOn;
	}

	public Long getClientLastEditBy() {
		return clientLastEditBy;
	}

	public void setClientLastEditBy(Long clientLastEditBy) {
		this.clientLastEditBy = clientLastEditBy;
	}

	public Boolean getClientIsActive() {
		return clientIsActive;
	}

	public void setClientIsActive(Boolean clientIsActive) {
		this.clientIsActive = clientIsActive;
	}

	public Timestamp getClientLocationCreatedOn() {
		return clientLocationCreatedOn;
	}

	public void setClientLocationCreatedOn(Timestamp clientLocationCreatedOn) {
		this.clientLocationCreatedOn = clientLocationCreatedOn;
	}

	public Long getClientLocationCreatedBy() {
		return clientLocationCreatedBy;
	}

	public void setClientLocationCreatedBy(Long clientLocationCreatedBy) {
		this.clientLocationCreatedBy = clientLocationCreatedBy;
	}

	public Timestamp getClientLocationLastEditOn() {
		return clientLocationLastEditOn;
	}

	public void setClientLocationLastEditOn(Timestamp clientLocationLastEditOn) {
		this.clientLocationLastEditOn = clientLocationLastEditOn;
	}

	public Long getClientLocationLastEditBy() {
		return clientLocationLastEditBy;
	}

	public void setClientLocationLastEditBy(Long clientLocationLastEditBy) {
		this.clientLocationLastEditBy = clientLocationLastEditBy;
	}

	public Boolean getClientLocationIsActive() {
		return clientLocationIsActive;
	}

	public void setClientLocationIsActive(Boolean clientLocationIsActive) {
		this.clientLocationIsActive = clientLocationIsActive;
	}

}
