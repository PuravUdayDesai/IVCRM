package ivgroup.master.database.dto.ticket;

import java.sql.Timestamp;
import java.util.List;

import javax.validation.constraints.NotEmpty;

import com.fasterxml.jackson.annotation.JsonFormat;

public class TicketDetailsSelect 
{
	@NotEmpty(message = "TicketId cannot be NULL")
	Long ticketId;
	@NotEmpty(message = "EnquiryId cannot be NULL")
	Long enquiryId;
	@NotEmpty(message = "TicketAccessId cannot be NULL")
	Long ticketAccessId;
	@NotEmpty(message = "CompanyExecutiveId cannot be NULL")
	Long companyExecutiveId;
	@NotEmpty(message = "CompanyExecutiveName cannot be NULL")
	String companyExecutiveName;
	@NotEmpty(message = "EnquiryRemarks cannot be NULL")
	String enquiryRemarks;
	@NotEmpty(message = "TicketRemarks cannot be NULL")
	String ticketRemarks;
	@NotEmpty(message = "StartDateAndTime cannot be NULL")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	Timestamp startDateAndTime;
	@NotEmpty(message = "DeadlineDateAndTime cannot be NULL")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	Timestamp deadlineDateAndTime;
	@NotEmpty(message = "ProductId cannot be NULL")
	Long productId;
	@NotEmpty(message = "ProductName cannot be NULL")
	String productName;
	@NotEmpty(message = "TicketType cannot be NULL")
	Long ticketType;
	@NotEmpty(message = "TicketTypeName cannot be NULL")
	String ticketTypeName;
	@NotEmpty(message = "TicketPriority cannot be NULL")
	Integer ticketPriority;
	@NotEmpty(message = "TicketPriorityName cannot be NULL")
	String ticketPriorityName;
	@NotEmpty(message = "CompanyId cannot be NULL")
	Long companyId;
	@NotEmpty(message = "CompanyName cannot be NULL")
	String companyName;
	@NotEmpty(message = "StatusId cannot be NULL")
	Long statusId;
	@NotEmpty(message = "StatusName cannot be NULL")
	String statusName;
	@NotEmpty(message = "FollowupDate cannot be NULL")
	List<TicketFollowupDateSelect> followupDate;
	@NotEmpty(message = "CreatedBy cannot be NULL")
	Long createdBy;
	@NotEmpty(message = "CreatedOn cannot be NULL")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	Timestamp createdOn;
	@NotEmpty(message = "LastEditBy cannot be NULL")
	Long lastEditBy;
	@NotEmpty(message = "LastEditOn cannot be NULL")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	Timestamp lastEditOn;
	
	public TicketDetailsSelect()
	{
		
	}

