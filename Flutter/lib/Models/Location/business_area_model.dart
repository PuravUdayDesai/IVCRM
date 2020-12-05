class BusinessAreaClass{
	int businessAreaForCompanyID;
  int companyID;
  String cityName;
  String businessAreaName;
  String businessAreaCode;
  String businessAreaDescription;
  String lastEditOn;
  bool isActive;
  int lastEditBy;
  int deviceType;
  int lastEditDeviceType;
  int countryID;
  int stateID;
  int cityID;
  String companyName;
  String countryName;
  String stateName;
  String createdOn;
  int createdBy;
  int businessAreaID;

  BusinessAreaClass.retrieve(
  	this.businessAreaForCompanyID,
      this.companyID,
      this.cityName,
      this.businessAreaName,
      this.businessAreaCode,
      this.businessAreaDescription,
      this.lastEditOn,
      this.isActive,
      this.lastEditBy,
      this.deviceType,
      this.lastEditDeviceType,
      this.countryID,
      this.stateID,
      this.cityID,
      this.companyName,
      this.countryName,
      this.stateName,
      this.createdOn,
      this.createdBy,
      this.businessAreaID
  );

  BusinessAreaClass.toPost(
  	this.companyID,
      this.countryID,
      this.stateID,
      this.businessAreaName,
      this.businessAreaCode,
      this.businessAreaDescription,
      this.isActive,
      this.deviceType,
      this.cityID,
      this.createdOn,
      this.createdBy
  );

  BusinessAreaClass.toPut(
    this.companyID,
      this.businessAreaName,
      this.businessAreaCode,
      this.businessAreaDescription,
      this.lastEditOn,
      this.isActive,
      this.lastEditBy,
      this.deviceType,
      this.lastEditDeviceType,
      this.countryID,
      this.stateID,
      this.cityID
  );


  Map<String, dynamic> toMap() {
    var data = new Map<String, dynamic>();
    data['companyID'] = this.companyID;
    data['countryID'] = this.countryID;
    data['stateID'] = this.stateID;
    data['areaName'] = this.businessAreaName;
    data['areaCode'] = this.businessAreaCode;
    data['areaDescription'] = this.businessAreaDescription;
    data['isActive'] = this.isActive;
    data['deviceType'] = this.deviceType;
    data['cityID'] = this.cityID;
    data['createdOn'] = this.createdOn;
    data['createdBy'] = this.createdBy;
    return data;
  }


  Map<String, dynamic> toMapPut() {
    var data = new Map<String, dynamic>();
    data['companyID'] = this.companyID;
    data['areaName'] = this.businessAreaName;
    data['areaCode'] = this.businessAreaCode;
    data['areaDescription'] = this.businessAreaDescription;
    data['lastEditOn'] = this.lastEditOn;
    data['isActive'] = this.isActive;
    data['lastEditBy'] = this.lastEditBy;
    data['deviceType'] = this.deviceType;
    data['lastEditDeviceType'] = this.lastEditDeviceType;
    data['countryID'] = this.countryID;
    data['stateID'] = this.stateID;
    data['cityID'] = this.cityID;
    return data;
  }

}