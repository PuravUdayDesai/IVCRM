package ivgroup.master.database.dto.companyExecutive;

import javax.validation.constraints.NotNull;

public class CompanyExecutiveLogin {

	@NotNull(message = "CompanyExecutiveId cannot be NULL")
	private Long companyExecutivId;
	@NotNull(message = "CompanyId cannot be NULL")
	private Long companyId;
	@NotNull(message = "OwnerId cannot be NULL")
	private Long ownerId;
	@NotNull(message = "CompanyAccess cannot be NULL")
	private String companyAccess;
	@NotNull(message = "CompanyBranchAccess cannot be NULL")
	private String companyBranchAccess;
	@NotNull(message = "CompanyExecutiveAccess cannot be NULL")
	private String companyExecutiveAccess;
	@NotNull(message = "ClientAccess cannot be NULL")
	private String clientAccess;
	@NotNull(message = "ProductAccess cannot be NULL")
	private String productAccess;
	@NotNull(message = "LocationAccess cannot be NULL")
	private String locationAccess;
	@NotNull(message = "EnquiryAccess cannot be NULL")
	private String enquiryAccess;
	@NotNull(message = "TicketAccess cannot be NULL")
	private String ticketAccess;
	@NotNull(message = "PositionAcces cannot be NULL")
	private String positionAcces;
	@NotNull(message = "PositionAcces cannot be NULL")
	private Long notificationCountToBeRead;
	@NotNull(message = "PositionAcces cannot be NULL")
	private Long notificationCountForNew;
	@NotNull(message = "PositionAcces cannot be NULL")
	private Long immediateStatusTicketCount;
	@NotNull(message = "PositionAcces cannot be NULL")
	private Long highStatusTicketCount;
	@NotNull(message = "PositionAcces cannot be NULL")
	private Long normalStatusTicketCount;
	@NotNull(message = "PositionAcces cannot be NULL")
	private Long lowStatusTicketCount;
	 

	public CompanyExecutiveLogin()
	{
		
	}
	
	public CompanyExecutiveLogin(@NotNull(message = "CompanyExecutiveId cannot be NULL") Long companyExecutivId,
			@NotNull(message = "CompanyId cannot be NULL") Long companyId,
			@NotNull(message = "OwnerId cannot be NULL") Long ownerId,
			@NotNull(message = "CompanyAccess cannot be NULL") String companyAccess,
			@NotNull(message = "CompanyBranchAccess cannot be NULL") String companyBranchAccess,
			@NotNull(message = "CompanyExecutiveAccess cannot be NULL") String companyExecutiveAccess,
			@NotNull(message = "ClientAccess cannot be NULL") String clientAccess,
			@NotNull(message = "ProductAccess cannot be NULL") String productAccess,
			@NotNull(message = "LocationAccess cannot be NULL") String locationAccess,
			@NotNull(message = "EnquiryAccess cannot be NULL") String enquiryAccess,
			@NotNull(message = "TicketAccess cannot be NULL") String ticketAccess,
			@NotNull(message = "PositionAcces cannot be NULL") String positionAcces,
			@NotNull(message = "PositionAcces cannot be NULL") Long notificationCountToBeRead,
			@NotNull(message = "PositionAcces cannot be NULL") Long notificationCountForNew,
			@NotNull(message = "PositionAcces cannot be NULL") Long immediateStatusTicketCount,
			@NotNull(message = "PositionAcces cannot be NULL") Long highStatusTicketCount,
			@NotNull(message = "PositionAcces cannot be NULL") Long normalStatusTicketCount,
			@NotNull(message = "PositionAcces cannot be NULL") Long lowStatusTicketCount) {
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
		this.notificationCountToBeRead = notificationCountToBeRead;
		this.notificationCountForNew = notificationCountForNew;
		this.immediateStatusTicketCount = immediateStatusTicketCount;
		this.highStatusTicketCount = highStatusTicketCount;
		this.normalStatusTicketCount = normalStatusTicketCount;
		this.lowStatusTicketCount = lowStatusTicketCount;
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

	public Long getNotificationCountToBeRead() {
		return notificationCountToBeRead;
	}

	public void setNotificationCountToBeRead(Long notificationCountToBeRead) {
		this.notificationCountToBeRead = notificationCountToBeRead;
	}

	public Long getNotificationCountForNew() {
		return notificationCountForNew;
	}

	public void setNotificationCountForNew(Long notificationCountForNew) {
		this.notificationCountForNew = notificationCountForNew;
	}

	public Long getImmediateStatusTicketCount() {
		return immediateStatusTicketCount;
	}

	public void setImmediateStatusTicketCount(Long immediateStatusTicketCount) {
		this.immediateStatusTicketCount = immediateStatusTicketCount;
	}

	public Long getHighStatusTicketCount() {
		return highStatusTicketCount;
	}

	public void setHighStatusTicketCount(Long highStatusTicketCount) {
		this.highStatusTicketCount = highStatusTicketCount;
	}

	public Long getNormalStatusTicketCount() {
		return normalStatusTicketCount;
	}

	public void setNormalStatusTicketCount(Long normalStatusTicketCount) {
		this.normalStatusTicketCount = normalStatusTicketCount;
	}

	public Long getLowStatusTicketCount() {
		return lowStatusTicketCount;
	}

	public void setLowStatusTicketCount(Long lowStatusTicketCount) {
		this.lowStatusTicketCount = lowStatusTicketCount;
	}

}
