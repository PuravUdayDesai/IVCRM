package ivgroup.master.database.dto.enquiry;

import java.sql.Timestamp;

import javax.validation.constraints.NotEmpty;

import com.fasterxml.jackson.annotation.JsonFormat;

public class EnquiryProductInsert
{
	@NotEmpty(message = "EnquiryId cannot be NULL")
	Long enquiryId;
	@NotEmpty(message = "ProductId cannot be NULL")
	Long productId;
	@NotEmpty(message = "StatusId cannot be NULL")
	Long statusId;
	@NotEmpty(message = "TicketRemarks cannot be NULL")
	String ticketRemarks;
	@NotEmpty(message = "PriorityId cannot be NULL")
	Integer priorityId;
	@NotEmpty(message = "CreatedBy cannot be NULL")
	Long createdBy;
	@NotEmpty(message = "CreatedOn cannot be NULL")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	Timestamp createdOn;
	
	public EnquiryProductInsert()
	{
		
	}

	public EnquiryProductInsert(@NotEmpty(message = "EnquiryId cannot be NULL") Long enquiryId,
			@NotEmpty(message = "ProductId cannot be NULL") Long productId,
			@NotEmpty(message = "StatusId cannot be NULL") Long statusId,
			@NotEmpty(message = "TicketRemarks cannot be NULL") String ticketRemarks,
			@NotEmpty(message = "PriorityId cannot be NULL") Integer priorityId,
			@NotEmpty(message = "CreatedBy cannot be NULL") Long createdBy,
			@NotEmpty(message = "CreatedOn cannot be NULL") Timestamp createdOn) {
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
