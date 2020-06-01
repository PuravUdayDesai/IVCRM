package ivgroup.master.database.dto.enquiry;

import java.sql.Timestamp;

import javax.validation.constraints.NotEmpty;

import com.fasterxml.jackson.annotation.JsonFormat;

public class EnquiryDetailsForNewProductTicketInsert
{
	@NotEmpty(message = "EnquiryRemarks cannot be NULL")	
	String enquiryRemarks;
	@NotEmpty(message = "EnquiryType cannot be NULL")
	Long enquiryType;
	@NotEmpty(message = "StartDateAndTime cannot be NULL")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	Timestamp startDateAndTime;
	@NotEmpty(message = "DeadlineDateAndTime cannot be NULL")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	Timestamp deadlineDateAndTime;
	@NotEmpty(message = "CompanyId cannot be NULL")
	Long companyId;
	
	public EnquiryDetailsForNewProductTicketInsert()
	{
		
	}

	public EnquiryDetailsForNewProductTicketInsert(
			@NotEmpty(message = "EnquiryRemarks cannot be NULL") String enquiryRemarks,
			@NotEmpty(message = "EnquiryType cannot be NULL") Long enquiryType,
			@NotEmpty(message = "StartDateAndTime cannot be NULL") Timestamp startDateAndTime,
			@NotEmpty(message = "DeadlineDateAndTime cannot be NULL") Timestamp deadlineDateAndTime,
			@NotEmpty(message = "CompanyId cannot be NULL") Long companyId) {
		super();
		this.enquiryRemarks = enquiryRemarks;
		this.enquiryType = enquiryType;
		this.startDateAndTime = startDateAndTime;
		this.deadlineDateAndTime = deadlineDateAndTime;
		this.companyId = companyId;
	}

	public String getEnquiryRemarks() {
		return enquiryRemarks;
	}

	public void setEnquiryRemarks(String enquiryRemarks) {
		this.enquiryRemarks = enquiryRemarks;
	}

	public Long getEnquiryType() {
		return enquiryType;
	}

	public void setEnquiryType(Long enquiryType) {
		this.enquiryType = enquiryType;
	}

	public Timestamp getStartDateAndTime() {
		return startDateAndTime;
	}

	public void setStartDateAndTime(Timestamp startDateAndTime) {
		this.startDateAndTime = startDateAndTime;
	}

	public Timestamp getDeadlineDateAndTime() {
		return deadlineDateAndTime;
	}

	public void setDeadlineDateAndTime(Timestamp deadlineDateAndTime) {
		this.deadlineDateAndTime = deadlineDateAndTime;
	}

	public Long getCompanyId() {
		return companyId;
	}

	public void setCompanyId(Long companyId) {
		this.companyId = companyId;
	}
	
}
