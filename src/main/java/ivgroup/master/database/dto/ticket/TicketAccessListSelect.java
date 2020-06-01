package ivgroup.master.database.dto.ticket;

import java.sql.Timestamp;

import javax.validation.constraints.NotEmpty;

import com.fasterxml.jackson.annotation.JsonFormat;

public class TicketAccessListSelect 
{
	@NotEmpty(message = "TicketAccessListId cannot be NULL")
	Long ticketAccessListId;
	@NotEmpty(message = "TicketId cannot be NULL")
	Long ticketId;
	@NotEmpty(message = "CompanyExecutiveId cannot be NULL")
	Long companyExecutiveId;
	@NotEmpty(message = "CompanyExecutiveName cannot be NULL")
	String companyExecutiveName;
	@NotEmpty(message = "OwnerFlag cannot be NULL")
	Boolean ownerFlag;
	@NotEmpty(message = "AccessApplicationTime cannot be NULL")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	Timestamp accessApplicationTime;
	
	public TicketAccessListSelect()
	{
		
	}

	public TicketAccessListSelect(@NotEmpty(message = "TicketAccessListId cannot be NULL") Long ticketAccessListId,
			@NotEmpty(message = "TicketId cannot be NULL") Long ticketId,
			@NotEmpty(message = "CompanyExecutiveId cannot be NULL") Long companyExecutiveId,
			@NotEmpty(message = "CompanyExecutiveName cannot be NULL") String companyExecutiveName,
			@NotEmpty(message = "OwnerFlag cannot be NULL") Boolean ownerFlag,
			@NotEmpty(message = "AccessApplicationTime cannot be NULL") Timestamp accessApplicationTime) {
		super();
		this.ticketAccessListId = ticketAccessListId;
		this.ticketId = ticketId;
		this.companyExecutiveId = companyExecutiveId;
		this.companyExecutiveName = companyExecutiveName;
		this.ownerFlag = ownerFlag;
		this.accessApplicationTime = accessApplicationTime;
	}

	public Long getTicketAccessListId() {
		return ticketAccessListId;
	}

	public void setTicketAccessListId(Long ticketAccessListId) {
		this.ticketAccessListId = ticketAccessListId;
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

	public String getCompanyExecutiveName() {
		return companyExecutiveName;
	}

	public void setCompanyExecutiveName(String companyExecutiveName) {
		this.companyExecutiveName = companyExecutiveName;
	}

	public Boolean getOwnerFlag() {
		return ownerFlag;
	}

	public void setOwnerFlag(Boolean ownerFlag) {
		this.ownerFlag = ownerFlag;
	}

	public Timestamp getAccessApplicationTime() {
		return accessApplicationTime;
	}

	public void setAccessApplicationTime(Timestamp accessApplicationTime) {
		this.accessApplicationTime = accessApplicationTime;
	}

}
