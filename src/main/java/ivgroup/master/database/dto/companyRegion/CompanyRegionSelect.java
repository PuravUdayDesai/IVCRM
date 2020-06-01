package ivgroup.master.database.dto.companyRegion;

import javax.validation.constraints.NotEmpty;

public class CompanyRegionSelect {
	@NotEmpty(message = "CompanyRegionID cannot be NULL")
	Long companyRegionID;
	@NotEmpty(message = "CompanyRegionName cannot be NULL")
	String companyRegionName;
	@NotEmpty(message = "CompanyRegionCode cannot be NULL")
	String companyRegionCode;
	@NotEmpty(message = "CompanyRegionDescription cannot be NULL")
	String companyRegionDescription;
	@NotEmpty(message = "CompanyID cannot be NULL")
	Long companyID;
	@NotEmpty(message = "CompanyName cannot be NULL")
	String companyName;
	@NotEmpty(message = "CompanyCode cannot be NULL")
	String companyCode;
	@NotEmpty(message = "IsActive cannot be NULL")
	Boolean isActive;
	
	public CompanyRegionSelect() {
		
	}

	public CompanyRegionSelect(@NotEmpty(message = "CompanyRegionID cannot be NULL") Long companyRegionID,
			@NotEmpty(message = "CompanyRegionName cannot be NULL") String companyRegionName,
			@NotEmpty(message = "CompanyRegionCode cannot be NULL") String companyRegionCode,
			@NotEmpty(message = "CompanyRegionDescription cannot be NULL") String companyRegionDescription,
			@NotEmpty(message = "CompanyID cannot be NULL") Long companyID,
			@NotEmpty(message = "CompanyName cannot be NULL") String companyName,
			@NotEmpty(message = "CompanyCode cannot be NULL") String companyCode,
			@NotEmpty(message = "IsActive cannot be NULL") Boolean isActive) {
		super();
		this.companyRegionID = companyRegionID;
		this.companyRegionName = companyRegionName;
		this.companyRegionCode = companyRegionCode;
		this.companyRegionDescription = companyRegionDescription;
		this.companyID = companyID;
		this.companyName = companyName;
		this.companyCode = companyCode;
		this.isActive = isActive;
	}

	public Long getCompanyRegionID() {
		return companyRegionID;
	}

	public void setCompanyRegionID(Long companyRegionID) {
		this.companyRegionID = companyRegionID;
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

	public Boolean getIsActive() {
		return isActive;
	}

	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}
	
}