	public TicketDetailsSelect(
			@NotEmpty(message = "TicketId cannot be NULL") Long ticketId,
			@NotEmpty(message = "EnquiryId cannot be NULL") Long enquiryId,
			@NotEmpty(message = "TicketAccessId cannot be NULL") Long ticketAccessId,
			@NotEmpty(message = "CompanyExecutiveId cannot be NULL") Long companyExecutiveId,
			@NotEmpty(message = "CompanyExecutiveName cannot be NULL") String companyExecutiveName,
			@NotEmpty(message = "EnquiryRemarks cannot be NULL") String enquiryRemarks,
			@NotEmpty(message = "TicketRemarks cannot be NULL") String ticketRemarks,
			@NotEmpty(message = "StartDateAndTime cannot be NULL") Timestamp startDateAndTime,
			@NotEmpty(message = "DeadlineDateAndTime cannot be NULL") Timestamp deadlineDateAndTime,
			@NotEmpty(message = "ProductId cannot be NULL") Long productId,
			@NotEmpty(message = "ProductName cannot be NULL") String productName,
			@NotEmpty(message = "TicketType cannot be NULL") Long ticketType,
			@NotEmpty(message = "TicketTypeName cannot be NULL") String ticketTypeName,
			@NotEmpty(message = "TicketPriority cannot be NULL") Integer ticketPriority,
			@NotEmpty(message = "TicketPriorityName cannot be NULL") String ticketPriorityName,
			@NotEmpty(message = "CompanyId cannot be NULL") Long companyId,
			@NotEmpty(message = "CompanyName cannot be NULL") String companyName,
			@NotEmpty(message = "StatusId cannot be NULL") Long statusId,
			@NotEmpty(message = "StatusName cannot be NULL") String statusName,
			@NotEmpty(message = "FollowupDate cannot be NULL") List<TicketFollowupDateSelect> followupDate,
			@NotEmpty(message = "CreatedBy cannot be NULL") Long createdBy,
			@NotEmpty(message = "CreatedOn cannot be NULL") Timestamp createdOn,
			@NotEmpty(message = "LastEditBy cannot be NULL") Long lastEditBy,
			@NotEmpty(message = "LastEditOn cannot be NULL") Timestamp lastEditOn) {
		super();
		this.ticketId = ticketId;
		this.enquiryId = enquiryId;
		this.ticketAccessId = ticketAccessId;
		this.companyExecutiveId = companyExecutiveId;
		this.companyExecutiveName = companyExecutiveName;
		this.enquiryRemarks = enquiryRemarks;
		this.ticketRemarks = ticketRemarks;
		this.startDateAndTime = startDateAndTime;
		this.deadlineDateAndTime = deadlineDateAndTime;
		this.productId = productId;
		this.productName = productName;
		this.ticketType = ticketType;
		this.ticketTypeName = ticketTypeName;
		this.ticketPriority = ticketPriority;
		this.ticketPriorityName = ticketPriorityName;
		this.companyId = companyId;
		this.companyName = companyName;
		this.statusId = statusId;
		this.statusName = statusName;
		this.followupDate = followupDate;
		this.createdBy = createdBy;
		this.createdOn = createdOn;
		this.lastEditBy = lastEditBy;
		this.lastEditOn = lastEditOn;
	}

	public Long getTicketId() {
		return ticketId;
	}

	public void setTicketId(Long ticketId) {
		this.ticketId = ticketId;
	}

	public Long getEnquiryId() {
		return enquiryId;
	}

	public void setEnquiryId(Long enquiryId) {
		this.enquiryId = enquiryId;
	}

	public Long getTicketAccessId() {
		return ticketAccessId;
	}

	public void setTicketAccessId(Long ticketAccessId) {
		this.ticketAccessId = ticketAccessId;
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

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public Long getTicketType() {
		return ticketType;
	}

	public void setTicketType(Long ticketType) {
		this.ticketType = ticketType;
	}

	public String getTicketTypeName() {
		return ticketTypeName;
	}

	public void setTicketTypeName(String ticketTypeName) {
		this.ticketTypeName = ticketTypeName;
	}

	public Integer getTicketPriority() {
		return ticketPriority;
	}

	public void setTicketPriority(Integer ticketPriority) {
		this.ticketPriority = ticketPriority;
	}

	public String getTicketPriorityName() {
		return ticketPriorityName;
	}

	public void setTicketPriorityName(String ticketPriorityName) {
		this.ticketPriorityName = ticketPriorityName;
	}

	public Long getCompanyId() {
		return companyId;
	}

	public void setCompanyId(Long companyId) {
		this.companyId = companyId;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public Long getStatusId() {
		return statusId;
	}

	public void setStatusId(Long statusId) {
		this.statusId = statusId;
	}

	public String getStatusName() {
		return statusName;
	}

	public void setStatusName(String statusName) {
		this.statusName = statusName;
	}

	public List<TicketFollowupDateSelect> getFollowupDate() {
		return followupDate;
	}

	public void setFollowupDate(List<TicketFollowupDateSelect> followupDate) {
		this.followupDate = followupDate;
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

	public Long getLastEditBy() {
		return lastEditBy;
	}

	public void setLastEditBy(Long lastEditBy) {
		this.lastEditBy = lastEditBy;
	}

	public Timestamp getLastEditOn() {
		return lastEditOn;
	}

	public void setLastEditOn(Timestamp lastEditOn) {
		this.lastEditOn = lastEditOn;
	}

}
