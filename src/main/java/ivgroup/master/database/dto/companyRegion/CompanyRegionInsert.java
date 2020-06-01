package ivgroup.master.database.dto.companyRegion;

import java.sql.Timestamp;

import javax.validation.constraints.NotEmpty;

import com.fasterxml.jackson.annotation.JsonFormat;

public class CompanyRegionInsert {
	@NotEmpty(message = "CompanyRegionName cannot be NULL")
	String companyRegionName;
	@NotEmpty(message = "CompanyRegionCode cannot be NULL")
	String companyRegionCode;
	@NotEmpty(message = "CompanyRegionDescription cannot be NULL")
	String companyRegionDescription;
	@NotEmpty(message = "CompanyID cannot be NULL")
	Long companyID;
	@NotEmpty(message = "CreatedOn cannot be NULL")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	Timestamp createdOn;
	@NotEmpty(message = "CreatedBy cannot be NULL")
	Long createdBy;
	@NotEmpty(message = "CreatedDeviceType cannot be NULL")
	Integer createdDeviceType;
	
	public CompanyRegionInsert() {
		
	}

	public CompanyRegionInsert(@NotEmpty(message = "CompanyRegionName cannot be NULL") String companyRegionName,
			@NotEmpty(message = "CompanyRegionCode cannot be NULL") String companyRegionCode,
			@NotEmpty(message = "CompanyRegionDescription cannot be NULL") String companyRegionDescription,
			@NotEmpty(message = "CompanyID cannot be NULL") Long companyID,
			@NotEmpty(message = "CreatedOn cannot be NULL") Timestamp createdOn,
			@NotEmpty(message = "CreatedBy cannot be NULL") Long createdBy,
			@NotEmpty(message = "CreatedDeviceType cannot be NULL") Integer createdDeviceType) {
		super();
		this.companyRegionName = companyRegionName;
		this.companyRegionCode = companyRegionCode;
		this.companyRegionDescription = companyRegionDescription;
		this.companyID = companyID;
		this.createdOn = createdOn;
		this.createdBy = createdBy;
		this.createdDeviceType = createdDeviceType;
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

	public Long getCompanyID() {
		return companyID;
	}

	public void setCompanyID(Long companyID) {
		this.companyID = companyID;
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
