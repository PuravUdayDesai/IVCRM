package ivgroup.master.database.dto.notification;

import java.sql.Timestamp;

import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonFormat;

public class NotificationSelect {

	@NotNull(message="CompanyExecutiveID cannot be null")
	private Long companyExecutiveID;
	@NotNull(message="CompanyExecutiveName cannot be null")
	private String companyExecutiveName;
	@NotNull(message="NotificationID cannot be null")
	private Long notificationID;
	@NotNull(message="NotificationSubject cannot be null")
	private String notificationSubject;
	@NotNull(message="NotificationDescription cannot be null")
	private String notificationDescription;
	@NotNull(message = "NotificationTime cannot be null")
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone="IST")
	private Timestamp notificationTime;
	@NotNull(message = "NotificationTimeString cannot be NULL")
	private String notificationTimeString;
	@NotNull(message="ReadIndex cannot be null")
	private Boolean readIndex;
	
	public NotificationSelect() 
	{
		
	}

	public NotificationSelect(@NotNull(message = "CompanyExecutiveID cannot be null") Long companyExecutiveID,
			@NotNull(message = "CompanyExecutiveName cannot be null") String companyExecutiveName,
			@NotNull(message = "NotificationID cannot be null") Long notificationID,
			@NotNull(message = "NotificationSubject cannot be null") String notificationSubject,
			@NotNull(message = "NotificationDescription cannot be null") String notificationDescription,
			@NotNull(message = "NotificationTime cannot be null") Timestamp notificationTime,
			@NotNull(message = "NotificationTimeString cannot be NULL") String notificationTimeString,
			@NotNull(message = "ReadIndex cannot be null") Boolean readIndex) {
		super();
		this.companyExecutiveID = companyExecutiveID;
		this.companyExecutiveName = companyExecutiveName;
		this.notificationID = notificationID;
		this.notificationSubject = notificationSubject;
		this.notificationDescription = notificationDescription;
		this.notificationTime = notificationTime;
		this.notificationTimeString = notificationTimeString;
		this.readIndex = readIndex;
	}

	public Long getCompanyExecutiveID() {
		return companyExecutiveID;
	}

	public void setCompanyExecutiveID(Long companyExecutiveID) {
		this.companyExecutiveID = companyExecutiveID;
	}

	public String getCompanyExecutiveName() {
		return companyExecutiveName;
	}

	public void setCompanyExecutiveName(String companyExecutiveName) {
		this.companyExecutiveName = companyExecutiveName;
	}

	public Long getNotificationID() {
		return notificationID;
	}

	public void setNotificationID(Long notificationID) {
		this.notificationID = notificationID;
	}

	public String getNotificationSubject() {
		return notificationSubject;
	}

	public void setNotificationSubject(String notificationSubject) {
		this.notificationSubject = notificationSubject;
	}

	public String getNotificationDescription() {
		return notificationDescription;
	}

	public void setNotificationDescription(String notificationDescription) {
		this.notificationDescription = notificationDescription;
	}

	public Timestamp getNotificationTime() {
		return notificationTime;
	}

	public void setNotificationTime(Timestamp notificationTime) {
		this.notificationTime = notificationTime;
	}

	public String getNotificationTimeString() {
		return notificationTimeString;
	}

	public void setNotificationTimeString(String notificationTimeString) {
		this.notificationTimeString = notificationTimeString;
	}

	public Boolean getReadIndex() {
		return readIndex;
	}

	public void setReadIndex(Boolean readIndex) {
		this.readIndex = readIndex;
	}
	
	
}
