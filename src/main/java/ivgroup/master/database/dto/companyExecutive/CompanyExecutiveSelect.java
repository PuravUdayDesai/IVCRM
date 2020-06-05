package ivgroup.master.database.dto.companyExecutive;

import javax.validation.constraints.NotNull;

public class CompanyExecutiveSelect {
	
	@NotNull(message = "ExecutiveId cannot be NULL")
	String executiveId;
	@NotNull(message = "ExecutiveName cannot be NULL")
	String executiveName;
	@NotNull(message = "LoginID cannot be NULL")
	String loginID;
	@NotNull(message = "Password cannot be NULL")
	String password;
	@NotNull(message = "CompanyBranchID cannot be NULL")
	Long companyBranchID;
	@NotNull(message = "CompanyBranchName cannot be NULL")
	String companyBranchName;
	@NotNull(message = "CompanyBranchCode cannot be NULL")
	String companyBranchCode;
	@NotNull(message = "BaseCityID cannot be NULL")
	Long cityID;
	@NotNull(message = "CityName cannot be NULL")
	String cityName;
	@NotNull(message = "CompanyID cannot be NULL")
	Long companyID;
	@NotNull(message = "CompanyName cannot be NULL")
	String companyName;
	@NotNull(message = "CompanyCode cannot be NULL")
	String companyCode;
	@NotNull(message = "ContactNumber cannot be NULL")
	String contactNumber;
	@NotNull(message = "IsActive cannot be NULL")
	Boolean isActive;
	
	public CompanyExecutiveSelect()
	{
		
	}

	public CompanyExecutiveSelect(
			@NotNull(message = "ExecutiveId cannot be NULL") String executiveId,
			@NotNull(message = "ExecutiveName cannot be NULL") String executiveName,
			@NotNull(message = "LoginID cannot be NULL") String loginID,
			@NotNull(message = "Password cannot be NULL") String password,
			@NotNull(message = "CompanyBranchID cannot be NULL") Long companyBranchID,
			@NotNull(message = "CompanyBranchName cannot be NULL") String companyBranchName,
			@NotNull(message = "CompanyBranchCode cannot be NULL") String companyBranchCode,
			@NotNull(message = "BaseCityID cannot be NULL") Long cityID,
			@NotNull(message = "CityName cannot be NULL") String cityName,
			@NotNull(message = "CompanyID cannot be NULL") Long companyID,
			@NotNull(message = "CompanyName cannot be NULL") String companyName,
			@NotNull(message = "CompanyCode cannot be NULL") String companyCode,
			@NotNull(message = "ContactNumber cannot be NULL") String contactNumber,
			@NotNull(message = "IsActive cannot be NULL") Boolean isActive) {
		super();
		this.executiveId = executiveId;
		this.executiveName = executiveName;
		this.loginID = loginID;
		this.password = password;
		this.companyBranchID = companyBranchID;
		this.companyBranchName = companyBranchName;
		this.companyBranchCode = companyBranchCode;
		this.cityID = cityID;
		this.cityName = cityName;
		this.companyID = companyID;
		this.companyName = companyName;
		this.companyCode = companyCode;
		this.contactNumber = contactNumber;
		this.isActive = isActive;
	}

	public String getExecutiveId() {
		return executiveId;
	}

	public void setExecutiveId(String executiveId) {
		this.executiveId = executiveId;
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

	public Long getCompanyBranchID() {
		return companyBranchID;
	}

	public void setCompanyBranchID(Long companyBranchID) {
		this.companyBranchID = companyBranchID;
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

	public Long getCityID() {
		return cityID;
	}

	public void setCityID(Long cityID) {
		this.cityID = cityID;
	}

	public String getCityName() {
		return cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	public Long getCompanyID() {
		return companyID;
	}

	public void setCompanyID(Long companyID) {
		this.companyID = companyID;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getCompanyCode() {
		return companyCode;
	}

	public void setCompanyCode(String companyCode) {
		this.companyCode = companyCode;
	}

	public String getContactNumber() {
		return contactNumber;
	}

	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}

	public Boolean getIsActive() {
		return isActive;
	}

	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}

}
