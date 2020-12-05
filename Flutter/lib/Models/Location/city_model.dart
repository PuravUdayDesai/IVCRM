class CityClass {
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
  String cityDescription;
  String cityCode;

  CityClass.withIsActive(
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
      this.cityDescription,
      this.cityCode);
  
  CityClass.toPost(
    this.cityDescription,
      this.cityName,
      this.cityCode,
      this.countryID,
      this.stateID,
      this.deviceType,
      this.createdBy,
      this.createdOn
  );

  CityClass.toPut(
    this.cityName,
      this.cityCode,
      this.isActive,
      this.cityDescription,
      this.deviceType,
      this.countryID,
      this.stateID,
      this.lastEditDeviceType,
      this.lastEditBy,
      this.lastEditOn
  );
 
  Map<String, dynamic> toMap() {
    Map<String, dynamic> data = new Map<String, dynamic>();
    data['cityDescription'] = this.cityDescription;
    data['cityName'] = this.cityName;
    data['cityCode'] = this.cityCode;
    data['countryID'] = this.countryID;
    data['stateID'] = this.stateID;
    data['deviceType'] = this.deviceType;
    data['createdBy'] = this.createdBy;
    data['createdOn'] = this.createdOn;
    return data;
  }


  Map<String, dynamic> toMapPut() {
    Map<String, dynamic> data = new Map<String, dynamic>();
    data['cityName'] = this.cityName;
    data['cityCode'] = this.cityCode;
    data['isActive'] = this.isActive;
    data['cityDescription'] = this.cityDescription;
    data['deviceType'] = this.deviceType;
    data['countryID'] = this.countryID;
    data['stateID'] = this.stateID;
    data['lastEditDeviceType'] = this.lastEditDeviceType;
    data['lastEditBy'] = this.lastEditBy;
    data['lastEditOn'] = this.lastEditOn;
    return data;
  }
}