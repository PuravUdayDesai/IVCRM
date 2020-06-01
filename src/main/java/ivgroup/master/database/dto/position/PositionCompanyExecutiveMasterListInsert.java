package ivgroup.master.database.dto.position;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

public class PositionCompanyExecutiveMasterListInsert
{
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
	
	public PositionCompanyExecutiveMasterListInsert()
	{
		
	}

	

	public PositionCompanyExecutiveMasterListInsert(
			@NotEmpty(message = "Company cannot be NULL") @Size(min = 1, max = 4) @Pattern(regexp="c?C?r?R?u?U?d?D?[cCrRuUdD]+") String company,
			@NotEmpty(message = "CompanyBranch cannot be NULL") @Size(min = 1, max = 4) @Pattern(regexp="c?C?r?R?u?U?d?D?[cCrRuUdD]+") String companyBranch,
			@NotEmpty(message = "CompanyExecutive cannot be NULL") @Size(min = 1, max = 4) @Pattern(regexp="c?C?r?R?u?U?d?D?[cCrRuUdD]+") String companyExecutive,
			@NotEmpty(message = "Client cannot be NULL") @Size(min = 1, max = 4) @Pattern(regexp="c?C?r?R?u?U?d?D?[cCrRuUdD]+") String client,
			@NotEmpty(message = "Product cannot be NULL") @Size(min = 1, max = 4) @Pattern(regexp="c?C?r?R?u?U?d?D?[cCrRuUdD]+") String product,
			@NotEmpty(message = "Location cannot be NULL") @Size(min = 1, max = 4) @Pattern(regexp="c?C?r?R?u?U?d?D?[cCrRuUdD]+") String location,
			@NotEmpty(message = "Enquiry cannot be NULL") @Size(min = 1, max = 4) @Pattern(regexp="c?C?r?R?u?U?d?D?[cCrRuUdD]+") String enquiry,
			@NotEmpty(message = "Ticket cannot be NULL") @Size(min = 1, max = 4) @Pattern(regexp="c?C?r?R?u?U?d?D?[cCrRuUdD]+") String ticket,
			@NotEmpty(message = "Position cannot be NULL") @Size(min = 1, max = 4) @Pattern(regexp="c?C?r?R?u?U?d?D?[cCrRuUdD]+") String position) {
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
