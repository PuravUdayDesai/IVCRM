package ivgroup.master.database.dto.scheduler;

import javax.validation.constraints.NotNull;

public class ScheduerCompanyExecutivePLUpdateInsert 
{
	@NotNull(message="CompanyExecutiveId cannot be NULL")
	private Long companyExecutiveId;
	@NotNull(message="CompanyExecutiveName cannot be NULL")
	private String companyExecutiveName;
	@NotNull(message="CurrentWorkProgress cannot be NULL")
	private Integer currentWorkProgress;
	@NotNull(message="ThresholdWorkProgress cannot be NULL")
	private Integer thresholdWorkProgress;
	@NotNull(message="TicketId cannot be NULL")
	private Long ticketId;
	
	public ScheduerCompanyExecutivePLUpdateInsert()
	{
		
	}

	public ScheduerCompanyExecutivePLUpdateInsert(
			@NotNull(message = "CompanyExecutiveId cannot be NULL") Long companyExecutiveId,
			@NotNull(message = "CompanyExecutiveName cannot be NULL") String companyExecutiveName,
			@NotNull(message = "CurrentWorkProgress cannot be NULL") Integer currentWorkProgress,
			@NotNull(message = "ThresholdWorkProgress cannot be NULL") Integer thresholdWorkProgress,
			@NotNull(message = "TicketId cannot be NULL") Long ticketId) {
		super();
		this.companyExecutiveId = companyExecutiveId;
		this.companyExecutiveName = companyExecutiveName;
		this.currentWorkProgress = currentWorkProgress;
		this.thresholdWorkProgress = thresholdWorkProgress;
		this.ticketId = ticketId;
	}

	public Long getCompanyExecutiveId() {
		return companyExecutiveId;
	}

	public void setCompanyExecutiveId(Long companyExecutiveId) {
		this.companyExecutiveId = companyExecutiveId;
	}

	public String getCompanyExecutiveName() {
		return companyExecutiveName;
	}

	public void setCompanyExecutiveName(String companyExecutiveName) {
		this.companyExecutiveName = companyExecutiveName;
	}

	public Integer getCurrentWorkProgress() {
		return currentWorkProgress;
	}

	public void setCurrentWorkProgress(Integer currentWorkProgress) {
		this.currentWorkProgress = currentWorkProgress;
	}

	public Integer getThresholdWorkProgress() {
		return thresholdWorkProgress;
	}

	public void setThresholdWorkProgress(Integer thresholdWorkProgress) {
		this.thresholdWorkProgress = thresholdWorkProgress;
	}

	public Long getTicketId() {
		return ticketId;
	}

	public void setTicketId(Long ticketId) {
		this.ticketId = ticketId;
	}

}
