package ivgroup.master.database.dto.ticket;

import java.sql.Timestamp;

import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonFormat;

public class TicketFollowupDateSelect 
{
	@NotNull(message = "TicketFollowupDateId cannot be NULL")
	private Long ticketFollowupDateId;
	@NotNull(message = "TicketId cannot be NULL")
	private Long ticketId;
	@NotNull(message = "FollowupDate cannot be NULL")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	private Timestamp followupDate;
	
	public TicketFollowupDateSelect()
	{
		
	}

	public TicketFollowupDateSelect(
			@NotNull(message = "TicketFollowupDateId cannot be NULL") Long ticketFollowupDateId,
			@NotNull(message = "TicketId cannot be NULL") Long ticketId,
			@NotNull(message = "FollowupDate cannot be NULL") Timestamp followupDate) {
		super();
		this.ticketFollowupDateId = ticketFollowupDateId;
		this.ticketId = ticketId;
		this.followupDate = followupDate;
	}

	public Long getTicketFollowupDateId() {
		return ticketFollowupDateId;
	}

	public void setTicketFollowupDateId(Long ticketFollowupDateId) {
		this.ticketFollowupDateId = ticketFollowupDateId;
	}

	public Long getTicketId() {
		return ticketId;
	}

	public void setTicketId(Long ticketId) {
		this.ticketId = ticketId;
	}

	public Timestamp getFollowupDate() {
		return followupDate;
	}

	public void setFollowupDate(Timestamp followupDate) {
		this.followupDate = followupDate;
	}

}
