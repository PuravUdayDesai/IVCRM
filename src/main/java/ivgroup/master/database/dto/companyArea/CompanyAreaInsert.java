package ivgroup.master.database.dto.companyArea;

import java.sql.Timestamp;

import javax.validation.constraints.NotEmpty;

import com.fasterxml.jackson.annotation.JsonFormat;

public class CompanyAreaInsert {
	@NotEmpty(message = "CompanyAreaName cannot be NULL")
	String companyAreaName;
	@NotEmpty(message = "CompanyAreaCode cannot be NULL")
	String companyAreaCode;
	@NotEmpty(message = "CompanyAreaDescription cannot be NULL")
	String companyAreaDescription;
	@NotEmpty(message = "CompanyID cannot be NULL")
	Long companyID;
	@NotEmpty(message = "CompanyRegionID cannot be NULL")
	Long companyRegionID;
	@NotEmpty(message = "CreatedOn cannot be NULL")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	Timestamp createdOn;
	@NotEmpty(message = "CreatedBy cannot be NULL")
	Long createdBy;
	@NotEmpty(message = "CreatedDeviceType cannot be NULL")
	Integer createdDeviceType;
	
	public CompanyAreaInsert() {
		
	}

	public CompanyAreaInsert(@NotEmpty(message = "CompanyAreaName cannot be NULL") String companyAreaName,
			@NotEmpty(message = "CompanyAreaCode cannot be NULL") String companyAreaCode,
			@NotEmpty(message = "CompanyAreaDescription cannot be NULL") String companyAreaDescription,
			@NotEmpty(message = "CompanyID cannot be NULL") Long companyID,
			@NotEmpty(message = "CompanyRegionID cannot be NULL") Long companyRegionID,
			@NotEmpty(message = "CreatedOn cannot be NULL") Timestamp createdOn,
			@NotEmpty(message = "CreatedBy cannot be NULL") Long createdBy,
			@NotEmpty(message = "CreatedDeviceType cannot be NULL") Integer createdDeviceType) {
		super();
		this.companyAreaName = companyAreaName;
		this.companyAreaCode = companyAreaCode;
		this.companyAreaDescription = companyAreaDescription;
		this.companyID = companyID;
		this.companyRegionID = companyRegionID;
		this.createdOn = createdOn;
		this.createdBy = createdBy;
		this.createdDeviceType = createdDeviceType;
	}

	public String getCompanyAreaName() {
		return companyAreaName;
	}

	public void setCompanyAreaName(String CompanyAreaName) {
		this.companyAreaName = CompanyAreaName;
	}

	public String getCompanyAreaCode() {
		return companyAreaCode;
	}

	public void setCompanyAreaCode(String CompanyAreaCode) {
		this.companyAreaCode = CompanyAreaCode;
	}

	public String getCompanyAreaDescription() {
		return companyAreaDescription;
	}

	public void setCompanyAreaDescription(String CompanyAreaDescription) {
		this.companyAreaDescription = CompanyAreaDescription;
	}

	public Long getCompanyID() {
		return companyID;
	}

	public void setCompanyID(Long companyID) {
		this.companyID = companyID;
	}
	
	public Long getCompanyRegionID() {
		return companyRegionID;
	}

	public void setCompanyRegionID(Long companyRegionID) {
		this.companyRegionID = companyRegionID;
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
