class PositionClass{
	int positionId;
  String positionName;
  int positionPriority;
  int companyId;
  String companyName;
  int createdBy;
  String createdOn;
  int lastEditBy;
  String lastEditOn;
  bool isActive;
  String company;
  String companyBranch;
  String companyExecutive;
  String client;
  String product;
  String location;
  String enquiry;
  String ticket;
  String position;


  PositionClass.retrieve(
  	this.positionId,
      this.positionName,
      this.positionPriority,
      this.companyId,
      this.companyName,
      this.createdBy,
      this.createdOn,
      this.lastEditBy,
      this.lastEditOn,
      this.isActive,
      this.company,
      this.companyBranch,
      this.companyExecutive,
      this.client,
      this.product,
      this.location,
      this.enquiry,
      this.ticket,
      this.position
  );


  PositionClass.toPost(
    this.positionName,
      this.positionPriority,
      this.companyId,
      this.company,
      this.companyBranch,
      this.companyExecutive,
      this.client,
      this.product,
      this.location,
      this.enquiry,
      this.ticket,
      this.position,
      this.createdBy,
      this.createdOn
  );

  PositionClass.toPut(
    this.positionName,
      this.positionPriority,
      this.companyId,
      this.company,
      this.companyBranch,
      this.companyExecutive,
      this.client,
      this.product,
      this.location,
      this.enquiry,
      this.ticket,
      this.position,
      this.lastEditBy,
      this.lastEditOn
  );

    Map<String, dynamic> toMap() {
      var data = new Map<String, dynamic>();
      data['positionName'] = this.positionName;
      data['positionPriority'] = this.positionPriority;
      data['companyId'] = this.companyId;
      data['company'] = this.company;
      data['companyBranch'] = this.companyBranch;
      data['companyExecutive'] = this.companyExecutive;
      data['client'] = this.client;
      data['product'] = this.product;
      data['location'] = this.location;
      data['enquiry'] = this.enquiry;
      data['ticket'] = this.ticket;
      data['position'] = this.position;
      data['createdBy'] = this.createdBy;
      data['createdOn'] = this.createdOn;
      return data;
  }

  Map<String, dynamic> toPutMap() {
    var data = new Map<String, dynamic>();
    data['positionName'] = this.positionName;
    data['positionPriority'] = this.positionPriority;
    data['companyId'] = this.companyId;
    data['company'] = this.company;
    data['companyBranch'] = this.companyBranch;
    data['companyExecutive'] = this.companyExecutive;
    data['client'] = this.client;
    data['product'] = this.product;
    data['location'] = this.location;
    data['enquiry'] = this.enquiry;
    data['ticket'] = this.ticket;
    data['position'] = this.position;
    data['lastEditBy'] = this.lastEditBy;
    data['lastEditOn'] = this.lastEditOn;
    return data;
  }
}