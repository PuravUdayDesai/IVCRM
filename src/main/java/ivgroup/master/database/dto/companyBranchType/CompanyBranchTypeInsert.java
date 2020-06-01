package ivgroup.master.database.dto.companyBranchType;

import java.sql.Timestamp;

import javax.validation.constraints.NotEmpty;

import com.fasterxml.jackson.annotation.JsonFormat;

public class CompanyBranchTypeInsert 
{
	@NotEmpty(message = "CompanyBranchTypeName cannot be NULL")
	String companyBranchTypeName;
	@NotEmpty(message = "CompanyId cannot be NULL")
	Long companyId;
	@NotEmpty(message = "CompanyBranchPosition cannot be NULL")
	Integer companyBranchPosition;
	@NotEmpty(message = "CreatedBy cannot be NULL")
	Long createdBy;
	@NotEmpty(message = "CreatedOn cannot be NULL")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	Timestamp createdOn;
	
	public CompanyBranchTypeInsert()
	{
		
	}

	public CompanyBranchTypeInsert(
			@NotEmpty(message = "CompanyBranchTypeName cannot be NULL") String companyBranchTypeName,
			@NotEmpty(message = "CompanyId cannot be NULL") Long companyId,
			@NotEmpty(message = "CompanyBranchPosition cannot be NULL") Integer companyBranchPosition,
			@NotEmpty(message = "CreatedBy cannot be NULL") Long createdBy,
			@NotEmpty(message = "CreatedOn cannot be NULL") Timestamp createdOn) {
		super();
		this.companyBranchTypeName = companyBranchTypeName;
		this.companyId = companyId;
		this.companyBranchPosition = companyBranchPosition;
		this.createdBy = createdBy;
		this.createdOn = createdOn;
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
}
