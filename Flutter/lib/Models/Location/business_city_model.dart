class BusinessCityClass{
	int businessCityForCompanyID;
  int companyID;
  String cityName;
  String cityCode;
  String cityDescription;
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

  BusinessCityClass.retrieve(
  	this.businessCityForCompanyID,
      this.companyID,
      this.cityName,
      this.cityCode,
      this.cityDescription,
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
      this.createdBy
  	);

  BusinessCityClass.toPost(
  	this.companyID,
      this.cityName,
      this.cityCode,
      this.cityDescription,
      this.isActive,
      this.deviceType,
      this.countryID,
      this.stateID,
      this.createdOn,
      this.createdBy
  );

  BusinessCityClass.toPut(
  	this.cityName,
      this.cityCode,
      this.cityDescription,
      this.isActive,
      this.deviceType,
      this.countryID,
      this.stateID,
      this.lastEditOn,
      this.lastEditBy,
      this.lastEditDeviceType
  );

  Map<String, dynamic> toMap() {
    var data = new Map<String, dynamic>();
    data['companyID'] = this.companyID;
    data['cityName'] = this.cityName;
    data['cityCode'] = this.cityCode;
    data['cityDescription'] = this.cityDescription;
    data['isActive'] = this.isActive;
    data['deviceType'] = this.deviceType;
    data['countryID'] = this.countryID;
    data['stateID'] = this.stateID;
    data['createdOn'] = this.createdOn;
    data['createdBy'] = this.createdBy;
    return data;
  }

  Map<String, dynamic> toPut() {
    var data = new Map<String, dynamic>();
    data['cityName'] = this.cityName;
    data['cityCode'] = this.cityCode;
    data['cityDescription'] = this.cityDescription;
    data['isActive'] = this.isActive;
    data['deviceType'] = this.deviceType;
    data['countryID'] = this.countryID;
    data['stateID'] = this.stateID;
    data['lastEditOn'] = this.lastEditOn;
    data['lastEditBy'] = this.lastEditBy;
    data['lastEditDeviceType'] = this.lastEditDeviceType;
    return data;
  }
}