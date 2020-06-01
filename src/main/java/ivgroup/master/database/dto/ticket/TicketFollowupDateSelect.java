package ivgroup.master.database.dto.ticket;

import java.sql.Timestamp;

import javax.validation.constraints.NotEmpty;

import com.fasterxml.jackson.annotation.JsonFormat;

public class TicketFollowupDateSelect 
{
	@NotEmpty(message = "TicketFollowupDateId cannot be NULL")
	Long ticketFollowupDateId;
	@NotEmpty(message = "TicketId cannot be NULL")
	Long ticketId;
	@NotEmpty(message = "FollowupDate cannot be NULL")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	Timestamp followupDate;
	
	public TicketFollowupDateSelect()
	{
		
	}

	public TicketFollowupDateSelect(
			@NotEmpty(message = "TicketFollowupDateId cannot be NULL") Long ticketFollowupDateId,
			@NotEmpty(message = "TicketId cannot be NULL") Long ticketId,
			@NotEmpty(message = "FollowupDate cannot be NULL") Timestamp followupDate) {
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
