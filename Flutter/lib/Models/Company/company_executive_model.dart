class CompanyExecutiveClass {
  String executiveId;
  String executiveName;
  String loginID;
  String password;
  int companyBranchID;
  String companyBranchName;
  String companyBranchCode;
  int cityID;
  String cityName;
  int companyID;
  String companyName;
  String companyCode;
  String contactNumber;
  bool isActive;
  String createdOn;
  int createdBy;
  int createdDeviceType;
  String lastEditOn;
  int lastEditBy;
  int lastEditDeviceType;
  int positionId;
  

  CompanyExecutiveClass.retrieve(
    this.executiveId,
      this.executiveName,
      this.loginID,
      this.password,
      this.companyBranchID,
      this.companyBranchName,
      this.companyBranchCode,
      this.cityID,
      this.cityName,
      this.companyID,
      this.companyName,
      this.companyCode,
      this.contactNumber,
      this.isActive,
      this.positionId
  );

  CompanyExecutiveClass.toPost(
    this.executiveName,
      this.loginID,
      this.password,
      this.companyBranchID,
      this.cityID,
      this.companyID,
      this.contactNumber,
      this.createdOn,
      this.createdBy,
      this.createdDeviceType
  );

  CompanyExecutiveClass.toPut(
    this.executiveName,
      this.loginID,
      this.companyBranchID,
      this.cityID,
      this.companyID,
      this.contactNumber,
      this.lastEditOn,
      this.lastEditBy,
      this.lastEditDeviceType
  );

  Map<String, dynamic> toMap() {
    Map<String, dynamic> data = new Map<String, dynamic>();
    data['executiveName'] = this.executiveName;
    data['loginId'] = this.loginID;
    data['password'] = this.password;
    data['companyBranchId'] = this.companyBranchID;
    data['baseCityId'] = this.cityID;
    data['companyId'] = this.companyID;
    data['contactNumber'] = this.contactNumber;
    data['createdOn'] = this.createdOn;
    data['createdBy'] = this.createdBy;
    data['createdDeviceType'] = this.createdDeviceType;
    return data;
  }

  Map<String, dynamic> toMapPut() {
    Map<String, dynamic> data = new Map<String, dynamic>();
    data['executiveName'] = this.executiveName;
    data['loginId'] = this.loginID;
    data['companyBranchId'] = this.companyBranchID;
    data['baseCityId'] = this.cityID;
    data['companyId'] = this.companyID;
    data['contactNumber'] = this.contactNumber;
    data['lastEditOn'] = this.lastEditOn;
    data['lastEditBy'] = this.lastEditBy;
    data['lastEditDeviceType'] = this.lastEditDeviceType;
    return data;
  } 
}