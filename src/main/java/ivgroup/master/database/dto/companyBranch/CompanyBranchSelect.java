package ivgroup.master.database.dto.companyBranch;

import javax.validation.constraints.NotNull;

public class CompanyBranchSelect {
	@NotNull(message = "companyBranchID cannot be NULL")
		Long CompanyBranchID;
	@NotNull(message = "companyBranchName cannot be NULL")
		String CompanyBranchName;
	@NotNull(message = "companyBranchCode cannot be NULL")
		String CompanyBranchCode;
	@NotNull(message = "companyRegionID cannot be NULL")
		Long CompanyRegionID;
	@NotNull(message = "companyRegionName cannot be NULL")
		String CompanyRegionName;
	@NotNull(message = "companyRegionCode cannot be NULL")
		String CompanyRegionCode;
	@NotNull(message = "companyAreaID cannot be NULL")
		Long CompanyAreaID;
	@NotNull(message = "companyAreaName cannot be NULL")
		String CompanyAreaName;
	@NotNull(message = "companyAreaCode cannot be NULL")
		String CompanyAreaCode;
	@NotNull(message = "companyBranchType cannot be NULL")
		Integer CompanyBranchType;
	@NotNull(message = "companyId cannot be NULL")
		Long CompanyId; 
	@NotNull(message = "companyName cannot be NULL")
		String CompanyName;
	@NotNull(message = "companyCode cannot be NULL")
		String CompanyCode;  
	@NotNull(message = "addressLine1 cannot be NULL")
		String AddressLine1; 
	@NotNull(message = "addressLine2 cannot be NULL")
		String AddressLine2; 
	@NotNull(message = "addressLine3 cannot be NULL")
		String AddressLine3; 
	@NotNull(message = "pincode cannot be NULL")
		Long Pincode; 
	@NotNull(message = "cityID cannot be NULL")
		Long CityID; 
	@NotNull(message = "cityName cannot be NULL")
		String CityName; 
	@NotNull(message = "stateID cannot be NULL")
		Long StateID; 
	@NotNull(message = "countryID cannot be NULL")
		Long CountryID; 
	@NotNull(message = "latitude cannot be NULL")
		String Latitude; 
	@NotNull(message = "longitude cannot be NULL")
		String Longitude; 
	@NotNull(message = "executiveId cannot be NULL")
		Long ExecutiveId;
	@NotNull(message = "executiveName cannot be NULL")
		String ExecutiveName;
	@NotNull(message = "contactNumber cannot be NULL")
		String ContactNumber;
	@NotNull(message = "ssActive cannot be NULL")
		Boolean IsActive;
	
public CompanyBranchSelect() {
	
}

public CompanyBranchSelect(
		@NotNull(message = "companyBranchID cannot be NULL") Long companyBranchID,
		@NotNull(message = "companyBranchName cannot be NULL") String companyBranchName,
		@NotNull(message = "companyBranchCode cannot be NULL") String companyBranchCode,
		@NotNull(message = "companyRegionID cannot be NULL") Long companyRegionID,
		@NotNull(message = "companyRegionName cannot be NULL") String companyRegionName,
		@NotNull(message = "companyRegionCode cannot be NULL") String companyRegionCode,
		@NotNull(message = "companyAreaID cannot be NULL") Long companyAreaID,
		@NotNull(message = "companyAreaName cannot be NULL") String companyAreaName,
		@NotNull(message = "companyAreaCode cannot be NULL") String companyAreaCode,
		@NotNull(message = "companyBranchType cannot be NULL") Integer companyBranchType,
		@NotNull(message = "companyId cannot be NULL") Long companyId,
		@NotNull(message = "companyName cannot be NULL") String companyName,
		@NotNull(message = "companyCode cannot be NULL") String companyCode,
		@NotNull(message = "addressLine1 cannot be NULL") String addressLine1,
		@NotNull(message = "addressLine2 cannot be NULL") String addressLine2,
		@NotNull(message = "addressLine3 cannot be NULL") String addressLine3,
		@NotNull(message = "pincode cannot be NULL") Long pincode,
		@NotNull(message = "cityID cannot be NULL") Long cityID,
		@NotNull(message = "cityName cannot be NULL") String cityName,
		@NotNull(message = "stateID cannot be NULL") Long stateID,
		@NotNull(message = "countryID cannot be NULL") Long countryID,
		@NotNull(message = "latitude cannot be NULL") String latitude,
		@NotNull(message = "longitude cannot be NULL") String longitude,
		@NotNull(message = "executiveId cannot be NULL") Long executiveId,
		@NotNull(message = "executiveName cannot be NULL") String executiveName,
		@NotNull(message = "contactNumber cannot be NULL") String contactNumber,
		@NotNull(message = "ssActive cannot be NULL") Boolean isActive) {
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
