package ivgroup.master.database.dto.position;

import java.sql.Timestamp;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import com.fasterxml.jackson.annotation.JsonFormat;

public class PositionInsert 
{

	@NotEmpty(message = "PositionName cannot be NULL")
	String positionName;
	@NotEmpty(message = "PositionPriority cannot be NULL")
	Integer positionPriority;
	@NotEmpty(message = "CompanyId cannot be NULL")
	Long companyId;
	@NotEmpty(message = "Company cannot be NULL")
	@Size(min = 1, max=4)
	@Pattern(regexp="c?C?r?R?u?U?d?D?[cCrRuUdD]+")
	String company;
	@NotEmpty(message = "CompanyBranch cannot be NULL")
	@Size(min = 1, max=4)
	@Pattern(regexp="c?C?r?R?u?U?d?D?[cCrRuUdD]+")
	String companyBranch;
	@NotEmpty(message = "CompanyExecutive cannot be NULL")
	@Size(min = 1, max=4)
	@Pattern(regexp="c?C?r?R?u?U?d?D?[cCrRuUdD]+")
	String companyExecutive;
	@NotEmpty(message = "Client cannot be NULL")
	@Size(min = 1, max=4)
	@Pattern(regexp="c?C?r?R?u?U?d?D?[cCrRuUdD]+")
	String client;
	@NotEmpty(message = "Product cannot be NULL")
	@Size(min = 1, max=4)
	@Pattern(regexp="c?C?r?R?u?U?d?D?[cCrRuUdD]+")
	String product;
	@NotEmpty(message = "Location cannot be NULL")
	@Size(min = 1, max=4)
	@Pattern(regexp="c?C?r?R?u?U?d?D?[cCrRuUdD]+")
	String location;
	@NotEmpty(message = "Enquiry cannot be NULL")
	@Size(min = 1, max=4)
	@Pattern(regexp="c?C?r?R?u?U?d?D?[cCrRuUdD]+")
	String enquiry;
	@NotEmpty(message = "Ticket cannot be NULL")
	@Size(min = 1, max=4)
	@Pattern(regexp="c?C?r?R?u?U?d?D?[cCrRuUdD]+")
	String ticket;
	@NotEmpty(message = "Position cannot be NULL")
	@Size(min = 1, max=4)
	@Pattern(regexp="c?C?r?R?u?U?d?D?[cCrRuUdD]+")
	String position;
	@NotEmpty(message = "CreatedBy cannot be NULL")
	Long createdBy;
	@NotEmpty(message = "CreatedOn cannot be NULL")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	Timestamp createdOn;
	
	public PositionInsert()
	{
		
	}



	public PositionInsert(@NotEmpty(message = "PositionName cannot be NULL") String positionName,
			@NotEmpty(message = "PositionPriority cannot be NULL") Integer positionPriority,
			@NotEmpty(message = "CompanyId cannot be NULL") Long companyId,
			@NotEmpty(message = "Company cannot be NULL") @Size(min = 1, max = 4) @Pattern(regexp="c?C?r?R?u?U?d?D?[cCrRuUdD]+") String company,
			@NotEmpty(message = "CompanyBranch cannot be NULL") @Size(min = 1, max = 4) @Pattern(regexp="c?C?r?R?u?U?d?D?[cCrRuUdD]+") String companyBranch,
			@NotEmpty(message = "CompanyExecutive cannot be NULL") @Size(min = 1, max = 4) @Pattern(regexp="c?C?r?R?u?U?d?D?[cCrRuUdD]+") String companyExecutive,
			@NotEmpty(message = "Client cannot be NULL") @Size(min = 1, max = 4) @Pattern(regexp="c?C?r?R?u?U?d?D?[cCrRuUdD]+") String client,
			@NotEmpty(message = "Product cannot be NULL") @Size(min = 1, max = 4) @Pattern(regexp="c?C?r?R?u?U?d?D?[cCrRuUdD]+") String product,
			@NotEmpty(message = "Location cannot be NULL") @Size(min = 1, max = 4) @Pattern(regexp="c?C?r?R?u?U?d?D?[cCrRuUdD]+") String location,
			@NotEmpty(message = "Enquiry cannot be NULL") @Size(min = 1, max = 4) @Pattern(regexp="c?C?r?R?u?U?d?D?[cCrRuUdD]+") String enquiry,
			@NotEmpty(message = "Ticket cannot be NULL") @Size(min = 1, max = 4) @Pattern(regexp="c?C?r?R?u?U?d?D?[cCrRuUdD]+") String ticket,
			@NotEmpty(message = "Position cannot be NULL") @Size(min = 1, max = 4) @Pattern(regexp="c?C?r?R?u?U?d?D?[cCrRuUdD]+") String position,
			@NotEmpty(message = "CreatedBy cannot be NULL") Long createdBy,
			@NotEmpty(message = "CreatedOn cannot be NULL") Timestamp createdOn) {
		super();
		this.positionName = positionName;
		this.positionPriority = positionPriority;
		this.companyId = companyId;
		this.company = company;
		this.companyBranch = companyBranch;
		this.companyExecutive = companyExecutive;
		this.client = client;
		this.product = product;
		this.location = location;
		this.enquiry = enquiry;
		this.ticket = ticket;
		this.position = position;
		this.createdBy = createdBy;
		this.createdOn = createdOn;
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
