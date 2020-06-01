package ivgroup.master.database.dto.ticket;

import java.sql.Timestamp;

import javax.validation.constraints.NotEmpty;

import com.fasterxml.jackson.annotation.JsonFormat;

public class TicketInsert 
{
	@NotEmpty(message = "EnquiryId cannot be NULL")
	Long enquiryId;
	@NotEmpty(message = "EnquiryRemarks cannot be NULL")
	String enquiryRemarks;
	@NotEmpty(message = "TicketRemarks cannot be NULL")
	String ticketRemarks;
	@NotEmpty(message = "StatusId cannot be NULL")
	Long statusId;
	@NotEmpty(message = "StartDateAndTime cannot be NULL")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	Timestamp startDateAndTime;
	@NotEmpty(message = "DeadlineDateAndTime cannot be NULL")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	Timestamp deadlineDateAndTime;
	@NotEmpty(message = "ProductId cannot be NULL")
	Long productId;
	@NotEmpty(message = "TicketType cannot be NULL")
	Long ticketType;
	@NotEmpty(message = "TicketPriority cannot be NULL")
	Integer ticketPriority;
	@NotEmpty(message = "CompanyId cannot be NULL")
	Long companyId;
	@NotEmpty(message = "CreatedOn cannot be NULL")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	Timestamp createdOn;
	@NotEmpty(message = "CreatedBy cannot be NULL")
	Long createdBy;
	
	public TicketInsert()
	{
		
	}

	public TicketInsert(
			@NotEmpty(message = "EnquiryId cannot be NULL") Long enquiryId,
			@NotEmpty(message = "EnquiryRemarks cannot be NULL") String enquiryRemarks,
			@NotEmpty(message = "TicketRemarks cannot be NULL") String ticketRemarks,
			@NotEmpty(message = "StatusId cannot be NULL") Long statusId,
			@NotEmpty(message = "StartDateAndTime cannot be NULL") Timestamp startDateAndTime,
			@NotEmpty(message = "DeadlineDateAndTime cannot be NULL") Timestamp deadlineDateAndTime,
			@NotEmpty(message = "ProductId cannot be NULL") Long productId,
			@NotEmpty(message = "TicketType cannot be NULL") Long ticketType,
			@NotEmpty(message = "TicketPriority cannot be NULL") Integer ticketPriority,
			@NotEmpty(message = "CompanyId cannot be NULL") Long companyId,
			@NotEmpty(message = "CreatedOn cannot be NULL") Timestamp createdOn,
			@NotEmpty(message = "CreatedBy cannot be NULL") Long createdBy) {
		super();
		this.enquiryId = enquiryId;
		this.enquiryRemarks = enquiryRemarks;
		this.ticketRemarks = ticketRemarks;
		this.statusId = statusId;
		this.startDateAndTime = startDateAndTime;
		this.deadlineDateAndTime = deadlineDateAndTime;
		this.productId = productId;
		this.ticketType = ticketType;
		this.ticketPriority = ticketPriority;
		this.companyId = companyId;
		this.createdOn = createdOn;
		this.createdBy = createdBy;
	}

	public Long getEnquiryId() {
		return enquiryId;
	}

	public void setEnquiryId(Long enquiryId) {
		this.enquiryId = enquiryId;
	}

	public String getEnquiryRemarks() {
		return enquiryRemarks;
	}

	public void setEnquiryRemarks(String enquiryRemarks) {
		this.enquiryRemarks = enquiryRemarks;
	}

	public String getTicketRemarks() {
		return ticketRemarks;
	}

	public void setTicketRemarks(String ticketRemarks) {
		this.ticketRemarks = ticketRemarks;
	}

	public Long getStatusId() {
		return statusId;
	}

	public void setStatusId(Long statusId) {
		this.statusId = statusId;
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

	public Long getProductId() {
		return productId;
	}

	public void setProductId(Long productId) {
		this.productId = productId;
	}

	public Long getTicketType() {
		return ticketType;
	}

	public void setTicketType(Long ticketType) {
		this.ticketType = ticketType;
	}

	public Integer getTicketPriority() {
		return ticketPriority;
	}

	public void setTicketPriority(Integer ticketPriority) {
		this.ticketPriority = ticketPriority;
	}

	public Long getCompanyId() {
		return companyId;
	}

	public void setCompanyId(Long companyId) {
		this.companyId = companyId;
	}

	public Timestamp getCreatedOn() {
		return createdOn;
	}

	public void setCreatedOn(Timestamp createdOn) {
		this.createdOn = createdOn;
	}

	public Long getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(Long createdBy) {
		this.createdBy = createdBy;
	}
}
