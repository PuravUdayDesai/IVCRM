package ivgroup.master.database.dto.position;

import java.sql.Timestamp;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonFormat;

public class PositionSelect 
{

	@NotNull(message = "PositionId cannot be NULL")
	Long positionId;
	@NotNull(message = "PositionName cannot be NULL")
	String positionName;
	@NotNull(message = "PositionPriority cannot be NULL")
	@Min(value=1)
	@Max(value=15)
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
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone="IST")
	Timestamp lastEditOn;
	@NotNull(message = "IsActive cannot be NULL")
	Boolean isActive;
	@NotNull(message = "Company cannot be NULL")
	String company;
	@NotNull(message = "CompanyBranch cannot be NULL")
	String companyBranch;
	@NotNull(message = "CompanyExecutive cannot be NULL")
	String companyExecutive;
	@NotNull(message = "Client cannot be NULL")
	String client;
	@NotNull(message = "Product cannot be NULL")
	String product;
	@NotNull(message = "Location cannot be NULL")
	String location;
	@NotNull(message = "Enquiry cannot be NULL")
	String enquiry;
	@NotNull(message = "Ticket cannot be NULL")
	String ticket;
	@NotNull(message = "Position cannot be NULL")
	String position;
	
	public PositionSelect()
	{
		
	}

	public PositionSelect(@NotNull(message = "PositionId cannot be NULL") Long positionId,
			@NotNull(message = "PositionName cannot be NULL") String positionName,
			@NotNull(message = "PositionPriority cannot be NULL") @Min(value=1) @Max(value=15) Integer positionPriority,
			@NotNull(message = "CompanyId cannot be NULL") Long companyId,
			@NotNull(message = "CompanyName cannot be NULL") String companyName,
			@NotNull(message = "CreatedBy cannot be NULL") Long createdBy,
			@NotNull(message = "CreatedOn cannot be NULL") Timestamp createdOn,
			@NotNull(message = "LastEditBy cannot be NULL") Long lastEditBy,
			@NotNull(message = "LastEditOn cannot be NULL") Timestamp lastEditOn,
			@NotNull(message = "IsActive cannot be NULL") Boolean isActive,
			@NotNull(message = "Company cannot be NULL") String company,
			@NotNull(message = "CompanyBranch cannot be NULL") String companyBranch,
			@NotNull(message = "CompanyExecutive cannot be NULL") String companyExecutive,
			@NotNull(message = "Client cannot be NULL") String client,
			@NotNull(message = "Product cannot be NULL") String product,
			@NotNull(message = "Location cannot be NULL") String location,
			@NotNull(message = "Enquiry cannot be NULL") String enquiry,
			@NotNull(message = "Ticket cannot be NULL") String ticket,
			@NotNull(message = "Position cannot be NULL") String position) {
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

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getCompanyBranch() {
		return companyBranch;
	}

	public void setCompanyBranch(String companyBranch) {
		this.companyBranch = companyBranch;
	}

	public String getCompanyExecutive() {
		return companyExecutive;
	}

	public void setCompanyExecutive(String companyExecutive) {
		this.companyExecutive = companyExecutive;
	}

	public String getClient() {
		return client;
	}

	public void setClient(String client) {
		this.client = client;
	}

	public String getProduct() {
		return product;
	}

	public void setProduct(String product) {
		this.product = product;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getEnquiry() {
		return enquiry;
	}

	public void setEnquiry(String enquiry) {
		this.enquiry = enquiry;
	}

	public String getTicket() {
		return ticket;
	}

	public void setTicket(String ticket) {
		this.ticket = ticket;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

}
