import 'followup_date_model.dart';

class TicketClass{
	int ticketId;
  int enquiryId;
  int ticketAccessId;
  int companyExecutiveId;
  String companyExecutiveName;
  String enquiryRemarks;
  String ticketRemarks;
  String startDateAndTime;
  String deadlineDateAndTime;
  int productId;
  String productName;
  int ticketType;
  String ticketTypeName;
  int ticketPriority;
  String ticketPriorityName;
  int companyId;
  String companyName;
  int statusId;
  String statusName;
  List<FollowupDateClass> followupDate;
  int createdBy;
  String createdOn;
  int lastEditBy;
  String lastEditOn;

  TicketClass.retrieve(
  	this.ticketId,
      this.enquiryId,
      this.ticketAccessId,
      this.companyExecutiveId,
      this.companyExecutiveName,
      this.enquiryRemarks,
      this.ticketRemarks,
      this.startDateAndTime,
      this.deadlineDateAndTime,
      this.productId,
      this.productName,
      this.ticketType,
      this.ticketTypeName,
      this.ticketPriority,
      this.ticketPriorityName,
      this.companyId,
      this.companyName,
      this.statusId,
      this.statusName,
      this.followupDate,
      this.createdBy,
      this.createdOn,
      this.lastEditBy,
      this.lastEditOn
  );

  TicketClass.toPut(
    this.ticketRemarks,
      this.startDateAndTime,
      this.deadlineDateAndTime,
      this.ticketPriority,
      this.lastEditBy,
      this.lastEditOn
  );

  Map<String, dynamic> toMapPut() {
    var data = new Map<String, dynamic>();
    data['ticketRemarks'] = this.ticketRemarks;
    data['startDateAndTime'] = this.startDateAndTime;
    data['deadlineDateAndTime'] = this.deadlineDateAndTime;
    data['ticketPriority'] = this.ticketPriority;
    data['lastEditBy'] = this.lastEditBy;
    data['lastEditOn'] = this.lastEditOn;
    return data;
  }
}