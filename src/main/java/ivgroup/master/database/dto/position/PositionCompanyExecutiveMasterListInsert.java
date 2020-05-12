package ivgroup.master.database.dto.position;

import javax.validation.constraints.NotNull;

public class PositionCompanyExecutiveMasterListInsert
{
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
	
	public PositionCompanyExecutiveMasterListInsert()
	{
		
	}

	public PositionCompanyExecutiveMasterListInsert(
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
