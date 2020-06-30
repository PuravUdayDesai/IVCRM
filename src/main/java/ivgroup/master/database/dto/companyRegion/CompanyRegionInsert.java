package ivgroup.master.database.dto.companyRegion;

import java.sql.Timestamp;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.PastOrPresent;

import com.fasterxml.jackson.annotation.JsonFormat;

public class CompanyRegionInsert {
	@NotNull(message = "CompanyRegionName cannot be NULL")
	String companyRegionName;
	@NotNull(message = "CompanyRegionCode cannot be NULL")
	String companyRegionCode;
	@NotNull(message = "CompanyRegionDescription cannot be NULL")
	String companyRegionDescription;
	@NotNull(message = "CompanyID cannot be NULL")
	Long companyID;
	@NotNull(message = "CreatedOn cannot be NULL")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	@PastOrPresent
	Timestamp createdOn;
	@NotNull(message = "CreatedBy cannot be NULL")
	Long createdBy;
	@NotNull(message = "CreatedDeviceType cannot be NULL")
	Integer createdDeviceType;
	
	public CompanyRegionInsert() {
		
	}

	public CompanyRegionInsert(@NotNull(message = "CompanyRegionName cannot be NULL") String companyRegionName,
			@NotNull(message = "CompanyRegionCode cannot be NULL") String companyRegionCode,
			@NotNull(message = "CompanyRegionDescription cannot be NULL") String companyRegionDescription,
			@NotNull(message = "CompanyID cannot be NULL") Long companyID,
			@NotNull(message = "CreatedOn cannot be NULL") @PastOrPresent Timestamp createdOn,
			@NotNull(message = "CreatedBy cannot be NULL") Long createdBy,
			@NotNull(message = "CreatedDeviceType cannot be NULL") Integer createdDeviceType) {
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
