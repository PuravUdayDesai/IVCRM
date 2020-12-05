class NotificationClass{
	int companyExecutiveID;
	String companyExecutiveName;
	int notificationID;
	String notificationSubject;
	String notificationDescription;
	String notificationTime;
	String notificationTimeString;
	bool readIndex;

	NotificationClass(
		this.companyExecutiveID,
		this.companyExecutiveName,
		this.notificationID,
		this.notificationSubject,
		this.notificationDescription,
		this.notificationTime,
		this.notificationTimeString,
		this.readIndex
	);
}