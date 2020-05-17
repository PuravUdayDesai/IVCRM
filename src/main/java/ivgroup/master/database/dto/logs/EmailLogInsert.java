package ivgroup.master.database.dto.logs;

import javax.validation.constraints.NotNull;

public class EmailLogInsert
{
	@NotNull(message = "CompanyExecutiveId cannot be NULL")
	Long companyExecutiveId;
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

	public EmailLogInsert()
	{
		
	}

	public EmailLogInsert(@NotNull(message = "CompanyExecutiveId cannot be NULL") Long companyExecutiveId,
			@NotNull(message = "Subject cannot be NULL") String subject,
			@NotNull(message = "BodyContent cannot be NULL") String bodyContent,
			@NotNull(message = "BodyContentType cannot be NULL") String bodyContentType,
			@NotNull(message = "MailToType cannot be NULL") String mailToType,
			@NotNull(message = "PurposeId cannot be NULL") Long purposeId) {
		super();
		this.companyExecutiveId = companyExecutiveId;
		this.subject = subject;
		this.bodyContent = bodyContent;
		this.bodyContentType = bodyContentType;
		this.mailToType = mailToType;
		this.purposeId = purposeId;
	}

	public Long getCompanyExecutiveId() {
		return companyExecutiveId;
	}

	public void setCompanyExecutiveId(Long companyExecutiveId) {
		this.companyExecutiveId = companyExecutiveId;
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

}
