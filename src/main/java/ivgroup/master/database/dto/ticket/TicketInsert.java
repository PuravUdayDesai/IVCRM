package ivgroup.master.database.dto.ticket;

import java.sql.Timestamp;

import javax.validation.constraints.FutureOrPresent;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.PastOrPresent;

import com.fasterxml.jackson.annotation.JsonFormat;

public class TicketInsert 
{
	@NotNull(message = "EnquiryId cannot be NULL")
	Long enquiryId;
	@NotNull(message = "EnquiryRemarks cannot be NULL")
	String enquiryRemarks;
	@NotNull(message = "TicketRemarks cannot be NULL")
	String ticketRemarks;
	@NotNull(message = "StatusId cannot be NULL")
	Long statusId;
	@NotNull(message = "StartDateAndTime cannot be NULL")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	@PastOrPresent
	Timestamp startDateAndTime;
	@NotNull(message = "DeadlineDateAndTime cannot be NULL")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	@FutureOrPresent
	Timestamp deadlineDateAndTime;
	@NotNull(message = "ProductId cannot be NULL")
	Long productId;
	@NotNull(message = "TicketType cannot be NULL")
	Long ticketType;
	@NotNull(message = "TicketPriority cannot be NULL")
	Integer ticketPriority;
	@NotNull(message = "CompanyId cannot be NULL")
	Long companyId;
	@NotNull(message = "CreatedOn cannot be NULL")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	@PastOrPresent
	Timestamp createdOn;
	@NotNull(message = "CreatedBy cannot be NULL")
	Long createdBy;
	
	public TicketInsert()
	{
		
	}

	public TicketInsert(
			@NotNull(message = "EnquiryId cannot be NULL") Long enquiryId,
			@NotNull(message = "EnquiryRemarks cannot be NULL") String enquiryRemarks,
			@NotNull(message = "TicketRemarks cannot be NULL") String ticketRemarks,
			@NotNull(message = "StatusId cannot be NULL") Long statusId,
			@NotNull(message = "StartDateAndTime cannot be NULL") @PastOrPresent Timestamp startDateAndTime,
			@NotNull(message = "DeadlineDateAndTime cannot be NULL") @FutureOrPresent Timestamp deadlineDateAndTime,
			@NotNull(message = "ProductId cannot be NULL") Long productId,
			@NotNull(message = "TicketType cannot be NULL") Long ticketType,
			@NotNull(message = "TicketPriority cannot be NULL") Integer ticketPriority,
			@NotNull(message = "CompanyId cannot be NULL") Long companyId,
			@NotNull(message = "CreatedOn cannot be NULL") @PastOrPresent Timestamp createdOn,
			@NotNull(message = "CreatedBy cannot be NULL") Long createdBy) {
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
