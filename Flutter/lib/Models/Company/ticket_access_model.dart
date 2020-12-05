class TicketAccessClass{
	int ticketAccessListId;
  int ticketId;
  int companyExecutiveId;
  String companyExecutiveName;
  bool ownerFlag;
  String accessApplicationTime;
  int companyId;
  String contactNumber;

  TicketAccessClass(
  	this.ticketAccessListId,
      this.ticketId,
      this.companyExecutiveId,
      this.companyExecutiveName,
      this.ownerFlag,
      this.accessApplicationTime
  );

  TicketAccessClass.remaining(
  	this.companyExecutiveId,
  	this.companyExecutiveName,
  	this.contactNumber,
  	this.companyId,
  );

}