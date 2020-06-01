package ivgroup.master.database.dto.companyBranch;

import javax.validation.constraints.NotEmpty;

public class CompanyBranchSelect {
	@NotEmpty(message = "companyBranchID cannot be NULL")
		Long CompanyBranchID;
	@NotEmpty(message = "companyBranchName cannot be NULL")
		String CompanyBranchName;
	@NotEmpty(message = "companyBranchCode cannot be NULL")
		String CompanyBranchCode;
	@NotEmpty(message = "companyRegionID cannot be NULL")
		Long CompanyRegionID;
	@NotEmpty(message = "companyRegionName cannot be NULL")
		String CompanyRegionName;
	@NotEmpty(message = "companyRegionCode cannot be NULL")
		String CompanyRegionCode;
	@NotEmpty(message = "companyAreaID cannot be NULL")
		Long CompanyAreaID;
	@NotEmpty(message = "companyAreaName cannot be NULL")
		String CompanyAreaName;
	@NotEmpty(message = "companyAreaCode cannot be NULL")
		String CompanyAreaCode;
	@NotEmpty(message = "companyBranchType cannot be NULL")
		Integer CompanyBranchType;
	@NotEmpty(message = "companyId cannot be NULL")
		Long CompanyId; 
	@NotEmpty(message = "companyName cannot be NULL")
		String CompanyName;
	@NotEmpty(message = "companyCode cannot be NULL")
		String CompanyCode;  
	@NotEmpty(message = "addressLine1 cannot be NULL")
		String AddressLine1; 
	@NotEmpty(message = "addressLine2 cannot be NULL")
		String AddressLine2; 
	@NotEmpty(message = "addressLine3 cannot be NULL")
		String AddressLine3; 
	@NotEmpty(message = "pincode cannot be NULL")
		Long Pincode; 
	@NotEmpty(message = "cityID cannot be NULL")
		Long CityID; 
	@NotEmpty(message = "cityName cannot be NULL")
		String CityName; 
	@NotEmpty(message = "stateID cannot be NULL")
		Long StateID; 
	@NotEmpty(message = "countryID cannot be NULL")
		Long CountryID; 
	@NotEmpty(message = "latitude cannot be NULL")
		String Latitude; 
	@NotEmpty(message = "longitude cannot be NULL")
		String Longitude; 
	@NotEmpty(message = "executiveId cannot be NULL")
		Long ExecutiveId;
	@NotEmpty(message = "executiveName cannot be NULL")
		String ExecutiveName;
	@NotEmpty(message = "contactNumber cannot be NULL")
		String ContactNumber;
	@NotEmpty(message = "ssActive cannot be NULL")
		Boolean IsActive;
	
public CompanyBranchSelect() {
	
}

public CompanyBranchSelect(
		@NotEmpty(message = "companyBranchID cannot be NULL") Long companyBranchID,
		@NotEmpty(message = "companyBranchName cannot be NULL") String companyBranchName,
		@NotEmpty(message = "companyBranchCode cannot be NULL") String companyBranchCode,
		@NotEmpty(message = "companyRegionID cannot be NULL") Long companyRegionID,
		@NotEmpty(message = "companyRegionName cannot be NULL") String companyRegionName,
		@NotEmpty(message = "companyRegionCode cannot be NULL") String companyRegionCode,
		@NotEmpty(message = "companyAreaID cannot be NULL") Long companyAreaID,
		@NotEmpty(message = "companyAreaName cannot be NULL") String companyAreaName,
		@NotEmpty(message = "companyAreaCode cannot be NULL") String companyAreaCode,
		@NotEmpty(message = "companyBranchType cannot be NULL") Integer companyBranchType,
		@NotEmpty(message = "companyId cannot be NULL") Long companyId,
		@NotEmpty(message = "companyName cannot be NULL") String companyName,
		@NotEmpty(message = "companyCode cannot be NULL") String companyCode,
		@NotEmpty(message = "addressLine1 cannot be NULL") String addressLine1,
		@NotEmpty(message = "addressLine2 cannot be NULL") String addressLine2,
		@NotEmpty(message = "addressLine3 cannot be NULL") String addressLine3,
		@NotEmpty(message = "pincode cannot be NULL") Long pincode,
		@NotEmpty(message = "cityID cannot be NULL") Long cityID,
		@NotEmpty(message = "cityName cannot be NULL") String cityName,
		@NotEmpty(message = "stateID cannot be NULL") Long stateID,
		@NotEmpty(message = "countryID cannot be NULL") Long countryID,
		@NotEmpty(message = "latitude cannot be NULL") String latitude,
		@NotEmpty(message = "longitude cannot be NULL") String longitude,
		@NotEmpty(message = "executiveId cannot be NULL") Long executiveId,
		@NotEmpty(message = "executiveName cannot be NULL") String executiveName,
		@NotEmpty(message = "contactNumber cannot be NULL") String contactNumber,
		@NotEmpty(message = "ssActive cannot be NULL") Boolean isActive) {
	super();
	CompanyBranchID = companyBranchID;
	CompanyBranchName = companyBranchName;
	CompanyBranchCode = companyBranchCode;
	CompanyRegionID = companyRegionID;
	CompanyRegionName = companyRegionName;
	CompanyRegionCode = companyRegionCode;
	CompanyAreaID = companyAreaID;
	CompanyAreaName = companyAreaName;
	CompanyAreaCode = companyAreaCode;
	CompanyBranchType = companyBranchType;
	CompanyId = companyId;
	CompanyName = companyName;
	CompanyCode = companyCode;
	AddressLine1 = addressLine1;
	AddressLine2 = addressLine2;
	AddressLine3 = addressLine3;
	Pincode = pincode;
	CityID = cityID;
	CityName = cityName;
	StateID = stateID;
	CountryID = countryID;
	Latitude = latitude;
	Longitude = longitude;
	ExecutiveId = executiveId;
	ExecutiveName = executiveName;
	ContactNumber = contactNumber;
	IsActive = isActive;
}

public Long getCompanyBranchID() {
	return CompanyBranchID;
}

public void setCompanyBranchID(Long companyBranchID) {
	CompanyBranchID = companyBranchID;
}

public String getCompanyBranchName() {
	return CompanyBranchName;
}

public void setCompanyBranchName(String companyBranchName) {
	CompanyBranchName = companyBranchName;
}

public String getCompanyBranchCode() {
	return CompanyBranchCode;
}

public void setCompanyBranchCode(String companyBranchCode) {
	CompanyBranchCode = companyBranchCode;
}

public Long getCompanyRegionID() {
	return CompanyRegionID;
}

public void setCompanyRegionID(Long companyRegionID) {
	CompanyRegionID = companyRegionID;
}

public String getCompanyRegionName() {
	return CompanyRegionName;
}

public void setCompanyRegionName(String companyRegionName) {
	CompanyRegionName = companyRegionName;
}

public String getCompanyRegionCode() {
	return CompanyRegionCode;
}

public void setCompanyRegionCode(String companyRegionCode) {
	CompanyRegionCode = companyRegionCode;
}

public Long getCompanyAreaID() {
	return CompanyAreaID;
}

public void setCompanyAreaID(Long companyAreaID) {
	CompanyAreaID = companyAreaID;
}

public String getCompanyAreaName() {
	return CompanyAreaName;
}

public void setCompanyAreaName(String companyAreaName) {
	CompanyAreaName = companyAreaName;
}

public String getCompanyAreaCode() {
	return CompanyAreaCode;
}

public void setCompanyAreaCode(String companyAreaCode) {
	CompanyAreaCode = companyAreaCode;
}

public Integer getCompanyBranchType() {
	return CompanyBranchType;
}

public void setCompanyBranchType(Integer companyBranchType) {
	CompanyBranchType = companyBranchType;
}

public Long getCompanyId() {
	return CompanyId;
}

public void setCompanyId(Long companyId) {
	CompanyId = companyId;
}

public String getCompanyName() {
	return CompanyName;
}

public void setCompanyName(String companyName) {
	CompanyName = companyName;
}

public String getCompanyCode() {
	return CompanyCode;
}

public void setCompanyCode(String companyCode) {
	CompanyCode = companyCode;
}

public String getAddressLine1() {
	return AddressLine1;
}

public void setAddressLine1(String addressLine1) {
	AddressLine1 = addressLine1;
}

public String getAddressLine2() {
	return AddressLine2;
}

public void setAddressLine2(String addressLine2) {
	AddressLine2 = addressLine2;
}

public String getAddressLine3() {
	return AddressLine3;
}

public void setAddressLine3(String addressLine3) {
	AddressLine3 = addressLine3;
}

public Long getPincode() {
	return Pincode;
}

public void setPincode(Long pincode) {
	Pincode = pincode;
}

public Long getCityID() {
	return CityID;
}

public void setCityID(Long cityID) {
	CityID = cityID;
}

public String getCityName() {
	return CityName;
}

public void setCityName(String cityName) {
	CityName = cityName;
}

public Long getStateID() {
	return StateID;
}

public void setStateID(Long stateID) {
	StateID = stateID;
}

public Long getCountryID() {
	return CountryID;
}

public void setCountryID(Long countryID) {
	CountryID = countryID;
}

public String getLatitude() {
	return Latitude;
}

public void setLatitude(String latitude) {
	Latitude = latitude;
}

public String getLongitude() {
	return Longitude;
}

public void setLongitude(String longitude) {
	Longitude = longitude;
}

public Long getExecutiveId() {
	return ExecutiveId;
}

public void setExecutiveId(Long executiveId) {
	ExecutiveId = executiveId;
}

public String getExecutiveName() {
	return ExecutiveName;
}

public void setExecutiveName(String executiveName) {
	ExecutiveName = executiveName;
}

public String getContactNumber() {
	return ContactNumber;
}

public void setContactNumber(String contactNumber) {
	ContactNumber = contactNumber;
}

public Boolean getIsActive() {
	return IsActive;
}

public void setIsActive(Boolean isActive) {
	IsActive = isActive;
}
	
}
