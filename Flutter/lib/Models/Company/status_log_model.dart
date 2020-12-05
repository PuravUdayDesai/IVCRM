class StatusLogClass{
	int ticketStatusId;
	int ticketId;
	int statusId;
	String statusName;
	dynamic workProgress;
	String statusColorCode;
	String lastEditOn;
	int lastEditBy;

	StatusLogClass(
		this.ticketStatusId,
		this.ticketId,
		this.statusId,
		this.statusName,
		this.workProgress,
		this.statusColorCode,
		this.lastEditOn,
		this.lastEditBy
	);
}