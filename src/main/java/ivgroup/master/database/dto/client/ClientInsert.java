package ivgroup.master.database.dto.client;

import java.sql.Timestamp;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.PastOrPresent;

import com.fasterxml.jackson.annotation.JsonFormat;

public class ClientInsert
{
	@NotNull(message = "ContactName cannot be NULL")
	String contactName;
	@NotNull(message = "ContactPerson cannot be NULL")
	String contactPerson;
	@NotNull(message = "EmailId cannot be NULL")
	@Email(message= "EmailId provider is INCORRECT")
	String emailId;
	@NotNull(message = "ContactNumber cannot be NULL")
	String contactNumber;
	@NotNull(message = "CompanyId cannot be NULL")
	Long companyId;
	@NotNull(message = "CountryId cannot be NULL")
	Long countryId;
	@NotNull(message = "StateId cannot be NULL")
	Long stateId;
	@NotNull(message = "CityId cannot be NULL")
	Long cityId;
	@NotNull(message = "AreaId cannot be NULL")
	Long areaId;
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
	@NotNull(message = "CreatedOn cannot be NULL")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	@PastOrPresent
	Timestamp createdOn;
	@NotNull(message = "CreatedBy cannot be NULL")
	Long createdBy;
	
	public ClientInsert()
	{
		
	}

	

	public ClientInsert(@NotNull(message = "ContactName cannot be NULL") String contactName,
			@NotNull(message = "ContactPerson cannot be NULL") String contactPerson,
			@NotNull(message = "EmailId cannot be NULL") @Email(message = "EmailId provider is INCORRECT") String emailId,
			@NotNull(message = "ContactNumber cannot be NULL") String contactNumber,
			@NotNull(message = "CompanyId cannot be NULL") Long companyId,
			@NotNull(message = "CountryId cannot be NULL") Long countryId,
			@NotNull(message = "StateId cannot be NULL") Long stateId,
			@NotNull(message = "CityId cannot be NULL") Long cityId,
			@NotNull(message = "AreaId cannot be NULL") Long areaId,
			@NotNull(message = "AddressLine1 cannot be NULL") String addressLine1,
			@NotNull(message = "AddressLine2 cannot be NULL") String addressLine2,
			@NotNull(message = "AddressLine3 cannot be NULL") String addressLine3,
			@NotNull(message = "Pincode cannot be NULL") String pincode,
			@NotNull(message = "Latitude cannot be NULL") String latitude,
			@NotNull(message = "Longitude cannot be NULL") String longitude,
			@NotNull(message = "CreatedOn cannot be NULL") @PastOrPresent Timestamp createdOn,
			@NotNull(message = "CreatedBy cannot be NULL") Long createdBy) {
		super();
		this.contactName = contactName;
		this.contactPerson = contactPerson;
		this.emailId = emailId;
		this.contactNumber = contactNumber;
		this.companyId = companyId;
		this.countryId = countryId;
		this.stateId = stateId;
		this.cityId = cityId;
		this.areaId = areaId;
		this.addressLine1 = addressLine1;
		this.addressLine2 = addressLine2;
		this.addressLine3 = addressLine3;
		this.pincode = pincode;
		this.latitude = latitude;
		this.longitude = longitude;
		this.createdOn = createdOn;
		this.createdBy = createdBy;
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

	public Long getCountryId() {
		return countryId;
	}

	public void setCountryId(Long countryId) {
		this.countryId = countryId;
	}

	public Long getStateId() {
		return stateId;
	}

	public void setStateId(Long stateId) {
		this.stateId = stateId;
	}

	public Long getCityId() {
		return cityId;
	}

	public void setCityId(Long cityId) {
		this.cityId = cityId;
	}

	public Long getAreaId() {
		return areaId;
	}

	public void setAreaId(Long areaId) {
		this.areaId = areaId;
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

	public Timestamp getCreatedOn() {
		return createdOn;
	}

	public void setCreatedOn(Timestamp createdOn) {
		this.createdOn = createdOn;
	}

	public Long getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(Long createdBy) {
		this.createdBy = createdBy;
	}

}
