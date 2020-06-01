package ivgroup.master.database.dto.status;

import java.sql.Timestamp;

import javax.validation.constraints.NotEmpty;

import com.fasterxml.jackson.annotation.JsonFormat;

public class StatusInsert 
{
	@NotEmpty(message = "StatusName cannot be NULL")
	String statusName;
	@NotEmpty(message = "StatusColorCode cannot be NULL")
	String statusColorCode;
	@NotEmpty(message = "WorkProgress cannot be NULL")
	Integer workProgress;
	@NotEmpty(message = "CompanyId cannot be NULL")
	Long companyId;
	@NotEmpty(message = "CreatedBy cannot be NULL")
	Long createdBy;
	@NotEmpty(message = "CreatedOn cannot be NULL")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	Timestamp createdOn;
	
	public StatusInsert()
	{
		
	}

	public StatusInsert(@NotEmpty(message = "StatusName cannot be NULL") String statusName,
			@NotEmpty(message = "StatusColorCode cannot be NULL") String statusColorCode,
			@NotEmpty(message = "WorkProgress cannot be NULL") Integer workProgress,
			@NotEmpty(message = "CompanyId cannot be NULL") Long companyId,
			@NotEmpty(message = "CreatedBy cannot be NULL") Long createdBy,
			@NotEmpty(message = "CreatedOn cannot be NULL") Timestamp createdOn) {
		super();
		this.statusName = statusName;
		this.statusColorCode = statusColorCode;
		this.workProgress = workProgress;
		this.companyId = companyId;
		this.createdBy = createdBy;
		this.createdOn = createdOn;
	}

	public String getStatusName() {
		return statusName;
	}

	public void setStatusName(String statusName) {
		this.statusName = statusName;
	}

	public String getStatusColorCode() {
		return statusColorCode;
	}

	public void setStatusColorCode(String statusColorCode) {
		this.statusColorCode = statusColorCode;
	}

	public Integer getWorkProgress() {
		return workProgress;
	}

	public void setWorkProgress(Integer workProgress) {
		this.workProgress = workProgress;
	}

	public Long getCompanyId() {
		return companyId;
	}

	public void setCompanyId(Long companyId) {
		this.companyId = companyId;
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
