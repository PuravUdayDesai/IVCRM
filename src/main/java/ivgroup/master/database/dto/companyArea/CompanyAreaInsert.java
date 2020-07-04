package ivgroup.master.database.dto.companyArea;

import java.sql.Timestamp;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.PastOrPresent;

import com.fasterxml.jackson.annotation.JsonFormat;

public class CompanyAreaInsert {
	
	@NotNull(message = "CompanyAreaName cannot be NULL")
	private String companyAreaName;
	@NotNull(message = "CompanyAreaCode cannot be NULL")
	private String companyAreaCode;
	@NotNull(message = "CompanyAreaDescription cannot be NULL")
	private String companyAreaDescription;
	@NotNull(message = "CompanyID cannot be NULL")
	private Long companyID;
	@NotNull(message = "CompanyRegionID cannot be NULL")
	private Long companyRegionID;
	@NotNull(message = "CreatedOn cannot be NULL")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	@PastOrPresent
	private Timestamp createdOn;
	@NotNull(message = "CreatedBy cannot be NULL")
	private Long createdBy;
	@NotNull(message = "CreatedDeviceType cannot be NULL")
	private Integer createdDeviceType;
	
	public CompanyAreaInsert() {
		
	}

	public CompanyAreaInsert(@NotNull(message = "CompanyAreaName cannot be NULL") String companyAreaName,
			@NotNull(message = "CompanyAreaCode cannot be NULL") String companyAreaCode,
			@NotNull(message = "CompanyAreaDescription cannot be NULL") String companyAreaDescription,
			@NotNull(message = "CompanyID cannot be NULL") Long companyID,
			@NotNull(message = "CompanyRegionID cannot be NULL") Long companyRegionID,
			@NotNull(message = "CreatedOn cannot be NULL") @PastOrPresent Timestamp createdOn,
			@NotNull(message = "CreatedBy cannot be NULL") Long createdBy,
			@NotNull(message = "CreatedDeviceType cannot be NULL") Integer createdDeviceType) {
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
