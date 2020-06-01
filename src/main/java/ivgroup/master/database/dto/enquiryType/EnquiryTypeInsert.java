package ivgroup.master.database.dto.enquiryType;

import java.sql.Timestamp;

import javax.validation.constraints.NotEmpty;

import com.fasterxml.jackson.annotation.JsonFormat;

public class EnquiryTypeInsert
{
	@NotEmpty(message = "EnquiryTypeName cannot be NULL")
	String enquiryTypeName;
	@NotEmpty(message = "EnquiryTypeColorCode cannot be NULL")
	String enquiryTypeColorCode;
	@NotEmpty(message = "CompanyId cannot be NULL")
	Long companyId;
	@NotEmpty(message = "CreatedBy cannot be NULL")
	Long createdBy;
	@NotEmpty(message = "CreatedOn cannot be NULL")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	Timestamp createdOn;
	
	public EnquiryTypeInsert()
	{
		
	}

	public EnquiryTypeInsert(@NotEmpty(message = "EnquiryTypeName cannot be NULL") String enquiryTypeName,
			@NotEmpty(message = "EnquiryTypeColorCode cannot be NULL") String enquiryTypeColorCode,
			@NotEmpty(message = "CompanyId cannot be NULL") Long companyId,
			@NotEmpty(message = "CreatedBy cannot be NULL") Long createdBy,
			@NotEmpty(message = "CreatedOn cannot be NULL") Timestamp createdOn) {
		super();
		this.enquiryTypeName = enquiryTypeName;
		this.enquiryTypeColorCode = enquiryTypeColorCode;
		this.companyId = companyId;
		this.createdBy = createdBy;
		this.createdOn = createdOn;
	}

	public String getEnquiryTypeName() {
		return enquiryTypeName;
	}

	public void setEnquiryTypeName(String enquiryTypeName) {
		this.enquiryTypeName = enquiryTypeName;
	}

	public String getEnquiryTypeColorCode() {
		return enquiryTypeColorCode;
	}

	public void setEnquiryTypeColorCode(String enquiryTypeColorCode) {
		this.enquiryTypeColorCode = enquiryTypeColorCode;
	}

	public Long getCompanyId() {
		return companyId;
	}

	public void setCompanyId(Long companyId) {
		this.companyId = companyId;
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
