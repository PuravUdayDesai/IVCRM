package ivgroup.master.database.dto.enquiryType;

import java.sql.Timestamp;

import javax.validation.constraints.FutureOrPresent;
import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonFormat;

public class EnquiryTypeUpdate 
{
	String enquiryTypeName;
	String enquiryTypeColorCode;
	Long companyId;
	@NotNull(message = "LastEditBy cannot be NULL")
	Long lastEditBy;
	@NotNull(message = "LastEditOn cannot be NULL")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	@FutureOrPresent
	Timestamp lastEditOn;
	
	public EnquiryTypeUpdate()
	{
		
	}

	public EnquiryTypeUpdate(String enquiryTypeName, String enquiryTypeColorCode, Long companyId,
			@NotNull(message = "LastEditBy cannot be NULL") Long lastEditBy,
			@NotNull(message = "LastEditOn cannot be NULL") @FutureOrPresent Timestamp lastEditOn) {
		super();
		this.enquiryTypeName = enquiryTypeName;
		this.enquiryTypeColorCode = enquiryTypeColorCode;
		this.companyId = companyId;
		this.lastEditBy = lastEditBy;
		this.lastEditOn = lastEditOn;
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