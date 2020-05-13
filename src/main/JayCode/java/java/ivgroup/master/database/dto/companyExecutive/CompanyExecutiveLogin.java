package ivgroup.master.database.dto.companyExecutive;

import javax.validation.constraints.NotNull;

public class CompanyExecutiveLogin
{
	@NotNull(
			message = "CompanyExecutiveId cannot be NULL"
	)
	Long companyExecutivId;
	@NotNull(
			message = "CompanyId cannot be NULL"
	)
	Long companyId;
	@NotNull(
			message = "OwnerId cannot be NULL"
	)
	Long ownerId;
	@NotNull(
			message = "CompanyAccess cannot be NULL"
	)
	Integer companyAccess;
	@NotNull(
			message = "CompanyBranchAccess cannot be NULL"
	)
	Integer companyBranchAccess;
	@NotNull(
			message = "CompanyExecutiveAccess cannot be NULL"
	)
	Integer companyExecutiveAccess;
	@NotNull(
			message = "ClientAccess cannot be NULL"
	)
	Integer clientAccess;
	@NotNull(
			message = "ProductAccess cannot be NULL"
	)
	Integer productAccess;
	@NotNull(
			message = "LocationAccess cannot be NULL"
	)
	Integer locationAccess;
	@NotNull(
			message = "EnquiryAccess cannot be NULL"
	)
	Integer enquiryAccess;
	@NotNull(
			message = "TicketAccess cannot be NULL"
	)
	Integer ticketAccess;
	@NotNull(
			message = "PositionAcces cannot be NULL"
	)
	Integer positionAcces;

	public CompanyExecutiveLogin() {

	}

	public CompanyExecutiveLogin(
			@NotNull(message = "CompanyExecutiveId cannot be NULL") Long companyExecutivId,
			@NotNull(message = "CompanyId cannot be NULL") Long companyId,
			@NotNull(message = "OwnerId cannot be NULL") Long ownerId, 
			@NotNull(message = "CompanyAccess cannot be NULL") Integer companyAccess, 
			@NotNull(message = "CompanyBranchAccess cannot be NULL") Integer companyBranchAccess,
			@NotNull(message = "CompanyExecutiveAccess cannot be NULL") Integer companyExecutiveAccess,
			@NotNull(message = "ClientAccess cannot be NULL") Integer clientAccess,
			@NotNull(message = "ProductAccess cannot be NULL") Integer productAccess,
			@NotNull(message = "LocationAccess cannot be NULL") Integer locationAccess,
			@NotNull(message = "EnquiryAccess cannot be NULL") Integer enquiryAccess,
			@NotNull(message = "TicketAccess cannot be NULL") Integer ticketAccess,
			@NotNull(message = "PositionAcces cannot be NULL") Integer positionAcces
							)
	{
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

	public Long getCompanyExecutivId()
	{
		return companyExecutivId;
	}

	public void setCompanyExecutivId(Long companyExecutivId)
	{
		this.companyExecutivId = companyExecutivId;
	}

	public Long getCompanyId()
	{
		return companyId;
	}

	public void setCompanyId(Long companyId)
	{
		this.companyId = companyId;
	}

	public Long getOwnerId()
	{
		return ownerId;
	}

	public void setOwnerId(Long ownerId)
	{
		this.ownerId = ownerId;
	}

	public Integer getCompanyAccess()
	{
		return companyAccess;
	}

	public void setCompanyAccess(Integer companyAccess)
	{
		this.companyAccess = companyAccess;
	}

	public Integer getCompanyBranchAccess()
	{
		return companyBranchAccess;
	}

	public void setCompanyBranchAccess(Integer companyBranchAccess)
	{
		this.companyBranchAccess = companyBranchAccess;
	}

	public Integer getCompanyExecutiveAccess()
	{
		return companyExecutiveAccess;
	}

	public void setCompanyExecutiveAccess(Integer companyExecutiveAccess)
	{
		this.companyExecutiveAccess = companyExecutiveAccess;
	}

	public Integer getClientAccess()
	{
		return clientAccess;
	}

	public void setClientAccess(Integer clientAccess)
	{
		this.clientAccess = clientAccess;
	}

	public Integer getProductAccess()
	{
		return productAccess;
	}

	public void setProductAccess(Integer productAccess)
	{
		this.productAccess = productAccess;
	}

	public Integer getLocationAccess()
	{
		return locationAccess;
	}

	public void setLocationAccess(Integer locationAccess)
	{
		this.locationAccess = locationAccess;
	}

	public Integer getEnquiryAccess()
	{
		return enquiryAccess;
	}

	public void setEnquiryAccess(Integer enquiryAccess)
	{
		this.enquiryAccess = enquiryAccess;
	}

	public Integer getTicketAccess()
	{
		return ticketAccess;
	}

	public void setTicketAccess(Integer ticketAccess)
	{
		this.ticketAccess = ticketAccess;
	}

	public Integer getPositionAcces()
	{
		return positionAcces;
	}

	public void setPositionAcces(Integer positionAcces)
	{
		this.positionAcces = positionAcces;
	}

}
