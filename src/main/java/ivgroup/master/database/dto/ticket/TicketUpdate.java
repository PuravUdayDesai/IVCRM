package ivgroup.master.database.dto.ticket;

import java.sql.Timestamp;

import javax.validation.constraints.FutureOrPresent;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.PastOrPresent;

import com.fasterxml.jackson.annotation.JsonFormat;

public class TicketUpdate 
{
	String ticketRemarks;
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	Timestamp startDateAndTime;
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	@FutureOrPresent 
	Timestamp deadlineDateAndTime;
	Integer ticketPriority;
	@NotNull(message = "LastEditOn cannot be NSULL")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	@PastOrPresent 
	Timestamp lastEditOn;
	@NotNull(message = "LastEditBy cannot be NULL")
	Long lastEditBy;
	
	public TicketUpdate()
	{
		
	}

	public TicketUpdate(
			String ticketRemarks, 
			@PastOrPresent Timestamp startDateAndTime, 
			@FutureOrPresent Timestamp deadlineDateAndTime,
			Integer ticketPriority, 
			@NotNull(message = "LastEditOn cannot be NULL") Timestamp lastEditOn,
			@NotNull(message = "LastEditBy cannot be NULL") Long lastEditBy) {
		super();
		this.ticketRemarks = ticketRemarks;
		this.startDateAndTime = startDateAndTime;
		this.deadlineDateAndTime = deadlineDateAndTime;
		this.ticketPriority = ticketPriority;
		this.lastEditOn = lastEditOn;
		this.lastEditBy = lastEditBy;
	}

	public String getTicketRemarks() {
		return ticketRemarks;
	}

	public void setTicketRemarks(String ticketRemarks) {
		this.ticketRemarks = ticketRemarks;
	}

	public Timestamp getStartDateAndTime() {
		return startDateAndTime;
	}

	public void setStartDateAndTime(Timestamp startDateAndTime) {
		this.startDateAndTime = startDateAndTime;
	}

	public Timestamp getDeadlineDateAndTime() {
		return deadlineDateAndTime;
	}

	public void setDeadlineDateAndTime(Timestamp deadlineDateAndTime) {
		this.deadlineDateAndTime = deadlineDateAndTime;
	}

	public Integer getTicketPriority() {
		return ticketPriority;
	}

	public void setTicketPriority(Integer ticketPriority) {
		this.ticketPriority = ticketPriority;
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
