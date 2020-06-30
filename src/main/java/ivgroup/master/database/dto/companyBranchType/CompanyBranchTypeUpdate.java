package ivgroup.master.database.dto.companyBranchType;

import java.sql.Timestamp;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.PastOrPresent;

import com.fasterxml.jackson.annotation.JsonFormat;

public class CompanyBranchTypeUpdate
{
	
	String companyBranchTypeName;
	Long companyId;
	Integer companyBranchPosition;
	@NotNull(message = "LastEditOn cannot be NULL")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	@PastOrPresent
	Timestamp lastEditOn;
	@NotNull(message = "LastEditBy cannot be NULL")
	Long lastEditBy;
	
	public CompanyBranchTypeUpdate()
	{
		
	}

	public CompanyBranchTypeUpdate(String companyBranchTypeName, Long companyId, Integer companyBranchPosition,
			@NotNull(message = "LastEditOn cannot be NULL") @PastOrPresent Timestamp lastEditOn,
			@NotNull(message = "LastEditBy cannot be NULL") Long lastEditBy) {
		super();
		this.companyBranchTypeName = companyBranchTypeName;
		this.companyId = companyId;
		this.companyBranchPosition = companyBranchPosition;
		this.lastEditOn = lastEditOn;
		this.lastEditBy = lastEditBy;
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
