package ivgroup.master.database.dto.ticket;

import java.sql.Timestamp;

import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonFormat;

public class TicketFollowupDateInsert 
{
	@NotNull(message = "TicketId cannot be NULL")
	Long ticketId;
	@NotNull(message = "FollowupDate cannot be NULL")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	Timestamp followupDate;
	@NotNull(message = "LastEditOn cannot be NULL")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	Timestamp lastEditOn;
	@NotNull(message = "LastEditBy cannot be NULL")
	Long lastEditBy;
	
	public TicketFollowupDateInsert()
	{
		
	}

	public TicketFollowupDateInsert(@NotNull(message = "TicketId cannot be NULL") Long ticketId,
			@NotNull(message = "FollowupDate cannot be NULL") Timestamp followupDate,
			@NotNull(message = "LastEditOn cannot be NULL") Timestamp lastEditOn,
			@NotNull(message = "LastEditBy cannot be NULL") Long lastEditBy) {
		super();
		this.ticketId = ticketId;
		this.followupDate = followupDate;
		this.lastEditOn = lastEditOn;
		this.lastEditBy = lastEditBy;
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
