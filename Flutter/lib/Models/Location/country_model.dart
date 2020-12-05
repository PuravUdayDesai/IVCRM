class CountryClass {
  int id,createdBy,lastEditBy,deviceType,lastEditDeviceType;
  String country_code, country_name,country_description,lastEditOn,createdOn;
  bool isActive;

  CountryClass( this.country_description,this.country_name,this.country_code,this.deviceType,this.createdBy,this.createdOn);
    

  CountryClass.toPut(this.country_name,
      this.country_code,
      this.country_description,
      this.deviceType,
      this.isActive,
      this.lastEditDeviceType,
      this.lastEditBy,
      this.lastEditOn);

  CountryClass.withIsActive(this.id, this.country_code, this.country_name,this.country_description,
    this.createdOn,this.lastEditOn,this.createdBy,this.lastEditBy,
    this.deviceType,this.lastEditDeviceType,this.isActive);

  factory CountryClass.fromJson(Map<String, dynamic> json) {
    print("here");
    print(json);
    String country1 = json["city_name"];
    String countrycode1 = "demo       text";
    //return CountryClass(0, country1, countrycode1);
  }
  Map toMap() {
    Map<String, dynamic> data = new Map<String, dynamic>();
    data['countryDescription'] = this.country_description;
    data['countryName'] = this.country_name;
    data['countryCode'] = this.country_code;
    data['deviceType'] = this.deviceType;
    data['createdBy'] = this.createdBy;
    data['createdOn'] = this.createdOn;
    return data;
  }

  Map toPutMap(){
    var map = new Map<String,dynamic>();
    map["countryName"] = country_name;
    map["countryCode"] = country_code;
    map["countryDescription"] = country_description;
    map["lastEditOn"] = lastEditOn;
    map["lastEditBy"] = lastEditBy;
    map["deviceType"] = deviceType;
    map["lastEditDeviceType"] = lastEditDeviceType;
    map["isActive"] = isActive;
    return map;
  }

}