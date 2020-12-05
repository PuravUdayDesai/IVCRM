//112->3->11
class CompanyClass {
  int companyId;
  String companyCode;
  String companyName;
  int ownerContactId;
  int companyAddressId;
  String addressLine1;
  String addressLine2;
  String addressLine3;
  String pincode;
  int cityId;
  String cityName;
  int stateId;
  int countryId;
  String latitude;
  String longitude;
  bool isActive;
  String companyRegionName;
  String companyRegionCode;
  String companyRegionDescription;
  String companyAreaName;
  String companyAreaCode;
  String companyAreaDescription;
  String companyBranchName;
  String companyBranchCode;
  int companyBranchType;
  String executiveName;
  String loginID;
  String password;
  String contactNumber;
  String createdOn;
  int createdBy;
  int deviceType;
  String lastEditOn;
  int lastEditBy;
  int lastEditDeviceType;
  String companyBranchTypeName;
  int companyBranchPosition;
  String positionName;
  int positionPriority;
  String companyGrant;
  String companyBranchGrant;
  String companyExecutiveGrant;
  String clientGrant;
  String productGrant;
  String locationGrant;
  String enquiryGrant;
  String ticketGrant;
  String positionGrant;

  CompanyClass.toPost(
      this.addressLine1,
      this.addressLine2,
      this.addressLine3,
      this.pincode,
      this.cityId,
      this.stateId,
      this.countryId,
      this.latitude,
      this.longitude,
      this.companyCode,
      this.companyName,
      this.ownerContactId,
      this.companyRegionName,
      this.companyRegionCode,
      this.companyRegionDescription,
      this.companyAreaName,
      this.companyAreaCode,
      this.companyAreaDescription,
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


  CompanyClass.toPostWithNewCompanyBranchType(
    this.addressLine1,
      this.addressLine2,
      this.addressLine3,
      this.pincode,
      this.cityId,
      this.stateId,
      this.countryId,
      this.latitude,
      this.longitude,
      this.companyCode,
      this.companyName,
      this.ownerContactId,
      this.companyRegionName,
      this.companyRegionCode,
      this.companyRegionDescription,
      this.companyAreaName,
      this.companyAreaCode,
      this.companyAreaDescription,
      this.companyBranchName,
      this.companyBranchCode,
      this.companyBranchTypeName,
      this.companyBranchPosition,
      this.executiveName,
      this.loginID,
      this.password,
      this.contactNumber,
      this.createdOn,
      this.createdBy,
      this.deviceType
  );
  CompanyClass.toPostWithNewPosition(
    this.addressLine1,
      this.addressLine2,
      this.addressLine3,
      this.pincode,
      this.cityId,
      this.stateId,
      this.countryId,
      this.latitude,
      this.longitude,
      this.companyCode,
      this.companyName,
      this.ownerContactId,
      this.companyRegionName,
      this.companyRegionCode,
      this.companyRegionDescription,
      this.companyAreaName,
      this.companyAreaCode,
      this.companyAreaDescription,
      this.companyBranchName,
      this.companyBranchCode,
      this.companyBranchType,
      this.executiveName,
      this.loginID,
      this.password,
      this.contactNumber,
      this.positionName,
      this.positionPriority,
      this.companyGrant,
      this.companyBranchGrant,
      this.companyExecutiveGrant,
      this.clientGrant,
      this.productGrant,
      this.locationGrant,
      this.enquiryGrant,
      this.ticketGrant,
      this.positionGrant,
      this.createdOn,
      this.createdBy,
      this.deviceType
  );

  CompanyClass.toPostWithNewPositionAndCompanyBranchType(
    this.addressLine1,
      this.addressLine2,
      this.addressLine3,
      this.pincode,
      this.cityId,
      this.stateId,
      this.countryId,
      this.latitude,
      this.longitude,
      this.companyCode,
      this.companyName,
      this.ownerContactId,
      this.companyRegionName,
      this.companyRegionCode,
      this.companyRegionDescription,
      this.companyAreaName,
      this.companyAreaCode,
      this.companyAreaDescription,
      this.companyBranchName,
      this.companyBranchCode,
      this.companyBranchTypeName,
      this.companyBranchPosition,
      this.executiveName,
      this.loginID,
      this.password,
      this.contactNumber,
      this.positionName,
      this.positionPriority,
      this.companyGrant,
      this.companyBranchGrant,
      this.companyExecutiveGrant,
      this.clientGrant,
      this.productGrant,
      this.locationGrant,
      this.enquiryGrant,
      this.ticketGrant,
      this.positionGrant,
      this.createdOn,
      this.createdBy,
      this.deviceType
  );

  CompanyClass.retrive(
      this.companyId,
      this.companyCode,
      this.companyName,
      this.ownerContactId,
      this.companyAddressId,
      this.addressLine1,
      this.addressLine2,
      this.addressLine3,
      this.pincode,
      this.cityId,
      this.cityName,
      this.stateId,
      this.countryId,
      this.latitude,
      this.longitude,
      this.isActive);

  CompanyClass.toPut(
    this.cityId,
      this.companyCode,
      this.companyName,
      this.ownerContactId,
      this.isActive,
      this.lastEditOn,
      this.lastEditBy,
      this.lastEditDeviceType
      );
  CompanyClass.toPut2(
    this.addressLine1,
      this.addressLine2,
      this.addressLine3,
      this.pincode,
      this.countryId,
      this.stateId,
      this.cityId,
      this.lastEditOn,
      this.lastEditBy,
      this.lastEditDeviceType
  );

    Map toMap() {
    Map<String, dynamic> data = new Map<String, dynamic>();
    data['cityId'] = this.cityId;
    data['companyCode'] = this.companyCode;
    data['companyName'] = this.companyName;
    data['ownerContactId'] = this.ownerContactId;
    data['isActive'] = this.isActive;
    data['lastEditOn'] = this.lastEditOn;
    data['lastEditBy'] = this.lastEditBy;
    data['lastEditDeviceType'] = this.lastEditDeviceType;
    return data;
  }

  Map toMap2() {
    Map<String, dynamic> data = new Map<String, dynamic>();
    data['addressLine1'] = this.addressLine1;
    data['addressLine2'] = this.addressLine2;
    data['addressLine3'] = this.addressLine3;
    data['pincode'] = this.pincode;
    data['countryId'] = this.countryId;
    data['stateId'] = this.stateId;
    data['cityId'] = this.cityId;
    data['lastEditOn'] = this.lastEditOn;
    data['lastEditBy'] = this.lastEditBy;
    data['lastEditDeviceType'] = this.lastEditDeviceType;
    return data;
  }

  Map toMap3() {
    Map<String, dynamic> data = new Map<String, dynamic>();
    data['addressLine1'] = this.addressLine1;
    data['addressLine2'] = this.addressLine2;
    data['addressLine3'] = this.addressLine3;
    data['pincode'] = this.pincode;
    data['cityId'] = this.cityId;
    data['stateId'] = this.stateId;
    data['countryId'] = this.countryId;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['companyCode'] = this.companyCode;
    data['companyName'] = this.companyName;
    data['ownerContactId'] = this.ownerContactId;
    data['companyRegionName'] = this.companyRegionName;
    data['companyRegionCode'] = this.companyRegionCode;
    data['companyRegionDescription'] = this.companyRegionDescription;
    data['companyAreaName'] = this.companyAreaName;
    data['companyAreaCode'] = this.companyAreaCode;
    data['companyAreaDescription'] = this.companyAreaDescription;
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

  Map<String, dynamic> toMapWithNewPosition() {
    var data = new Map<String, dynamic>();
    data['addressLine1'] = this.addressLine1;
    data['addressLine2'] = this.addressLine2;
    data['addressLine3'] = this.addressLine3;
    data['pincode'] = this.pincode;
    data['cityID'] = this.cityId;
    data['stateId'] = this.stateId;
    data['countryID'] = this.countryId;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['companyCode'] = this.companyCode;
    data['companyName'] = this.companyName;
    data['ownerContactId'] = this.ownerContactId;
    data['companyRegionName'] = this.companyRegionName;
    data['companyRegionCode'] = this.companyRegionCode;
    data['companyRegionDescription'] = this.companyRegionDescription;
    data['companyAreaName'] = this.companyAreaName;
    data['companyAreaCode'] = this.companyAreaCode;
    data['companyAreaDescription'] = this.companyAreaDescription;
    data['companyBranchName'] = this.companyBranchName;
    data['companyBranchCode'] = this.companyBranchCode;
    data['companyBranchType'] = this.companyBranchType;
    data['executiveName'] = this.executiveName;
    data['loginID'] = this.loginID;
    data['password'] = this.password;
    data['contactNumber'] = this.contactNumber;
    data['positionName'] = this.positionName;
    data['positionPriority'] = this.positionPriority;
    data['companyGrant'] = this.companyGrant;
    data['companyBranchGrant'] = this.companyBranchGrant;
    data['companyExecutiveGrant'] = this.companyExecutiveGrant;
    data['clientGrant'] = this.clientGrant;
    data['productGrant'] = this.productGrant;
    data['locationGrant'] = this.locationGrant;
    data['enquiryGrant'] = this.enquiryGrant;
    data['ticketGrant'] = this.ticketGrant;
    data['positionGrant'] = this.positionGrant;
    data['createdOn'] = this.createdOn;
    data['createdBy'] = this.createdBy;
    data['deviceType'] = this.deviceType;
    return data;
  }

  Map<String, dynamic> toMapWithNewCompanyBranchType() {
    var data = new Map<String, dynamic>();
    data['addressLine1'] = this.addressLine1;
    data['addressLine2'] = this.addressLine2;
    data['addressLine3'] = this.addressLine3;
    data['pincode'] = this.pincode;
    data['cityID'] = this.cityId;
    data['stateID'] = this.stateId;
    data['countryID'] = this.countryId;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['companyCode'] = this.companyCode;
    data['companyName'] = this.companyName;
    data['ownerContactId'] = this.ownerContactId;
    data['companyRegionName'] = this.companyRegionName;
    data['companyRegionCode'] = this.companyRegionCode;
    data['companyRegionDescription'] = this.companyRegionDescription;
    data['companyAreaName'] = this.companyAreaName;
    data['companyAreaCode'] = this.companyAreaCode;
    data['companyAreaDescription'] = this.companyAreaDescription;
    data['companyBranchName'] = this.companyBranchName;
    data['companyBranchCode'] = this.companyBranchCode;
    data['companyBranchTypeName'] = this.companyBranchTypeName;
    data['companyBranchPosition'] = this.companyBranchPosition;
    data['executiveName'] = this.executiveName;
    data['loginID'] = this.loginID;
    data['password'] = this.password;
    data['contactNumber'] = this.contactNumber;
    data['createdOn'] = this.createdOn;
    data['createdBy'] = this.createdBy;
    data['deviceType'] = this.deviceType;
    return data;
  }

  Map<String, dynamic> toMapWithNewPositionAndCompanyBranchType() {
    var data = new Map<String, dynamic>();
    data['addressLine1'] = this.addressLine1;
    data['addressLine2'] = this.addressLine2;
    data['addressLine3'] = this.addressLine3;
    data['pincode'] = this.pincode;
    data['cityID'] = this.cityId;
    data['stateID'] = this.stateId;
    data['countryID'] = this.countryId;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['companyCode'] = this.companyCode;
    data['companyName'] = this.companyName;
    data['ownerContactId'] = this.ownerContactId;
    data['companyRegionName'] = this.companyRegionName;
    data['companyRegionCode'] = this.companyRegionCode;
    data['companyRegionDescription'] = this.companyRegionDescription;
    data['companyAreaName'] = this.companyAreaName;
    data['companyAreaCode'] = this.companyAreaCode;
    data['companyAreaDescription'] = this.companyAreaDescription;
    data['companyBranchName'] = this.companyBranchName;
    data['companyBranchCode'] = this.companyBranchCode;
    data['companyBranchTypeName'] = this.companyBranchTypeName;
    data['companyBranchPosition'] = this.companyBranchPosition;
    data['executiveName'] = this.executiveName;
    data['loginID'] = this.loginID;
    data['password'] = this.password;
    data['contactNumber'] = this.contactNumber;
    data['positionName'] = this.positionName;
    data['positionPriority'] = this.positionPriority;
    data['companyGrant'] = this.companyGrant;
    data['companyBranchGrant'] = this.companyBranchGrant;
    data['companyExecutiveGrant'] = this.companyExecutiveGrant;
    data['clientGrant'] = this.clientGrant;
    data['productGrant'] = this.productGrant;
    data['locationGrant'] = this.locationGrant;
    data['enquiryGrant'] = this.enquiryGrant;
    data['ticketGrant'] = this.ticketGrant;
    data['positionGrant'] = this.positionGrant;
    data['createdOn'] = this.createdOn;
    data['createdBy'] = this.createdBy;
    data['deviceType'] = this.deviceType;
    return data;
  }
  
}
