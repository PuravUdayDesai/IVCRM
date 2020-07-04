package ivgroup.master.database.dto.company;

import java.sql.Timestamp;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.PastOrPresent;

import com.fasterxml.jackson.annotation.JsonFormat;

public class CompanyInsertWithCompanyBranchType 
{
	@NotNull(message = "AddressLine1 cannot be NULL")
	private String addressLine1;
	@NotNull(message = "AddressLine2 cannot be NULL")
	private String addressLine2;
	@NotNull(message = "AddressLine3 cannot be NULL")
	private String addressLine3;
	@NotNull(message = "Pincode cannot be NULL")
	private Long pincode;
	@NotNull(message = "CityID cannot be NULL")
	private Long cityID;
	@NotNull(message = "StateID cannot be NULL")
	private Long stateID;
	@NotNull(message = "CountryID cannot be NULL")
	private Long countryID;
	@NotNull(message = "Latitude cannot be NULL")
	private String latitude;
	@NotNull(message = "Longitude cannot be NULL")
	private String longitude;
	@NotNull(message = "CompanyCode cannot be NULL")
	private String companyCode; 
	@NotNull(message = "CompanyName cannot be NULL")
	private String companyName; 
	@NotNull(message = "OwnerContactId cannot be NULL")
	private Long ownerContactId; 
	@NotNull(message = "CompanyRegionName cannot be NULL")
	private String companyRegionName;
	@NotNull(message = "CompanyRegionCode cannot be NULL")
	private String companyRegionCode; 
	@NotNull(message = "CompanyRegionDescription cannot be NULL")
	private String companyRegionDescription;
	@NotNull(message = "CompanyAreaName cannot be NULL")
	private String companyAreaName;
	@NotNull(message = "CompanyAreaCode cannot be NULL")
	private String companyAreaCode; 
	@NotNull(message = "CompanyAreaDescription cannot be NULL")
	private String companyAreaDescription;
	@NotNull(message = "CompanyBranchName cannot be NULL")
	private String companyBranchName;
	@NotNull(message = "CompanyBranchCode cannot be NULL")
	private String companyBranchCode;
	@NotNull(message = "CompanyBranchTypeName cannot be NULL")
	private String companyBranchTypeName;
	@NotNull(message = "CompanyBranchPosition cannot be NULL")
	private Integer companyBranchPosition;
	@NotNull(message = "ExecutiveName cannot be NULL")
	private String executiveName; 
	@NotNull(message = "LoginID cannot be NULL")
	private String loginID; 
	@NotNull(message = "Password cannot be NULL")
	private String password;
	@NotNull(message = "ContactNumber cannot be NULL")
	private String contactNumber;
	@NotNull(message = "CreatedOn cannot be NULL")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	@PastOrPresent
	private Timestamp createdOn;
	@NotNull(message = "CreatedBy cannot be NULL")
	private Long createdBy;
	@NotNull(message = "DeviceType cannot be NULL")
	private Integer deviceType;
	
	public CompanyInsertWithCompanyBranchType()
	{
		
	}

	public CompanyInsertWithCompanyBranchType(
			@NotNull(message = "AddressLine1 cannot be NULL") String addressLine1,
			@NotNull(message = "AddressLine2 cannot be NULL") String addressLine2,
			@NotNull(message = "AddressLine3 cannot be NULL") String addressLine3,
			@NotNull(message = "Pincode cannot be NULL") Long pincode,
			@NotNull(message = "CityID cannot be NULL") Long cityID,
			@NotNull(message = "StateID cannot be NULL") Long stateID,
			@NotNull(message = "CountryID cannot be NULL") Long countryID,
			@NotNull(message = "Latitude cannot be NULL") String latitude,
			@NotNull(message = "Longitude cannot be NULL") String longitude,
			@NotNull(message = "CompanyCode cannot be NULL") String companyCode,
			@NotNull(message = "CompanyName cannot be NULL") String companyName,
			@NotNull(message = "OwnerContactId cannot be NULL") Long ownerContactId,
			@NotNull(message = "CompanyRegionName cannot be NULL") String companyRegionName,
			@NotNull(message = "CompanyRegionCode cannot be NULL") String companyRegionCode,
			@NotNull(message = "CompanyRegionDescription cannot be NULL") String companyRegionDescription,
			@NotNull(message = "CompanyAreaName cannot be NULL") String companyAreaName,
			@NotNull(message = "CompanyAreaCode cannot be NULL") String companyAreaCode,
			@NotNull(message = "CompanyAreaDescription cannot be NULL") String companyAreaDescription,
			@NotNull(message = "CompanyBranchName cannot be NULL") String companyBranchName,
			@NotNull(message = "CompanyBranchCode cannot be NULL") String companyBranchCode,
			@NotNull(message = "CompanyBranchTypeName cannot be NULL") String companyBranchTypeName,
			@NotNull(message = "CompanyBranchPosition cannot be NULL") Integer companyBranchPosition,
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
		this.companyCode = companyCode;
		this.companyName = companyName;
		this.ownerContactId = ownerContactId;
		this.companyRegionName = companyRegionName;
		this.companyRegionCode = companyRegionCode;
		this.companyRegionDescription = companyRegionDescription;
		this.companyAreaName = companyAreaName;
		this.companyAreaCode = companyAreaCode;
		this.companyAreaDescription = companyAreaDescription;
		this.companyBranchName = companyBranchName;
		this.companyBranchCode = companyBranchCode;
		this.companyBranchTypeName = companyBranchTypeName;
		this.companyBranchPosition = companyBranchPosition;
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

	public String getCompanyCode() {
		return companyCode;
	}

	public void setCompanyCode(String companyCode) {
		this.companyCode = companyCode;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public Long getOwnerContactId() {
		return ownerContactId;
	}

	public void setOwnerContactId(Long ownerContactId) {
		this.ownerContactId = ownerContactId;
	}

	public String getCompanyRegionName() {
		return companyRegionName;
	}

	public void setCompanyRegionName(String companyRegionName) {
		this.companyRegionName = companyRegionName;
	}

	public String getCompanyRegionCode() {
		return companyRegionCode;
	}

	public void setCompanyRegionCode(String companyRegionCode) {
		this.companyRegionCode = companyRegionCode;
	}

	public String getCompanyRegionDescription() {
		return companyRegionDescription;
	}

	public void setCompanyRegionDescription(String companyRegionDescription) {
		this.companyRegionDescription = companyRegionDescription;
	}

	public String getCompanyAreaName() {
		return companyAreaName;
	}

	public void setCompanyAreaName(String companyAreaName) {
		this.companyAreaName = companyAreaName;
	}

	public String getCompanyAreaCode() {
		return companyAreaCode;
	}

	public void setCompanyAreaCode(String companyAreaCode) {
		this.companyAreaCode = companyAreaCode;
	}

	public String getCompanyAreaDescription() {
		return companyAreaDescription;
	}

	public void setCompanyAreaDescription(String companyAreaDescription) {
		this.companyAreaDescription = companyAreaDescription;
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

	public String getCompanyBranchTypeName() {
		return companyBranchTypeName;
	}

	public void setCompanyBranchTypeName(String companyBranchTypeName) {
		this.companyBranchTypeName = companyBranchTypeName;
	}

	public Integer getCompanyBranchPosition() {
		return companyBranchPosition;
	}

	public void setCompanyBranchPosition(Integer companyBranchPosition) {
		this.companyBranchPosition = companyBranchPosition;
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
