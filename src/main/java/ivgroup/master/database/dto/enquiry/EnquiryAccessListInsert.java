package ivgroup.master.database.dto.enquiry;

import java.sql.Timestamp;

import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonFormat;

public class EnquiryAccessListInsert
{
	@NotNull(message = "EnquiryId cannot be NULL")
	Long enquiryId;
	@NotNull(message = "CompanyExecutiveId cannot be NULL")
	Long companyExecutiveId;
	@NotNull(message = "AccessApplicationTime cannot be NULL")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	Timestamp accessApplicationTime;
	
	public EnquiryAccessListInsert()
	{
		
	}

	public EnquiryAccessListInsert(
			@NotNull(message = "EnquiryId cannot be NULL") Long enquiryId,
			@NotNull(message = "CompanyExecutiveId cannot be NULL") Long companyExecutiveId,
			@NotNull(message = "AccessApplicationTime cannot be NULL") Timestamp accessApplicationTime) {
		super();
		this.enquiryId = enquiryId;
		this.companyExecutiveId = companyExecutiveId;
		this.accessApplicationTime = accessApplicationTime;
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

	public Timestamp getAccessApplicationTime() {
		return accessApplicationTime;
	}

	public void setAccessApplicationTime(Timestamp accessApplicationTime) {
		this.accessApplicationTime = accessApplicationTime;
	}
	
}
