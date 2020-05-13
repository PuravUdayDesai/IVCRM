package ivgroup.master.database.dto.position;

import java.sql.Timestamp;

import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonFormat;

public class PositionUpdate 
{
	String positionName;
	Integer positionPriority;
	Long companyId;
	Integer company;
	Integer companyBranch;
	Integer companyExecutive;
	Integer client;
	Integer product;
	Integer location;
	Integer enquiry;
	Integer ticket;
	Integer position;
	Boolean isActive;
	@NotNull(message = "LastEditBy cannot be NULL")
	Long lastEditBy;
	@NotNull(message = "LastEditOn cannot be NULL")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	Timestamp lastEditOn;
	
	public PositionUpdate()
	{
		
	}

	public PositionUpdate(String positionName, Integer positionPriority, Long companyId,
			@NotNull(message = "LastEditBy cannot be NULL") Long lastEditBy,
			@NotNull(message = "LastEditOn cannot be NULL") Timestamp lastEditOn, Integer company,
			Integer companyBranch, Integer companyExecutive, Integer client, Integer product, Integer location,
			Integer enquiry, Integer ticket, Integer position,Boolean isActive) {
		super();
		this.positionName = positionName;
		this.positionPriority = positionPriority;
		this.companyId = companyId;
		this.lastEditBy = lastEditBy;
		this.lastEditOn = lastEditOn;
		this.company = company;
		this.companyBranch = companyBranch;
		this.companyExecutive = companyExecutive;
		this.client = client;
		this.product = product;
		this.location = location;
		this.enquiry = enquiry;
		this.ticket = ticket;
		this.position = position;
		this.isActive=isActive;
	}

	public String getPositionName() {
		return positionName;
	}

	public void setPositionName(String positionName) {
		this.positionName = positionName;
	}

	public Integer getPositionPriority() {
		return positionPriority;
	}

	public void setPositionPriority(Integer positionPriority) {
		this.positionPriority = positionPriority;
	}

	public Long getCompanyId() {
		return companyId;
	}

	public void setCompanyId(Long companyId) {
		this.companyId = companyId;
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

	public Integer getCompany() {
		return company;
	}

	public void setCompany(Integer company) {
		this.company = company;
	}

	public Integer getCompanyBranch() {
		return companyBranch;
	}

	public void setCompanyBranch(Integer companyBranch) {
		this.companyBranch = companyBranch;
	}

	public Integer getCompanyExecutive() {
		return companyExecutive;
	}

	public void setCompanyExecutive(Integer companyExecutive) {
		this.companyExecutive = companyExecutive;
	}

	public Integer getClient() {
		return client;
	}

	public void setClient(Integer client) {
		this.client = client;
	}

	public Integer getProduct() {
		return product;
	}

	public void setProduct(Integer product) {
		this.product = product;
	}

	public Integer getLocation() {
		return location;
	}

	public void setLocation(Integer location) {
		this.location = location;
	}

	public Integer getEnquiry() {
		return enquiry;
	}

	public void setEnquiry(Integer enquiry) {
		this.enquiry = enquiry;
	}

	public Integer getTicket() {
		return ticket;
	}

	public void setTicket(Integer ticket) {
		this.ticket = ticket;
	}

	public Integer getPosition() {
		return position;
	}

	public void setPosition(Integer position) {
		this.position = position;
	}

	public Boolean getIsActive() {
		return isActive;
	}

	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}
 
}
