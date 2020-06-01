package ivgroup.master.database.dto.enquiry;

import javax.validation.constraints.NotEmpty;

public class NonAccessibleExecutiveListSelect 
{
	@NotEmpty(message = "CompanyExecutiveId cannot be NULL")
	String companyExecutiveId;
	@NotEmpty(message = "CompanyExecutiveName cannot be NULL")
	String companyExecutiveName;
	@NotEmpty(message = "ContactNumber cannot be NULL")
	String contactNumber;
	@NotEmpty(message = "CompanyID cannot be NULL")
	Long companyID;
	
	public NonAccessibleExecutiveListSelect()
	{
		
	}

	public NonAccessibleExecutiveListSelect(
			@NotEmpty(message = "CompanyExecutiveId cannot be NULL") String companyExecutiveId,
			@NotEmpty(message = "CompanyExecutiveName cannot be NULL") String companyExecutiveName,
			@NotEmpty(message = "ContactNumber cannot be NULL") String contactNumber,
			@NotEmpty(message = "CompanyID cannot be NULL") Long companyID) {
		super();
		this.companyExecutiveId = companyExecutiveId;
		this.companyExecutiveName = companyExecutiveName;
		this.contactNumber = contactNumber;
		this.companyID = companyID;
	}

	public String getCompanyExecutiveId() {
		return companyExecutiveId;
	}

	public void setCompanyExecutiveId(String companyExecutiveId) {
		this.companyExecutiveId = companyExecutiveId;
	}

	public String getCompanyExecutiveName() {
		return companyExecutiveName;
	}

	public void setCompanyExecutiveName(String companyExecutiveName) {
		this.companyExecutiveName = companyExecutiveName;
	}

	public String getContactNumber() {
		return contactNumber;
	}

	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}

	public Long getCompanyID() {
		return companyID;
	}

	public void setCompanyID(Long companyID) {
		this.companyID = companyID;
	}
	
}
