class StatusClass{
	int statusId;
  String statusName;
  String statusColorCode;
  double workProgress;
  int companyId;
  String companyName;
  int createdBy;
  String createdOn;
  int lastEditBy;
  String lastEditOn;


  StatusClass.retrieve(
  	this.statusId,
      this.statusName,
      this.statusColorCode,
      this.workProgress,
      this.companyId,
      this.companyName,
      this.createdBy,
      this.createdOn,
      this.lastEditBy,
      this.lastEditOn
  );

  StatusClass.toPost(
  	this.statusName,
      this.statusColorCode,
      this.workProgress,
      this.companyId,
      this.createdBy,
      this.createdOn
  );

  StatusClass.toPut(
  	this.statusName,
      this.statusColorCode,
      this.workProgress,
      this.companyId,
      this.lastEditBy,
      this.lastEditOn
  );

  Map<String, dynamic> toMap() {
    var data = new Map<String, dynamic>();
    data['statusName'] = this.statusName;
    data['statusColorCode'] = this.statusColorCode;
    data['workProgress'] = this.workProgress;
    data['companyId'] = this.companyId;
    data['createdBy'] = this.createdBy;
    data['createdOn'] = this.createdOn;
    return data;
  }

  Map<String, dynamic> toPut() {
    var data = new Map<String, dynamic>();
    data['statusName'] = this.statusName;
    data['statusColorCode'] = this.statusColorCode;
    data['workProgress'] = this.workProgress;
    data['companyId'] = this.companyId;
    data['lastEditBy'] = this.lastEditBy;
    data['lastEditOn'] = this.lastEditOn;
    return data;
  }
}