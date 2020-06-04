package ivgroup.master.database.dto.companyExecutive;

import javax.validation.constraints.NotEmpty;

public class CompanyExecutiveLogin {
	
	@NotEmpty(message = "CompanyExecutiveId cannot be NULL")
	Long companyExecutivId;
	@NotEmpty(message = "CompanyId cannot be NULL")
	Long companyId;
	@NotEmpty(message = "OwnerId cannot be NULL")
	Long ownerId;
	@NotEmpty(message = "CompanyAccess cannot be NULL")
	String companyAccess;
	@NotEmpty(message = "CompanyBranchAccess cannot be NULL")
	String companyBranchAccess;
	@NotEmpty(message = "CompanyExecutiveAccess cannot be NULL")
	String companyExecutiveAccess;
	@NotEmpty(message = "ClientAccess cannot be NULL")
	String clientAccess;
	@NotEmpty(message = "ProductAccess cannot be NULL")
	String productAccess;
	@NotEmpty(message = "LocationAccess cannot be NULL")
	String locationAccess;
	@NotEmpty(message = "EnquiryAccess cannot be NULL")
	String enquiryAccess;
	@NotEmpty(message = "TicketAccess cannot be NULL")
	String ticketAccess;
	@NotEmpty(message = "PositionAcces cannot be NULL")
	String positionAcces;

	public CompanyExecutiveLogin() {

	}

	public CompanyExecutiveLogin(@NotEmpty(message = "CompanyExecutiveId cannot be NULL") Long companyExecutivId,
			@NotEmpty(message = "CompanyId cannot be NULL") Long companyId,
			@NotEmpty(message = "OwnerId cannot be NULL") Long ownerId,
			@NotEmpty(message = "CompanyAccess cannot be NULL") String companyAccess,
			@NotEmpty(message = "CompanyBranchAccess cannot be NULL") String companyBranchAccess,
			@NotEmpty(message = "CompanyExecutiveAccess cannot be NULL") String companyExecutiveAccess,
			@NotEmpty(message = "ClientAccess cannot be NULL") String clientAccess,
			@NotEmpty(message = "ProductAccess cannot be NULL") String productAccess,
			@NotEmpty(message = "LocationAccess cannot be NULL") String locationAccess,
			@NotEmpty(message = "EnquiryAccess cannot be NULL") String enquiryAccess,
			@NotEmpty(message = "TicketAccess cannot be NULL") String ticketAccess,
			@NotEmpty(message = "PositionAcces cannot be NULL") String positionAcces) {
		super();
		this.companyExecutivId = companyExecutivId;
		this.companyId = companyId;
		this.ownerId = ownerId;
		this.companyAccess = companyAccess;
		this.companyBranchAccess = companyBranchAccess;
		this.companyExecutiveAccess = companyExecutiveAccess;
		this.clientAccess = clientAccess;
		this.productAccess = productAccess;
		this.locationAccess = locationAccess;
		this.enquiryAccess = enquiryAccess;
		this.ticketAccess = ticketAccess;
		this.positionAcces = positionAcces;
	}

	public Long getCompanyExecutivId() {
		return companyExecutivId;
	}

	public void setCompanyExecutivId(Long companyExecutivId) {
		this.companyExecutivId = companyExecutivId;
	}

	public Long getCompanyId() {
		return companyId;
	}

	public void setCompanyId(Long companyId) {
		this.companyId = companyId;
	}

	public Long getOwnerId() {
		return ownerId;
	}

	public void setOwnerId(Long ownerId) {
		this.ownerId = ownerId;
	}

	public String getCompanyAccess() {
		return companyAccess;
	}

	public void setCompanyAccess(String companyAccess) {
		this.companyAccess = companyAccess;
	}

	public String getCompanyBranchAccess() {
		return companyBranchAccess;
	}

	public void setCompanyBranchAccess(String companyBranchAccess) {
		this.companyBranchAccess = companyBranchAccess;
	}

	public String getCompanyExecutiveAccess() {
		return companyExecutiveAccess;
	}

	public void setCompanyExecutiveAccess(String companyExecutiveAccess) {
		this.companyExecutiveAccess = companyExecutiveAccess;
	}

	public String getClientAccess() {
		return clientAccess;
	}

	public void setClientAccess(String clientAccess) {
		this.clientAccess = clientAccess;
	}

	public String getProductAccess() {
		return productAccess;
	}

	public void setProductAccess(String productAccess) {
		this.productAccess = productAccess;
	}

	public String getLocationAccess() {
		return locationAccess;
	}

	public void setLocationAccess(String locationAccess) {
		this.locationAccess = locationAccess;
	}

	public String getEnquiryAccess() {
		return enquiryAccess;
	}

	public void setEnquiryAccess(String enquiryAccess) {
		this.enquiryAccess = enquiryAccess;
	}

	public String getTicketAccess() {
		return ticketAccess;
	}

	public void setTicketAccess(String ticketAccess) {
		this.ticketAccess = ticketAccess;
	}

	public String getPositionAcces() {
		return positionAcces;
	}

	public void setPositionAcces(String positionAcces) {
		this.positionAcces = positionAcces;
	}

}
