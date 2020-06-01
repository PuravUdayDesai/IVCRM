package ivgroup.master.database.dto.ticket;

import java.sql.Timestamp;

import javax.validation.constraints.NotEmpty;

import com.fasterxml.jackson.annotation.JsonFormat;

public class TicketAccessListInsert 
{
	@NotEmpty(message = "TicketId cannot be NULL")
	Long ticketId;
	@NotEmpty(message = "CompanyExecutiveId cannot be NULL")
	Long companyExecutiveId;
	@NotEmpty(message = "AccessApplicationTime cannot be NULL")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	Timestamp accessApplicationTime;
	@NotEmpty(message = "LastEditBy cannot be NULL")
	Long lastEditBy;
	
	public TicketAccessListInsert()
	{
		
		
	}

	public TicketAccessListInsert(
			@NotEmpty(message = "TicketId cannot be NULL") Long ticketId,
			@NotEmpty(message = "CompanyExecutiveId cannot be NULL") Long companyExecutiveId,
			@NotEmpty(message = "AccessApplicationTime cannot be NULL") Timestamp accessApplicationTime,
			@NotEmpty(message = "LastEditBy cannot be NULL") Long lastEditBy) {
		super();
		this.ticketId = ticketId;
		this.companyExecutiveId = companyExecutiveId;
		this.accessApplicationTime = accessApplicationTime;
		this.lastEditBy = lastEditBy;
	}

	public Long getTicketId() {
		return ticketId;
	}

	public void setTicketId(Long ticketId) {
		this.ticketId = ticketId;
	}

	public Long getCompanyExecutiveId() {
		return companyExecutiveId;
	}

	public void setCompanyExecutiveId(Long companyExecutiveId) {
		this.companyExecutiveId = companyExecutiveId;
	}

	public Timestamp getAccessApplicationTime() {
		return accessApplicationTime;
	}

	public void setAccessApplicationTime(Timestamp accessApplicationTime) {
		this.accessApplicationTime = accessApplicationTime;
	}

	public Long getLastEditBy() {
		return lastEditBy;
	}

	public void setLastEditBy(Long lastEditBy) {
		this.lastEditBy = lastEditBy;
	}
	
}
