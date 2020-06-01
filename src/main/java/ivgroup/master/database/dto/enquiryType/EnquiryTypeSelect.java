package ivgroup.master.database.dto.enquiryType;

import java.sql.Timestamp;

import javax.validation.constraints.NotEmpty;

import com.fasterxml.jackson.annotation.JsonFormat;

public class EnquiryTypeSelect
{
	@NotEmpty(message = "EnquiryTypeId cannot be NULL")
	Long enquiryTypeId;
	@NotEmpty(message = "EnquiryTypeName cannot be NULL")
	String enquiryTypeName;
	@NotEmpty(message = "EnquiryTypeColorCode cannot be NULL")
	String enquiryTypeColorCode;
	@NotEmpty(message = "CompanyId cannot be NULL")
	Long companyId;
	@NotEmpty(message = "CompanyName cannot be NULL")
	String companyName;
	@NotEmpty(message = "CreatedBy cannot be NULL")
	Long createdBy;
	@NotEmpty(message = "CreatedOn cannot be NULL")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	Timestamp createdOn;
	@NotEmpty(message = "LastEditBy cannot be NULL")
	Long lastEditBy;
	@NotEmpty(message = "LastEditOn cannot be NULL")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	Timestamp lastEditOn;
	
	public EnquiryTypeSelect()
	{
		
	}

	public EnquiryTypeSelect(@NotEmpty(message = "EnquiryTypeId cannot be NULL") Long enquiryTypeId,
			@NotEmpty(message = "EnquiryTypeName cannot be NULL") String enquiryTypeName,
			@NotEmpty(message = "EnquiryTypeColorCode cannot be NULL") String enquiryTypeColorCode,
			@NotEmpty(message = "CompanyId cannot be NULL") Long companyId,
			@NotEmpty(message = "CompanyName cannot be NULL") String companyName,
			@NotEmpty(message = "CreatedBy cannot be NULL") Long createdBy,
			@NotEmpty(message = "CreatedOn cannot be NULL") Timestamp createdOn,
			@NotEmpty(message = "LastEditBy cannot be NULL") Long lastEditBy,
			@NotEmpty(message = "LastEditOn cannot be NULL") Timestamp lastEditOn) {
		super();
		this.enquiryTypeId = enquiryTypeId;
		this.enquiryTypeName = enquiryTypeName;
		this.enquiryTypeColorCode = enquiryTypeColorCode;
		this.companyId = companyId;
		this.companyName = companyName;
		this.createdBy = createdBy;
		this.createdOn = createdOn;
		this.lastEditBy = lastEditBy;
		this.lastEditOn = lastEditOn;
	}

	public Long getEnquiryTypeId() {
		return enquiryTypeId;
	}

	public void setEnquiryTypeId(Long enquiryTypeId) {
		this.enquiryTypeId = enquiryTypeId;
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

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
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

	public Long getLastEditBy() {
		return lastEditBy;
	}

	public void setLastEditBy(Long lastEditBy) {
		this.lastEditBy = lastEditBy;
	}

	public Timestamp getLastEditOn() {
		return lastEditOn;
	}

	public void setLastEditOn(Timestamp lastEditOn) {
		this.lastEditOn = lastEditOn;
	}
}
