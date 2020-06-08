package ivgroup.master.database.dto.ticket;

import java.sql.Timestamp;

import javax.validation.constraints.FutureOrPresent;
import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonFormat;

public class TicketStatusInsert 
{
	@NotNull(message = "TicketId cannot be NULL")
	Long ticketId;
	@NotNull(message = "StatusId cannot be NULL")
	Long statusId;
	@NotNull(message = "CreatedBy cannot be NULL")
	Long createdBy;
	@NotNull(message = "CreatedOn cannot be NULL")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	@FutureOrPresent
	Timestamp createdOn;

	public TicketStatusInsert()
	{
		
	}

	public TicketStatusInsert(@NotNull(message = "TicketId cannot be NULL") Long ticketId,
			@NotNull(message = "StatusId cannot be NULL") Long statusId,
			@NotNull(message = "CreatedBy cannot be NULL") Long createdBy,
			@FutureOrPresent @NotNull(message = "CreatedOn cannot be NULL") Timestamp createdOn) {
		super();
		this.ticketId = ticketId;
		this.statusId = statusId;
		this.createdBy = createdBy;
		this.createdOn = createdOn;
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
