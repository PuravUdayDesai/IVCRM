package ivgroup.master.database.dto.companyExecutive;

import java.sql.Timestamp;

import javax.validation.constraints.NotEmpty;

import com.fasterxml.jackson.annotation.JsonFormat;

public class CompanyExecutiveUpdate {

	String executiveName;
	String loginId;
	String password;
	Long companyBranchId;
	Long baseCityId;
	Long companyId;
	String contactNumber;
	Boolean isActive;
	@NotEmpty(message = "LastEditOn cannot be NULL")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	Timestamp lastEditOn;
	@NotEmpty(message = "LastEditBy cannot be NULL")
	Long lastEditBy;
	@NotEmpty(message = "LastEditDeviceType cannot be NULL")
	Integer lastEditDeviceType;
	
	public CompanyExecutiveUpdate() {
		
	}

	public CompanyExecutiveUpdate(String executiveName, String loginId, String password, Long companyBranchId,
			Long baseCityId, Long companyId, String contactNumber, Boolean isActive,
			@NotEmpty(message = "CreatedOn cannot be NULL") Timestamp lastEditOn,
			@NotEmpty(message = "CreatedBy cannot be NULL") Long lastEditBy,
			@NotEmpty(message = "CreatedDeviceType cannot be NULL") Integer lastEditDeviceType) {
		super();
		this.executiveName = executiveName;
		this.loginId = loginId;
		this.password = password;
		this.companyBranchId = companyBranchId;
		this.baseCityId = baseCityId;
		this.companyId = companyId;
		this.contactNumber = contactNumber;
		this.isActive = isActive;
		this.lastEditOn = lastEditOn;
		this.lastEditBy = lastEditBy;
		this.lastEditDeviceType = lastEditDeviceType;
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
	
	public Boolean getIsActive() {
		return isActive;
	}

	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}

	public Timestamp getLastEditOn() {
		return lastEditOn;
	}

	public void setLastEditOn(Timestamp lastEditOn) {
		this.lastEditOn = lastEditOn;
	}

	public Long getLastEditBy() {
		return lastEditBy;
	}

	public void setLastEditBy(Long lastEditBy) {
		this.lastEditBy = lastEditBy;
	}

	public Integer getLastEditDeviceType() {
		return lastEditDeviceType;
	}

	public void setLastEditDeviceType(Integer lastEditDeviceType) {
		this.lastEditDeviceType = lastEditDeviceType;
	}
	
	
}
