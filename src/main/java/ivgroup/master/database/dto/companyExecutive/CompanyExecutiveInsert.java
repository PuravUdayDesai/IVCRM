package ivgroup.master.database.dto.companyExecutive;

import java.sql.Timestamp;

import javax.validation.constraints.NotEmpty;

import com.fasterxml.jackson.annotation.JsonFormat;

public class CompanyExecutiveInsert {

	@NotEmpty(message = "ExecutiveName cannot be NULL")
	String executiveName;
	@NotEmpty(message = "LoginId cannot be NULL")
	String loginId;
	@NotEmpty(message = "Password cannot be NULL")
	String password;
	@NotEmpty(message = "CompanyBranchId cannot be NULL")
	Long companyBranchId;
	@NotEmpty(message = "BaseCityId cannot be NULL")
	Long baseCityId;
	@NotEmpty(message = "CompanyId cannot be NULL")
	Long companyId;
	@NotEmpty(message = "ContactNumber cannot be NULL")
	String contactNumber;
	@NotEmpty(message = "CreatedOn cannot be NULL")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	Timestamp createdOn;
	@NotEmpty(message = "CreatedBy cannot be NULL")
	Long createdBy;
	@NotEmpty(message = "CreatedDeviceType cannot be NULL")
	Integer createdDeviceType;
	
	public CompanyExecutiveInsert() {
		
	}

	public CompanyExecutiveInsert(
			@NotEmpty(message = "ExecutiveName cannot be NULL") String executiveName,
			@NotEmpty(message = "LoginId cannot be NULL") String loginId,
			@NotEmpty(message = "Password cannot be NULL") String password,
			@NotEmpty(message = "CompanyBranchId cannot be NULL") Long companyBranchId,
			@NotEmpty(message = "BaseCityId cannot be NULL") Long baseCityId,
			@NotEmpty(message = "CompanyId cannot be NULL") Long companyId,
			@NotEmpty(message = "ContactNumber cannot be NULL") String contactNumber,
			@NotEmpty(message = "CreatedOn cannot be NULL") Timestamp createdOn,
			@NotEmpty(message = "CreatedBy cannot be NULL") Long createdBy,
			@NotEmpty(message = "CreatedDeviceType cannot be NULL") Integer createdDeviceType) {
		super();
		this.executiveName = executiveName;
		this.loginId = loginId;
		this.password = password;
		this.companyBranchId = companyBranchId;
		this.baseCityId = baseCityId;
		this.companyId = companyId;
		this.contactNumber = contactNumber;
		this.createdOn = createdOn;
		this.createdBy = createdBy;
		this.createdDeviceType = createdDeviceType;
	}

	public String getExecutiveName() {
		return executiveName;
	}

	public void setExecutiveName(String executiveName) {
		this.executiveName = executiveName;
	}

	public String getLoginId() {
		return loginId;
	}

	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Long getCompanyBranchId() {
		return companyBranchId;
	}

	public void setCompanyBranchId(Long companyBranchId) {
		this.companyBranchId = companyBranchId;
	}

	public Long getBaseCityId() {
		return baseCityId;
	}

	public void setBaseCityId(Long baseCityId) {
		this.baseCityId = baseCityId;
	}

	public Long getCompanyId() {
		return companyId;
	}

	public void setCompanyId(Long companyId) {
		this.companyId = companyId;
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

	public Integer getCreatedDeviceType() {
		return createdDeviceType;
	}

	public void setCreatedDeviceType(Integer createdDeviceType) {
		this.createdDeviceType = createdDeviceType;
	}
	
}
