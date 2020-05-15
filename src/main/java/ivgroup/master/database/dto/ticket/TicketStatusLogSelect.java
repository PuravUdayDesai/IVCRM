package ivgroup.master.database.dto.ticket;

import java.sql.Timestamp;

import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonFormat;

public class TicketStatusLogSelect 
{
	@NotNull(message = "TicketStatusId cannot be NULL")
	Long ticketStatusId;
	@NotNull(message = "TicketId cannot be NULL")
	Long ticketId;
	@NotNull(message = "StatusId cannot be NULL")
	Long statusId;
	@NotNull(message = "StatusName cannot be NULL")
	String statusName;
	@NotNull(message = "workProgress cannot be NULL")
	Integer workProgress;
	@NotNull(message = "StatusColorCode cannot be NULL")
	String statusColorCode;
	@NotNull(message = "LastEditOn cannot be NULL")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	Timestamp lastEditOn;
	@NotNull(message = "LastEditBy cannot be NULL")
	Long lastEditBy;
	
	public TicketStatusLogSelect()
	{
		
	}

	public TicketStatusLogSelect(@NotNull(message = "TicketStatusId cannot be NULL") Long ticketStatusId,
			@NotNull(message = "TicketId cannot be NULL") Long ticketId,
			@NotNull(message = "StatusId cannot be NULL") Long statusId,
			@NotNull(message = "StatusName cannot be NULL") String statusName,
			@NotNull(message = "workProgress cannot be NULL") Integer workProgress,
			@NotNull(message = "StatusColorCode cannot be NULL") String statusColorCode,
			@NotNull(message = "LastEditOn cannot be NULL") Timestamp lastEditOn,
			@NotNull(message = "LastEditBy cannot be NULL") Long lastEditBy) {
		super();
		this.ticketStatusId = ticketStatusId;
		this.ticketId = ticketId;
		this.statusId = statusId;
		this.statusName = statusName;
		this.workProgress = workProgress;
		this.statusColorCode = statusColorCode;
		this.lastEditOn = lastEditOn;
		this.lastEditBy = lastEditBy;
	}

	public Long getTicketStatusId() {
		return ticketStatusId;
	}

	public void setTicketStatusId(Long ticketStatusId) {
		this.ticketStatusId = ticketStatusId;
	}

	public Long getTicketId() {
		return ticketId;
	}

	public void setTicketId(Long ticketId) {
		this.ticketId = ticketId;
	}

	public Long getStatusId() {
		return statusId;
	}

	public void setStatusId(Long statusId) {
		this.statusId = statusId;
	}

	public String getStatusName() {
		return statusName;
	}

	public void setStatusName(String statusName) {
		this.statusName = statusName;
	}

	public Integer getWorkProgress() {
		return workProgress;
	}

	public void setWorkProgress(Integer workProgress) {
		this.workProgress = workProgress;
	}

	public String getStatusColorCode() {
		return statusColorCode;
	}

	public void setStatusColorCode(String statusColorCode) {
		this.statusColorCode = statusColorCode;
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
