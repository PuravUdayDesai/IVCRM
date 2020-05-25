package ivgroup.master.database.dto.notification;

import java.sql.Timestamp;

import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonFormat;

public class NotificationInsert {
	
	@NotNull(message="CompanyExecutiveID cannot be null")
	Long CompanyExecutiveID;
	
	@NotNull(message="CompanyExecutiveName cannot be null")
	String CompanyExecutiveName;
	
	@NotNull(message="NotificationSubject cannot be null")
	String NotificationSubject;
	
	@NotNull(message="NotificationDescription cannot be null")
	String NotificationDescription;
	
	@NotNull(message = "NotificationTime cannot be null")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	Timestamp NotificationTime;

	public Long getCompanyExecutiveID() {
		return CompanyExecutiveID;
	}

	public void setCompanyExecutiveID(Long companyExecutiveID) {
		CompanyExecutiveID = companyExecutiveID;
	}

	public String getCompanyExecutiveName() {
		return CompanyExecutiveName;
	}

	public void setCompanyExecutiveName(String companyExecutiveName) {
		CompanyExecutiveName = companyExecutiveName;
	}

	public String getNotificationSubject() {
		return NotificationSubject;
	}

	public void setNotificationSubject(String notificationSubject) {
		NotificationSubject = notificationSubject;
	}

	public String getNotificationDescription() {
		return NotificationDescription;
	}

	public void setNotificationDescription(String notificationDescription) {
		NotificationDescription = notificationDescription;
	}

	public Timestamp getNotificationTime() {
		return NotificationTime;
	}

	public void setNotificationTime(Timestamp notificationTime) {
		NotificationTime = notificationTime;
	}

	public NotificationInsert(
			@NotNull(message = "CompanyExecutiveID cannot be null") Long companyExecutiveID,
			@NotNull(message = "CompanyExecutiveName cannot be null") String companyExecutiveName,
			@NotNull(message = "NotificationSubject cannot be null") String notificationSubject,
			@NotNull(message = "NotificationDescription cannot be null") String notificationDescription,
			@NotNull(message = "NotificationTime cannot be null") Timestamp notificationTime) {
		super();
		CompanyExecutiveID = companyExecutiveID;
		CompanyExecutiveName = companyExecutiveName;
		NotificationSubject = notificationSubject;
		NotificationDescription = notificationDescription;
		NotificationTime = notificationTime;
	}
	
	public NotificationInsert() {}
}
