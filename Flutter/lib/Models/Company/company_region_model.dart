class CompanyRegionClass {
  int companyRegionID;
  String companyRegionName;
  String companyRegionCode;
  String companyRegionDescription;
  int companyID;
  String companyName;
  String companyCode;
  bool isActive;
  String createdOn;
  int createdBy;
  int createdDeviceType;
  String lastEditOn;
  int lastEditBy;
  int lastEditDeviceType;

  CompanyRegionClass.retrieve(
    this.companyRegionID,
      this.companyRegionName,
      this.companyRegionCode,
      this.companyRegionDescription,
      this.companyID,
      this.companyName,
      this.companyCode,
      this.isActive
  );

  CompanyRegionClass.toPost(
    this.companyRegionName,
      this.companyRegionCode,
      this.companyRegionDescription,
      this.companyID,
      this.createdOn,
      this.createdBy,
      this.createdDeviceType
  );

  CompanyRegionClass.toPut(
    this.companyRegionName,
      this.companyRegionCode,
      this.companyRegionDescription,
      this.companyID,
      this.lastEditOn,
      this.lastEditBy,
      this.lastEditDeviceType
  );


  Map<String, dynamic> toMap() {
    Map<String, dynamic> data = new Map<String, dynamic>();
    data['companyRegionName'] = this.companyRegionName;
    data['companyRegionCode'] = this.companyRegionCode;
    data['companyRegionDescription'] = this.companyRegionDescription;
    data['companyID'] = this.companyID;
    data['createdOn'] = this.createdOn;
    data['createdBy'] = this.createdBy;
    data['createdDeviceType'] = this.createdDeviceType;
    return data;
  }

  

  Map<String, dynamic> toMapPut() {
    Map<String, dynamic> data = new Map<String, dynamic>();
    data['companyRegionName'] = this.companyRegionName;
    data['companyRegionCode'] = this.companyRegionCode;
    data['companyRegionDescription'] = this.companyRegionDescription;
    data['companyID'] = this.companyID;
    data['lastEditOn'] = this.lastEditOn;
    data['lastEditBy'] = this.lastEditBy;
    data['lastEditDeviceType'] = this.lastEditDeviceType;
    return data;
  }
}