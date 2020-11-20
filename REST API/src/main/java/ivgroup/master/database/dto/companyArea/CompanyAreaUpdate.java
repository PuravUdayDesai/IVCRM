package ivgroup.master.database.dto.companyArea;

import java.sql.Timestamp;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.PastOrPresent;

import com.fasterxml.jackson.annotation.JsonFormat;

public class CompanyAreaUpdate {
	
	private String CompanyAreaName;
	private String CompanyAreaCode;
	private String CompanyAreaDescription;
	private Long companyID;
	private Long companyRegionID;
	private Boolean isActive;
	@NotNull(message = "LastEditOn cannot be NULL")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	@PastOrPresent
	private Timestamp lastEditOn;
	@NotNull(message = "LastEditBy cannot be NULL")
	private Long lastEditBy;
	@NotNull(message = "LastEditDeviceType cannot be NULL")
	private Integer lastEditDeviceType;
	
	public CompanyAreaUpdate() {
		
	}

	public CompanyAreaUpdate(String CompanyAreaName, String CompanyAreaCode, String CompanyAreaDescription,
			Long companyID,Long companyRegionID,Boolean isActive,
			@NotNull(message = "LastEditOn cannot be NULL") @PastOrPresent Timestamp lastEditOn,
			@NotNull(message = "LastEditBy cannot be NULL") Long lastEditBy,
			@NotNull(message = "LastEditDeviceType cannot be NULL") Integer lastEditDeviceType) {
		super();
		this.CompanyAreaName = CompanyAreaName;
		this.CompanyAreaCode = CompanyAreaCode;
		this.CompanyAreaDescription = CompanyAreaDescription;
		this.companyID = companyID;
		this.companyRegionID = companyRegionID;
		this.isActive = isActive;
		this.lastEditOn = lastEditOn;
		this.lastEditBy = lastEditBy;
		this.lastEditDeviceType = lastEditDeviceType;
	}

	public String getCompanyAreaName() {
		return CompanyAreaName;
	}

	public void setCompanyAreaName(String CompanyAreaName) {
		this.CompanyAreaName = CompanyAreaName;
	}

	public String getCompanyAreaCode() {
		return CompanyAreaCode;
	}

	public void setCompanyAreaCode(String CompanyAreaCode) {
		this.CompanyAreaCode = CompanyAreaCode;
	}

	public String getCompanyAreaDescription() {
		return CompanyAreaDescription;
	}

	public void setCompanyAreaDescription(String CompanyAreaDescription) {
		this.CompanyAreaDescription = CompanyAreaDescription;
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
