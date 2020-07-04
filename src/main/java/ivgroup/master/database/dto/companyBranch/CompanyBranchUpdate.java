package ivgroup.master.database.dto.companyBranch;

import java.sql.Timestamp;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.PastOrPresent;

import com.fasterxml.jackson.annotation.JsonFormat;

public class CompanyBranchUpdate {
	
	private String companyBranchName;
	private String companyBranchCode;
	private Long companyRegionId;
	private Long companyAreaId;
	private Long companyId;
	private Integer companyBranchType;
	private Long companyBranchAddress;
	private Long companyBranchPrimaryContact;
	private Boolean isActive;
	@NotNull(message = "CreatedOn cannot be NULL")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	@PastOrPresent
	private Timestamp lastEditOn;
	@NotNull(message = "CreatedBy cannot be NULL")
	private Long lastEditBy;
	@NotNull(message = "CreatedDeviceType cannot be NULL")
	private Integer lastEditDeviceType;
	
	public CompanyBranchUpdate() {
		
	}

	public CompanyBranchUpdate(String companyBranchName, String companyBranchCode, Long companyRegionId,
			Long companyAreaId, Long companyId, Integer companyBranchType, Long companyBranchAddress,
			Long companyBranchPrimaryContact, Boolean isActive,
			@NotNull(message = "CreatedOn cannot be NULL") @PastOrPresent Timestamp lastEditOn,
			@NotNull(message = "CreatedBy cannot be NULL") Long lastEditBy,
			@NotNull(message = "CreatedDeviceType cannot be NULL") Integer lastEditDeviceType) {
		super();
		this.companyBranchName = companyBranchName;
		this.companyBranchCode = companyBranchCode;
		this.companyRegionId = companyRegionId;
		this.companyAreaId = companyAreaId;
		this.companyId = companyId;
		this.companyBranchType = companyBranchType;
		this.companyBranchAddress = companyBranchAddress;
		this.companyBranchPrimaryContact = companyBranchPrimaryContact;
		this.isActive = isActive;
		this.lastEditOn = lastEditOn;
		this.lastEditBy = lastEditBy;
		this.lastEditDeviceType = lastEditDeviceType;
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

	public Long getCompanyRegionId() {
		return companyRegionId;
	}

	public void setCompanyRegionId(Long companyRegionId) {
		this.companyRegionId = companyRegionId;
	}

	public Long getCompanyAreaId() {
		return companyAreaId;
	}

	public void setCompanyAreaId(Long companyAreaId) {
		this.companyAreaId = companyAreaId;
	}

	public Long getCompanyId() {
		return companyId;
	}

	public void setCompanyId(Long companyId) {
		this.companyId = companyId;
	}

	public Integer getCompanyBranchType() {
		return companyBranchType;
	}

	public void setCompanyBranchType(Integer companyBranchType) {
		this.companyBranchType = companyBranchType;
	}

	public Long getCompanyBranchAddress() {
		return companyBranchAddress;
	}

	public void setCompanyBranchAddress(Long companyBranchAddress) {
		this.companyBranchAddress = companyBranchAddress;
	}

	public Long getCompanyBranchPrimaryContact() {
		return companyBranchPrimaryContact;
	}

	public void setCompanyBranchPrimaryContact(Long companyBranchPrimaryContact) {
		this.companyBranchPrimaryContact = companyBranchPrimaryContact;
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
