class StateDClass {
  String stateCode;
  int countryID;
  int stateID;
  String createdOn;
  int createdBy;
  int deviceType;
  String lastEditOn;
  int lastEditBy;
  int lastEditDeviceType;
  bool isActive;
  String countryName;
  String stateName;
  String stateDescription;




  StateDClass.withIsActive(
    this.stateCode,
      this.countryID,
      this.stateID,
      this.createdOn,
      this.createdBy,
      this.deviceType,
      this.lastEditOn,
      this.lastEditBy,
      this.lastEditDeviceType,
      this.isActive,
      this.countryName,
      this.stateName,
      this.stateDescription);

  StateDClass(
    this.stateDescription,
      this.stateName,
      this.stateCode,
      this.deviceType,
      this.createdBy,
      this.createdOn,
      this.countryID);

  StateDClass.toPut(
    this.stateName,
      this.stateCode,
      this.isActive,
      this.stateDescription,
      this.deviceType,
      this.countryID,
      this.lastEditDeviceType,
      this.lastEditBy,
      this.lastEditOn
  );

  

  Map toMap() {
    Map<String, dynamic> data = new Map<String, dynamic>();
    data['stateDescription'] = this.stateDescription;
    data['stateName'] = this.stateName;
    data['stateCode'] = this.stateCode;
    data['deviceType'] = this.deviceType;
    data['createdBy'] = this.createdBy;
    data['createdOn'] = this.createdOn;
    data['countryID'] = this.countryID;
    return data;
  }

  Map toMapPut() {
    Map<String, dynamic> data = new Map<String, dynamic>();
    data['stateName'] = this.stateName;
    data['stateCode'] = this.stateCode;
    data['isActive'] = this.isActive;
    data['stateDescription'] = this.stateDescription;
    data['deviceType'] = this.deviceType;
    data['countryID'] = this.countryID;
    data['lastEditDeviceType'] = this.lastEditDeviceType;
    data['lastEditBy'] = this.lastEditBy;
    data['lastEditOn'] = this.lastEditOn;
    return data;
  }


}