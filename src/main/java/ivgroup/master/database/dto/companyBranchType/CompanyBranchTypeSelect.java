package ivgroup.master.database.dto.companyBranchType;

import java.sql.Timestamp;

import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonFormat;

public class CompanyBranchTypeSelect 
{
	@NotNull(message = "CompanyBranchTypeId cannot be NULL")
	Long companyBranchTypeId;
	@NotNull(message = "CompanyBranchTypeName cannot be NULL")
	String companyBranchTypeName;
	@NotNull(message = "CompanyId cannot be NULL")
	Long companyId;
	@NotNull(message = "CompanyName cannot be NULL")
	String companyName;
	@NotNull(message = "CompanyBranchPosition cannot be NULL")
	Integer companyBranchPosition;
	@NotNull(message = "CreatedBy cannot be NULL")
	Long createdBy;
	@NotNull(message = "CreatedOn cannot be NULL")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	Timestamp createdOn;
	@NotNull(message = "LastEditOn cannot be NULL")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	Timestamp lastEditOn;
	@NotNull(message = "LastEditBy cannot be NULL")
	Long lastEditBy;
	
	public CompanyBranchTypeSelect()
	{
		
	}

	public CompanyBranchTypeSelect(
			@NotNull(message = "CompanyBranchTypeId cannot be NULL") Long companyBranchTypeId,
			@NotNull(message = "CompanyBranchTypeName cannot be NULL") String companyBranchTypeName,
			@NotNull(message = "CompanyId cannot be NULL") Long companyId,
			@NotNull(message = "CompanyName cannot be NULL") String companyName,
			@NotNull(message = "CompanyBranchPosition cannot be NULL") Integer companyBranchPosition,
			@NotNull(message = "CreatedBy cannot be NULL") Long createdBy,
			@NotNull(message = "CreatedOn cannot be NULL") Timestamp createdOn,
			@NotNull(message = "LastEditOn cannot be NULL") Timestamp lastEditOn,
			@NotNull(message = "LastEditBy cannot be NULL") Long lastEditBy) {
		super();
		this.companyBranchTypeId = companyBranchTypeId;
		this.companyBranchTypeName = companyBranchTypeName;
		this.companyId = companyId;
		this.companyName = companyName;
		this.companyBranchPosition = companyBranchPosition;
		this.createdBy = createdBy;
		this.createdOn = createdOn;
		this.lastEditOn = lastEditOn;
		this.lastEditBy = lastEditBy;
	}

	public Long getCompanyBranchTypeId() {
		return companyBranchTypeId;
	}

	public void setCompanyBranchTypeId(Long companyBranchTypeId) {
		this.companyBranchTypeId = companyBranchTypeId;
	}

	public String getCompanyBranchTypeName() {
		return companyBranchTypeName;
	}

	public void setCompanyBranchTypeName(String companyBranchTypeName) {
		this.companyBranchTypeName = companyBranchTypeName;
	}

	public Long getCompanyId() {
		return companyId;
	}

	public void setCompanyId(Long companyId) {
		this.companyId = companyId;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public Integer getCompanyBranchPosition() {
		return companyBranchPosition;
	}

	public void setCompanyBranchPosition(Integer companyBranchPosition) {
		this.companyBranchPosition = companyBranchPosition;
	}

	public Long getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(Long createdBy) {
		this.createdBy = createdBy;
	}

	public Timestamp getCreatedOn() {
		return createdOn;
	}

	public void setCreatedOn(Timestamp createdOn) {
		this.createdOn = createdOn;
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

}
