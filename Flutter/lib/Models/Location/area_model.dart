
class AreaClass {
  String businessAreaName;
  String businessAreaCode;
  String businessAreaDescription;
  int countryID;
  int stateID;
  int cityID;
  String createdOn;
  int createdBy;
  int deviceType;
  String lastEditOn;
  int lastEditBy;
  int lastEditDeviceType;
  bool isActive;
  String cityName;
  String countryName;
  String stateName;
  int businessAreaID;


  

  AreaClass.retrieve(
    this.businessAreaName,
      this.businessAreaCode,
      this.businessAreaDescription,
      this.countryID,
      this.stateID,
      this.cityID,
      this.createdOn,
      this.createdBy,
      this.deviceType,
      this.lastEditOn,
      this.lastEditBy,
      this.lastEditDeviceType,
      this.isActive,
      this.cityName,
      this.countryName,
      this.stateName,
      this.businessAreaID);

  AreaClass.toPost(
    this.businessAreaDescription,
      this.businessAreaName,
      this.businessAreaCode,
      this.countryID,
      this.stateID,
      this.cityID,
      this.deviceType,
      this.createdBy,
      this.createdOn);


  AreaClass.toPut(
    this.businessAreaName,
      this.businessAreaCode,
      this.isActive,
      this.businessAreaDescription,
      this.deviceType,
      this.countryID,
      this.stateID,
      this.cityID,
      this.lastEditDeviceType,
      this.lastEditBy,
      this.lastEditOn);

  Map<String, dynamic> toMap() {
    Map<String, dynamic> data = new Map<String, dynamic>();
    data['businessAreaDescription'] = this.businessAreaDescription;
    data['businessAreaName'] = this.businessAreaName;
    data['businessAreaCode'] = this.businessAreaCode;
    data['countryID'] = this.countryID;
    data['stateID'] = this.stateID;
    data['cityID'] = this.cityID;
    data['deviceType'] = this.deviceType;
    data['createdBy'] = this.createdBy;
    data['createdOn'] = this.createdOn;
    return data;
  }

  Map<String, dynamic> toMapPut() {
    Map<String, dynamic> data = new Map<String, dynamic>();
    data['businessAreaName'] = this.businessAreaName;
    data['businessAreaCode'] = this.businessAreaCode;
    data['isActive'] = this.isActive;
    data['businessAreaDescription'] = this.businessAreaDescription;
    data['deviceType'] = this.deviceType;
    data['countryID'] = this.countryID;
    data['stateID'] = this.stateID;
    data['lastEditDeviceType'] = this.lastEditDeviceType;
    data['lastEditBy'] = this.lastEditBy;
    data['lastEditOn'] = this.lastEditOn;
    return data;
  }

  
}