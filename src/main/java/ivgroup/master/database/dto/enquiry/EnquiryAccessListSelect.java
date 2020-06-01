package ivgroup.master.database.dto.enquiry;

import java.sql.Timestamp;

import javax.validation.constraints.NotEmpty;

import com.fasterxml.jackson.annotation.JsonFormat;

public class EnquiryAccessListSelect
{
	@NotEmpty(message = "EnquiryAccessId cannot be NULL")
	Long enquiryAccessId;
	@NotEmpty(message = "EnquiryId cannot be NULL")
	Long enquiryId;
	@NotEmpty(message = "CompanyExecutiveId cannot be NULL")
	Long companyExecutiveId;
	@NotEmpty(message = "CompanyExecutiveName cannot be NULL")
	String companyExecutiveName;
	@NotEmpty(message = "OwnerFlag cannot be NULL")
	Boolean ownerFlag;
	@NotEmpty(message = "AccessApplicationTime cannot be NULL")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	Timestamp accessApplicationTime;
	
	public EnquiryAccessListSelect()
	{
		
	}

	public EnquiryAccessListSelect(@NotEmpty(message = "EnquiryAccessId cannot be NULL") Long enquiryAccessId,
			@NotEmpty(message = "EnquiryId cannot be NULL") Long enquiryId,
			@NotEmpty(message = "CompanyExecutiveId cannot be NULL") Long companyExecutiveId,
			@NotEmpty(message = "CompanyExecutiveName cannot be NULL") String companyExecutiveName,
			@NotEmpty(message = "OwnerFlag cannot be NULL") Boolean ownerFlag,
			@NotEmpty(message = "AccessApplicationTime cannot be NULL") Timestamp accessApplicationTime) {
		super();
		this.enquiryAccessId = enquiryAccessId;
		this.enquiryId = enquiryId;
		this.companyExecutiveId = companyExecutiveId;
		this.companyExecutiveName = companyExecutiveName;
		this.ownerFlag = ownerFlag;
		this.accessApplicationTime = accessApplicationTime;
	}

	public Long getEnquiryAccessId() {
		return enquiryAccessId;
	}

	public void setEnquiryAccessId(Long enquiryAccessId) {
		this.enquiryAccessId = enquiryAccessId;
	}

	public Long getEnquiryId() {
		return enquiryId;
	}

	public void setEnquiryId(Long enquiryId) {
		this.enquiryId = enquiryId;
	}

	public Long getCompanyExecutiveId() {
		return companyExecutiveId;
	}

	public void setCompanyExecutiveId(Long companyExecutiveId) {
		this.companyExecutiveId = companyExecutiveId;
	}

	public String getCompanyExecutiveName() {
		return companyExecutiveName;
	}

	public void setCompanyExecutiveName(String companyExecutiveName) {
		this.companyExecutiveName = companyExecutiveName;
	}

	public Boolean getOwnerFlag() {
		return ownerFlag;
	}

	public void setOwnerFlag(Boolean ownerFlag) {
		this.ownerFlag = ownerFlag;
	}

	public Timestamp getAccessApplicationTime() {
		return accessApplicationTime;
	}

	public void setAccessApplicationTime(Timestamp accessApplicationTime) {
		this.accessApplicationTime = accessApplicationTime;
	}
}
