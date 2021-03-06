package ivgroup.master.database.dto.enquiry;

import java.sql.Timestamp;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.PastOrPresent;

import com.fasterxml.jackson.annotation.JsonFormat;

public class EnquiryDetailsForNewProductTicketInsert
{
	@NotNull(message = "EnquiryRemarks cannot be NULL")	
	private String enquiryRemarks;
	@NotNull(message = "EnquiryType cannot be NULL")
	private Long enquiryType;
	@NotNull(message = "StartDateAndTime cannot be NULL")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	@PastOrPresent
	private Timestamp startDateAndTime;
	@NotNull(message = "DeadlineDateAndTime cannot be NULL")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	@PastOrPresent
	private Timestamp deadlineDateAndTime;
	@NotNull(message = "CompanyId cannot be NULL")
	private Long companyId;
	
	public EnquiryDetailsForNewProductTicketInsert()
	{
		
	}

	public EnquiryDetailsForNewProductTicketInsert(
			@NotNull(message = "EnquiryRemarks cannot be NULL") String enquiryRemarks,
			@NotNull(message = "EnquiryType cannot be NULL") Long enquiryType,
			@NotNull(message = "StartDateAndTime cannot be NULL") @PastOrPresent Timestamp startDateAndTime,
			@NotNull(message = "DeadlineDateAndTime cannot be NULL") @PastOrPresent Timestamp deadlineDateAndTime,
			@NotNull(message = "CompanyId cannot be NULL") Long companyId) {
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
