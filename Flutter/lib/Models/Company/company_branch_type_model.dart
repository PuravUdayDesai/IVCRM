class CompanyBranchTypeClass{
	int companyBranchTypeId;
  String companyBranchTypeName;
  int companyId;
  String companyName;
  int companyBranchPosition;
  int createdBy;
  String createdOn;
  String lastEditOn;
  int lastEditBy;

  CompanyBranchTypeClass.retrieve(
  	this.companyBranchTypeId,
      this.companyBranchTypeName,
      this.companyId,
      this.companyName,
      this.companyBranchPosition,
      this.createdBy,
      this.createdOn,
      this.lastEditOn,
      this.lastEditBy
  );

  CompanyBranchTypeClass.toPost(
  	this.companyBranchTypeName,
      this.companyId,
      this.companyBranchPosition,
      this.createdBy,
      this.createdOn
  );

  CompanyBranchTypeClass.toPut(
  	this.companyBranchTypeName,
      this.companyId,
      this.companyBranchPosition,
      this.lastEditBy,
      this.lastEditOn
  );

  Map<String, dynamic> toMap() {
    var data = new Map<String, dynamic>();
    data['companyBranchTypeName'] = this.companyBranchTypeName;
    data['companyId'] = this.companyId;
    data['companyBranchPosition'] = this.companyBranchPosition;
    data['createdBy'] = this.createdBy;
    data['createdOn'] = this.createdOn;
    return data;
  }

  Map<String, dynamic> toPut() {
    var data = new Map<String, dynamic>();
    data['companyBranchTypeName'] = this.companyBranchTypeName;
    data['companyId'] = this.companyId;
    data['companyBranchPosition'] = this.companyBranchPosition;
    data['lastEditBy'] = this.lastEditBy;
    data['lastEditOn'] = this.lastEditOn;
    return data;
  }

}