class CompanyBranchClass
{
  String latitude;
  String longitude;
  int companyAreaID;
  String pincode;
  String addressLine1;
  String addressLine2;
  String addressLine3;
  String executiveName;
  String contactNumber;
  String companyAreaCode;
  String companyAreaName;
  int companyRegionID;
  int companyBranchID;
  int executiveId;
  bool isActive;
  String companyCode;
  int companyId;
  String companyName;
  int stateID;
  int countryID;
  int cityID;
  String companyBranchName;
  String companyBranchCode;
  int companyBranchType;
  String companyRegionCode;
  String companyRegionName;
  String cityName;
  String loginID;
  String password;
  int createdBy;
  int deviceType;
  String createdOn;
  int companyBranchAddressDetailsId;
   String lastEditOn;
  int lastEditBy;
  int lastEditDeviceType;

  CompanyBranchClass.retrieve(
    this.companyBranchAddressDetailsId,
    this.latitude,
      this.longitude,
      this.companyAreaID,
      this.pincode,
      this.addressLine1,
      this.addressLine2,
      this.addressLine3,
      this.executiveName,
      this.contactNumber,
      this.companyAreaCode,
      this.companyAreaName,
      this.companyRegionID,
      this.companyBranchID,
      this.executiveId,
      this.isActive,
      this.companyCode,
      this.companyId,
      this.companyName,
      this.stateID,
      this.countryID,
      this.cityID,
      this.companyBranchName,
      this.companyBranchCode,
      this.companyBranchType,
      this.companyRegionCode,
      this.companyRegionName,
      this.cityName
  );

  CompanyBranchClass.toPost(
    this.addressLine1,
      this.addressLine2,
      this.addressLine3,
      this.pincode,
      this.cityID,
      this.stateID,
      this.countryID,
      this.latitude,
      this.longitude,
      this.companyId,
      this.companyRegionID,
      this.companyAreaID,
      this.companyBranchName,
      this.companyBranchCode,
      this.companyBranchType,
      this.executiveName,
      this.loginID,
      this.password,
      this.contactNumber,
      this.createdOn,
      this.createdBy,
      this.deviceType
  );

  CompanyBranchClass.toPut(
    this.companyId,
      this.companyRegionID,
      this.companyAreaID,
      this.companyBranchName,
      this.companyBranchCode,
      this.companyBranchType,
      this.executiveId,
      this.companyBranchAddressDetailsId,
      this.lastEditOn,
      this.lastEditBy,
      this.lastEditDeviceType
  );

  Map<String, dynamic> toMap() {
    var data = new Map<String, dynamic>();
    data['addressLine1'] = this.addressLine1;
    data['addressLine2'] = this.addressLine2;
    data['addressLine3'] = this.addressLine3;
    data['pincode'] = this.pincode;
    data['cityID'] = this.cityID;
    data['stateID'] = this.stateID;
    data['countryID'] = this.countryID;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['companyId'] = this.companyId;
    data['companyRegionId'] = this.companyRegionID;
    data['companyAreaId'] = this.companyAreaID;
    data['companyBranchName'] = this.companyBranchName;
    data['companyBranchCode'] = this.companyBranchCode;
    data['companyBranchType'] = this.companyBranchType;
    data['executiveName'] = this.executiveName;
    data['loginID'] = this.loginID;
    data['password'] = this.password;
    data['contactNumber'] = this.contactNumber;
    data['createdOn'] = this.createdOn;
    data['createdBy'] = this.createdBy;
    data['deviceType'] = this.deviceType;
    return data;
  }

  Map<String, dynamic> toMapPut() {
    var data = new Map<String, dynamic>();
    data['companyId'] = this.companyId;
    data['companyRegionId'] = this.companyRegionID;
    data['companyAreaId'] = this.companyAreaID;
    data['companyBranchName'] = this.companyBranchName;
    data['companyBranchCode'] = this.companyBranchCode;
    data['companyBranchType'] = this.companyBranchType;
    data['companyBranchPrimaryContact'] = this.executiveId;
    data['companyBranchAddress'] = this.companyBranchAddressDetailsId;
    data['lastEditOn'] = this.lastEditOn;
    data['lastEditBy'] = this.lastEditBy;
    data['lastEditDeviceType'] = this.lastEditDeviceType;
    return data;
  }
}