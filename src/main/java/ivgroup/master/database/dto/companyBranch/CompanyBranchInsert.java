package ivgroup.master.database.dto.companyBranch;

import java.sql.Timestamp;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.PastOrPresent;

import com.fasterxml.jackson.annotation.JsonFormat;

public class CompanyBranchInsert
{
	@NotNull(message = "AddressLine1 cannot be NULL")
	String addressLine1;
	@NotNull(message = "AddressLine2 cannot be NULL")
	String addressLine2;
	@NotNull(message = "AddressLine3 cannot be NULL")
	String addressLine3;
	@NotNull(message = "Pincode cannot be NULL")
	Long pincode;
	@NotNull(message = "CityID cannot be NULL")
	Long cityID;
	@NotNull(message = "StateID cannot be NULL")
	Long stateID;
	@NotNull(message = "CountryID cannot be NULL")
	Long countryID;
	@NotNull(message = "Latitude cannot be NULL")
	String latitude;
	@NotNull(message = "Longitude cannot be NULL")
	String longitude;
	@NotNull(message = "CompanyId cannot be NULL")
	Long companyId;
	@NotNull(message = "CompanyRegionId cannot be NULL")
	Long companyRegionId;
	@NotNull(message = "CompanyAreaId cannot be NULL")
	Long companyAreaId;
	@NotNull(message = "CompanyBranchName cannot be NULL")
	String companyBranchName;
	@NotNull(message = "CompanyBranchCode cannot be NULL")
	String companyBranchCode;
	@NotNull(message = "CompanyBranchType cannot be NULL")
	Integer companyBranchType;
	@NotNull(message = "ExecutiveName cannot be NULL")
	String executiveName; 
	@NotNull(message = "LoginID cannot be NULL")
	String loginID; 
	@NotNull(message = "Password cannot be NULL")
	String password;
	@NotNull(message = "ContactNumber cannot be NULL")
	String contactNumber;
	@NotNull(message = "CreatedOn cannot be NULL")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	@PastOrPresent
	Timestamp createdOn;
	@NotNull(message = "CreatedBy cannot be NULL")
	Long createdBy;
	@NotNull(message = "DeviceType cannot be NULL")
	Integer deviceType;
	
public CompanyBranchInsert() {
	
}


public CompanyBranchInsert(
		@NotNull(message = "AddressLine1 cannot be NULL") String addressLine1,
		@NotNull(message = "AddressLine2 cannot be NULL") String addressLine2,
		@NotNull(message = "AddressLine3 cannot be NULL") String addressLine3,
		@NotNull(message = "Pincode cannot be NULL") Long pincode,
		@NotNull(message = "CityID cannot be NULL") Long cityID,
		@NotNull(message = "StateID cannot be NULL") Long stateID,
		@NotNull(message = "CountryID cannot be NULL") Long countryID,
		@NotNull(message = "Latitude cannot be NULL") String latitude,
		@NotNull(message = "Longitude cannot be NULL") String longitude,
		@NotNull(message = "CompanyId cannot be NULL") Long companyId,
		@NotNull(message = "CompanyRegionId cannot be NULL") Long companyRegionId,
		@NotNull(message = "CompanyAreaId cannot be NULL") Long companyAreaId,
		@NotNull(message = "CompanyBranchName cannot be NULL") String companyBranchName,
		@NotNull(message = "CompanyBranchCode cannot be NULL") String companyBranchCode,
		@NotNull(message = "CompanyBranchType cannot be NULL") Integer companyBranchType,
		@NotNull(message = "ExecutiveName cannot be NULL") String executiveName,
		@NotNull(message = "LoginID cannot be NULL") String loginID,
		@NotNull(message = "Password cannot be NULL") String password,
		@NotNull(message = "ContactNumber cannot be NULL") String contactNumber,
		@NotNull(message = "CreatedOn cannot be NULL") @PastOrPresent Timestamp createdOn,
		@NotNull(message = "CreatedBy cannot be NULL") Long createdBy,
		@NotNull(message = "DeviceType cannot be NULL") Integer deviceType) {
	super();
	this.addressLine1 = addressLine1;
	this.addressLine2 = addressLine2;
	this.addressLine3 = addressLine3;
	this.pincode = pincode;
	this.cityID = cityID;
	this.stateID = stateID;
	this.countryID = countryID;
	this.latitude = latitude;
	this.longitude = longitude;
	this.companyId = companyId;
	this.companyRegionId = companyRegionId;
	this.companyAreaId = companyAreaId;
	this.companyBranchName = companyBranchName;
	this.companyBranchCode = companyBranchCode;
	this.companyBranchType = companyBranchType;
	this.executiveName = executiveName;
	this.loginID = loginID;
	this.password = password;
	this.contactNumber = contactNumber;
	this.createdOn = createdOn;
	this.createdBy = createdBy;
	this.deviceType = deviceType;
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

public Long getPincode() {
	return pincode;
}

public void setPincode(Long pincode) {
	this.pincode = pincode;
}

public Long getCityID() {
	return cityID;
}

public void setCityID(Long cityID) {
	this.cityID = cityID;
}

public Long getStateID() {
	return stateID;
}

public void setStateID(Long stateID) {
	this.stateID = stateID;
}

public Long getCountryID() {
	return countryID;
}

public void setCountryID(Long countryID) {
	this.countryID = countryID;
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

public Long getCompanyId() {
	return companyId;
}

public void setCompanyId(Long companyId) {
	this.companyId = companyId;
}

public Long getCompanyRegionId() {
	return companyRegionId;
}

public void setCompanyRegionId(Long companyRegionId) {
	this.companyRegionId = companyRegionId;
}

public Long getCompanyAreaId() {
	return companyAreaId;
}

public void setCompanyAreaId(Long companyAreaId) {
	this.companyAreaId = companyAreaId;
}

public String getCompanyBranchName() {
	return companyBranchName;
}

public void setCompanyBranchName(String companyBranchName) {
	this.companyBranchName = companyBranchName;
}

public String getCompanyBranchCode() {
	return companyBranchCode;
}

public void setCompanyBranchCode(String companyBranchCode) {
	this.companyBranchCode = companyBranchCode;
}

public Integer getCompanyBranchType() {
	return companyBranchType;
}

public void setCompanyBranchType(Integer companyBranchType) {
	this.companyBranchType = companyBranchType;
}

public String getExecutiveName() {
	return executiveName;
}

public void setExecutiveName(String executiveName) {
	this.executiveName = executiveName;
}

public String getLoginID() {
	return loginID;
}

public void setLoginID(String loginID) {
	this.loginID = loginID;
}

public String getPassword() {
	return password;
}

public void setPassword(String password) {
	this.password = password;
}

public String getContactNumber() {
	return contactNumber;
}

public void setContactNumber(String contactNumber) {
	this.contactNumber = contactNumber;
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

public Integer getDeviceType() {
	return deviceType;
}

public void setDeviceType(Integer deviceType) {
	this.deviceType = deviceType;
}

}
