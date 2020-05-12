package ivgroup.master.database.dto.position;

import java.sql.Timestamp;

import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonFormat;

public class PositionSelect 
{

	@NotNull(message = "PositionId cannot be NULL")
	Long positionId;
	@NotNull(message = "PositionName cannot be NULL")
	String positionName;
	@NotNull(message = "PositionPriority cannot be NULL")
	Integer positionPriority;
	@NotNull(message = "CompanyId cannot be NULL")
	Long companyId;
	@NotNull(message = "CompanyName cannot be NULL")
	String companyName;
	@NotNull(message = "CreatedBy cannot be NULL")
	Long createdBy;
	@NotNull(message = "CreatedOn cannot be NULL")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	Timestamp createdOn;
	@NotNull(message = "LastEditBy cannot be NULL")
	Long lastEditBy;
	@NotNull(message = "LastEditOn cannot be NULL")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	Timestamp lastEditOn;
	@NotNull(message = "IsActive cannot be NULL")
	Boolean isActive;
	@NotNull(message = "Company cannot be NULL")
	Integer company;
	@NotNull(message = "CompanyBranch cannot be NULL")
	Integer companyBranch;
	@NotNull(message = "CompanyExecutive cannot be NULL")
	Integer companyExecutive;
	@NotNull(message = "Client cannot be NULL")
	Integer client;
	@NotNull(message = "Product cannot be NULL")
	Integer product;
	@NotNull(message = "Location cannot be NULL")
	Integer location;
	@NotNull(message = "Enquiry cannot be NULL")
	Integer enquiry;
	@NotNull(message = "Ticket cannot be NULL")
	Integer ticket;
	@NotNull(message = "Position cannot be NULL")
	Integer position;
	
	public PositionSelect()
	{
		
	}

	public PositionSelect(
			@NotNull(message = "PositionId cannot be NULL") Long positionId,
			@NotNull(message = "PositionName cannot be NULL") String positionName,
			@NotNull(message = "PositionPriority cannot be NULL") Integer positionPriority,
			@NotNull(message = "CompanyId cannot be NULL") Long companyId,
			@NotNull(message = "CompanyName cannot be NULL") String companyName,
			@NotNull(message = "CreatedBy cannot be NULL") Long createdBy,
			@NotNull(message = "CreatedOn cannot be NULL") Timestamp createdOn,
			@NotNull(message = "LastEditBy cannot be NULL") Long lastEditBy,
			@NotNull(message = "LastEditOn cannot be NULL") Timestamp lastEditOn,
			@NotNull(message = "IsActive cannot be NULL") Boolean isActive,
			@NotNull(message = "Company cannot be NULL") Integer company,
			@NotNull(message = "CompanyBranch cannot be NULL") Integer companyBranch,
			@NotNull(message = "CompanyExecutive cannot be NULL") Integer companyExecutive,
			@NotNull(message = "Client cannot be NULL") Integer client,
			@NotNull(message = "Product cannot be NULL") Integer product,
			@NotNull(message = "Location cannot be NULL") Integer location,
			@NotNull(message = "Enquiry cannot be NULL") Integer enquiry,
			@NotNull(message = "Ticket cannot be NULL") Integer ticket,
			@NotNull(message = "Position cannot be NULL") Integer position) {
		super();
		this.positionId = positionId;
		this.positionName = positionName;
		this.positionPriority = positionPriority;
		this.companyId = companyId;
		this.companyName = companyName;
		this.createdBy = createdBy;
		this.createdOn = createdOn;
		this.lastEditBy = lastEditBy;
		this.lastEditOn = lastEditOn;
		this.isActive = isActive;
		this.company = company;
		this.companyBranch = companyBranch;
		this.companyExecutive = companyExecutive;
		this.client = client;
		this.product = product;
		this.location = location;
		this.enquiry = enquiry;
		this.ticket = ticket;
		this.position = position;
	}

	public Long getPositionId() {
		return positionId;
	}

	public void setPositionId(Long positionId) {
		this.positionId = positionId;
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

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
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

	public Boolean getIsActive() {
		return isActive;
	}

	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
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
	
}
