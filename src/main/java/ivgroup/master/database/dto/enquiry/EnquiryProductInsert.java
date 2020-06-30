package ivgroup.master.database.dto.enquiry;

import java.sql.Timestamp;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.PastOrPresent;

import com.fasterxml.jackson.annotation.JsonFormat;

public class EnquiryProductInsert
{
	@NotNull(message = "EnquiryId cannot be NULL")
	Long enquiryId;
	@NotNull(message = "ProductId cannot be NULL")
	Long productId;
	@NotNull(message = "StatusId cannot be NULL")
	Long statusId;
	@NotNull(message = "TicketRemarks cannot be NULL")
	String ticketRemarks;
	@NotNull(message = "PriorityId cannot be NULL")
	Integer priorityId;
	@NotNull(message = "CreatedBy cannot be NULL")
	Long createdBy;
	@NotNull(message = "CreatedOn cannot be NULL")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	@PastOrPresent
	Timestamp createdOn;
	
	public EnquiryProductInsert()
	{
		
	}

	public EnquiryProductInsert(@NotNull(message = "EnquiryId cannot be NULL") Long enquiryId,
			@NotNull(message = "ProductId cannot be NULL") Long productId,
			@NotNull(message = "StatusId cannot be NULL") Long statusId,
			@NotNull(message = "TicketRemarks cannot be NULL") String ticketRemarks,
			@NotNull(message = "PriorityId cannot be NULL") Integer priorityId,
			@NotNull(message = "CreatedBy cannot be NULL") Long createdBy,
			@NotNull(message = "CreatedOn cannot be NULL") @PastOrPresent Timestamp createdOn) {
		super();
		this.enquiryId = enquiryId;
		this.productId = productId;
		this.statusId = statusId;
		this.ticketRemarks = ticketRemarks;
		this.priorityId = priorityId;
		this.createdBy = createdBy;
		this.createdOn = createdOn;
	}

	public Long getEnquiryId() {
		return enquiryId;
	}

	public void setEnquiryId(Long enquiryId) {
		this.enquiryId = enquiryId;
	}

	public Long getProductId() {
		return productId;
	}

	public void setProductId(Long productId) {
		this.productId = productId;
	}

	public Long getStatusId() {
		return statusId;
	}

	public void setStatusId(Long statusId) {
		this.statusId = statusId;
	}

	public String getTicketRemarks() {
		return ticketRemarks;
	}

	public void setTicketRemarks(String ticketRemarks) {
		this.ticketRemarks = ticketRemarks;
	}

	public Integer getPriorityId() {
		return priorityId;
	}

	public void setPriorityId(Integer priorityId) {
		this.priorityId = priorityId;
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
