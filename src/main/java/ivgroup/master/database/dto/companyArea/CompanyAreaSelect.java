package ivgroup.master.database.dto.companyArea;

import javax.validation.constraints.NotNull;

public class CompanyAreaSelect {
	
	@NotNull(message = "CompanyAreaID cannot be NULL")
	Long companyAreaID;
	@NotNull(message = "CompanyAreaName cannot be NULL")
	String companyAreaName;
	@NotNull(message = "CompanyAreaCode cannot be NULL")
	String companyAreaCode;
	@NotNull(message = "CompanyAreaDescription cannot be NULL")
	String companyAreaDescription;
	@NotNull(message = "CompanyID cannot be NULL")
	Long companyID;
	@NotNull(message = "CompanyName cannot be NULL")
	String companyName;
	@NotNull(message = "CompanyCode cannot be NULL")
	String companyCode;
	@NotNull(message = "CompanyRegionId cannot be NULL")
	Long companyRegionId;
	@NotNull(message = "CompanyRegionName cannot be NULL")
	String companyRegionName;
	@NotNull(message = "CompanyRegionCode cannot be NULL")
	String companyRegionCode;
	@NotNull(message = "IsActive cannot be NULL")
	Boolean isActive;
	
	public CompanyAreaSelect() {
		
	}

	public CompanyAreaSelect(@NotNull(message = "CompanyAreaID cannot be NULL") Long companyAreaID,
			@NotNull(message = "CompanyAreaName cannot be NULL") String companyAreaName,
			@NotNull(message = "CompanyAreaCode cannot be NULL") String companyAreaCode,
			@NotNull(message = "CompanyAreaDescription cannot be NULL") String companyAreaDescription,
			@NotNull(message = "CompanyID cannot be NULL") Long companyID,
			@NotNull(message = "CompanyName cannot be NULL") String companyName,
			@NotNull(message = "CompanyCode cannot be NULL") String companyCode,
			@NotNull(message = "CompanyRegionId cannot be NULL") Long companyRegionId,
			@NotNull(message = "CompanyRegionName cannot be NULL") String companyRegionName,
			@NotNull(message = "CompanyRegionCode cannot be NULL") String companyRegionCode,
			@NotNull(message = "IsActive cannot be NULL") Boolean isActive) {
		super();
		this.companyAreaID = companyAreaID;
		this.companyAreaName = companyAreaName;
		this.companyAreaCode = companyAreaCode;
		this.companyAreaDescription = companyAreaDescription;
		this.companyID = companyID;
		this.companyName = companyName;
		this.companyCode = companyCode;
		this.companyRegionId = companyRegionId;
		this.companyRegionName = companyRegionName;
		this.companyRegionCode = companyRegionCode;
		this.isActive = isActive;
	}

	public Long getCompanyAreaID() {
		return companyAreaID;
	}

	public void setCompanyAreaID(Long companyAreaID) {
		this.companyAreaID = companyAreaID;
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

	public Long getCompanyRegionId() {
		return companyRegionId;
	}

	public void setCompanyRegionId(Long companyRegionId) {
		this.companyRegionId = companyRegionId;
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

	public Boolean getIsActive() {
		return isActive;
	}

	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}
}
