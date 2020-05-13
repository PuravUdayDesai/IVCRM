package ivgroup.master.database.dto.ticket;

import java.util.List;

public class TicketFilterSelect 
{
	List<Integer> priorityId;
	List<Long> statusId;
	List<Long> ticketType;
	List<Long> productId;
	List<Long> companyId;
	List<Long> enquiryId;
	
	public TicketFilterSelect() 
	{
		
	}

	public TicketFilterSelect(List<Integer> priorityId, List<Long> statusId, List<Long> ticketType,
			List<Long> productId, List<Long> companyId, List<Long> enquiryId) {
		super();
		this.priorityId = priorityId;
		this.statusId = statusId;
		this.ticketType = ticketType;
		this.productId = productId;
		this.companyId = companyId;
		this.enquiryId = enquiryId;
	}

	public List<Integer> getPriorityId() {
		return priorityId;
	}

	public void setPriorityId(List<Integer> priorityId) {
		this.priorityId = priorityId;
	}

	public List<Long> getStatusId() {
		return statusId;
	}

	public void setStatusId(List<Long> statusId) {
		this.statusId = statusId;
	}

	public List<Long> getTicketType() {
		return ticketType;
	}

	public void setTicketType(List<Long> ticketType) {
		this.ticketType = ticketType;
	}

	public List<Long> getProductId() {
		return productId;
	}

	public void setProductId(List<Long> productId) {
		this.productId = productId;
	}

	public List<Long> getCompanyId() {
		return companyId;
	}

	public void setCompanyId(List<Long> companyId) {
		this.companyId = companyId;
	}

	public List<Long> getEnquiryId() {
		return enquiryId;
	}

	public void setEnquiryId(List<Long> enquiryId) {
		this.enquiryId = enquiryId;
	}

}
