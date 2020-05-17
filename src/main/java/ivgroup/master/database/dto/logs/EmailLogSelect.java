package ivgroup.master.database.dto.logs;

import javax.validation.constraints.NotNull;

public class EmailLogSelect 
{
	@NotNull(message = "EmailLogId cannot be NULL")
	Long emailLogId;
	@NotNull(message = "CompanyExecutiveId cannot be NULL")
	Long companyExecutiveId;
	@NotNull(message = "CompanyExecutiveName cannot be NULL")
	String companyExecutiveName;
	@NotNull(message = "CompanyExecutiveEmailId cannot be NULL")
	String companyExecutiveEmailId;
	@NotNull(message = "Subject cannot be NULL")
	String subject;
	@NotNull(message = "BodyContent cannot be NULL")
	String bodyContent;
	@NotNull(message = "BodyContentType cannot be NULL")
	String bodyContentType;
	@NotNull(message = "MailToType cannot be NULL")
	String mailToType;
	@NotNull(message = "PurposeId cannot be NULL")
	Long purposeId;
	@NotNull(message = "PurposeTitle cannot be NULL")
	String purposeTitle;
	
	public EmailLogSelect()
	{
		
	}

	public EmailLogSelect(
			@NotNull(message = "EmailLogId cannot be NULL") Long emailLogId,
			@NotNull(message = "CompanyExecutiveId cannot be NULL") Long companyExecutiveId,
			@NotNull(message = "CompanyExecutiveName cannot be NULL") String companyExecutiveName,
			@NotNull(message = "CompanyExecutiveEmailId cannot be NULL") String companyExecutiveEmailId,
			@NotNull(message = "Subject cannot be NULL") String subject,
			@NotNull(message = "BodyContent cannot be NULL") String bodyContent,
			@NotNull(message = "BodyContentType cannot be NULL") String bodyContentType,
			@NotNull(message = "MailToType cannot be NULL") String mailToType,
			@NotNull(message = "PurposeId cannot be NULL") Long purposeId,
			@NotNull(message = "PurposeTitle cannot be NULL") String purposeTitle) {
		super();
		this.emailLogId = emailLogId;
		this.companyExecutiveId = companyExecutiveId;
		this.companyExecutiveName = companyExecutiveName;
		this.companyExecutiveEmailId = companyExecutiveEmailId;
		this.subject = subject;
		this.bodyContent = bodyContent;
		this.bodyContentType = bodyContentType;
		this.mailToType = mailToType;
		this.purposeId = purposeId;
		this.purposeTitle = purposeTitle;
	}

	public Long getEmailLogId() {
		return emailLogId;
	}

	public void setEmailLogId(Long emailLogId) {
		this.emailLogId = emailLogId;
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

	public String getCompanyExecutiveEmailId() {
		return companyExecutiveEmailId;
	}

	public void setCompanyExecutiveEmailId(String companyExecutiveEmailId) {
		this.companyExecutiveEmailId = companyExecutiveEmailId;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getBodyContent() {
		return bodyContent;
	}

	public void setBodyContent(String bodyContent) {
		this.bodyContent = bodyContent;
	}

	public String getBodyContentType() {
		return bodyContentType;
	}

	public void setBodyContentType(String bodyContentType) {
		this.bodyContentType = bodyContentType;
	}

	public String getMailToType() {
		return mailToType;
	}

	public void setMailToType(String mailToType) {
		this.mailToType = mailToType;
	}

	public Long getPurposeId() {
		return purposeId;
	}

	public void setPurposeId(Long purposeId) {
		this.purposeId = purposeId;
	}

	public String getPurposeTitle() {
		return purposeTitle;
	}

	public void setPurposeTitle(String purposeTitle) {
		this.purposeTitle = purposeTitle;
	}	
}
