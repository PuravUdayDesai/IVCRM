package ivgroup.master.database.dto.status;

import java.sql.Timestamp;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.PastOrPresent;

import com.fasterxml.jackson.annotation.JsonFormat;

public class StatusUpdate
{
	String statusName;
	String statusColorCode;
	Integer workProgress;
	Long companyId;
	@NotNull(message = "LastEditBy cannot be NULL")
	Long lastEditBy;
	@NotNull(message = "LastEditOn cannot be NULL")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	@PastOrPresent
	Timestamp lastEditOn;
	
	public StatusUpdate()
	{
		
	}

	public StatusUpdate(String statusName, String statusColorCode, Integer workProgress, Long companyId,
			@NotNull(message = "LastEditBy cannot be NULL") Long lastEditBy,
			@NotNull(message = "LastEditOn cannot be NULL") @PastOrPresent Timestamp lastEditOn) {
		super();
		this.statusName = statusName;
		this.statusColorCode = statusColorCode;
		this.workProgress = workProgress;
		this.companyId = companyId;
		this.lastEditBy = lastEditBy;
		this.lastEditOn = lastEditOn;
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

	public Long getLastEditBy() {
		return lastEditBy;
	}

	public void setLastEditBy(Long lastEditBy) {
		this.lastEditBy = lastEditBy;
	}

	public Timestamp getLastEditOn() {
		return lastEditOn;
	}

	public void setLastEditOn(Timestamp lastEditOn) {
		this.lastEditOn = lastEditOn;
	}
}
