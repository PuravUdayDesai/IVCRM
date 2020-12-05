class CompanyAreaClass {
  int companyAreaID;
  String companyAreaName;
  String companyAreaCode;
  String companyAreaDescription;
  int companyID;
  String companyName;
  String companyCode;
  int companyRegionId;
  String companyRegionName;
  String companyRegionCode;
  bool isActive;
  String createdOn;
  int createdBy;
  int createdDeviceType;
  String lastEditOn;
  int lastEditBy;
  int lastEditDeviceType;

  CompanyAreaClass.retrieve(
    this.companyAreaID,
      this.companyAreaName,
      this.companyAreaCode,
      this.companyAreaDescription,
      this.companyID,
      this.companyName,
      this.companyCode,
      this.companyRegionId,
      this.companyRegionName,
      this.companyRegionCode,
      this.isActive
  );

  CompanyAreaClass.toPost(
    this.companyAreaName,
      this.companyAreaCode,
      this.companyAreaDescription,
      this.companyID,
      this.companyRegionId,
      this.createdOn,
      this.createdBy,
      this.createdDeviceType
  );

  CompanyAreaClass.toPut(
    this.companyAreaName,
      this.companyAreaCode,
      this.companyAreaDescription,
      this.companyID,
      this.companyRegionId,
      this.lastEditOn,
      this.lastEditBy,
      this.lastEditDeviceType
  );

  Map<String, dynamic> toMap() {
    Map<String, dynamic> data = new Map<String, dynamic>();
    data['companyAreaName'] = this.companyAreaName;
    data['companyAreaCode'] = this.companyAreaCode;
    data['companyAreaDescription'] = this.companyAreaDescription;
    data['companyID'] = this.companyID;
    data['companyRegionID'] = this.companyRegionId;
    data['createdOn'] = this.createdOn;
    data['createdBy'] = this.createdBy;
    data['createdDeviceType'] = this.createdDeviceType;
    return data;
  }

  Map<String, dynamic> toMapPut() {
    Map<String, dynamic> data = new Map<String, dynamic>();
    data['companyAreaName'] = this.companyAreaName;
    data['companyAreaCode'] = this.companyAreaCode;
    data['companyAreaDescription'] = this.companyAreaDescription;
    data['companyID'] = this.companyID;
    data['companyRegionID'] = this.companyRegionId;
    data['lastEditOn'] = this.lastEditOn;
    data['lastEditBy'] = this.lastEditBy;
    data['lastEditDeviceType'] = this.lastEditDeviceType;
    return data;
  } 
}