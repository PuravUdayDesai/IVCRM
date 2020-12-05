class ClientClass{
	int clientId;
  String contactName;
  String contactPerson;
  String emailId;
  String contactNumber;
  int companyId;
  String companyName;
  int countryId;
  String countryName;
  int stateId;
  String stateName;
  int cityId;
  String cityName;
  int areaId;
  String areaName;
  String addressLine1;
  String addressLine2;
  String addressLine3;
  String pincode;
  String latitude;
  String longitude;
  String clientCreatedOn;
  int clientCreatedBy;
  String clientLastEditOn;
  int clientLastEditBy;
  bool clientIsActive;
  String clientLocationCreatedOn;
  int clientLocationCreatedBy;
  String clientLocationLastEditOn;
  int clientLocationLastEditBy;
  bool clientLocationIsActive;

  ClientClass.retrieve(
  	this.clientId,
      this.contactName,
      this.contactPerson,
      this.emailId,
      this.contactNumber,
      this.companyId,
      this.companyName,
      this.countryId,
      this.countryName,
      this.stateId,
      this.stateName,
      this.cityId,
      this.cityName,
      this.areaId,
      this.areaName,
      this.addressLine1,
      this.addressLine2,
      this.addressLine3,
      this.pincode,
      this.latitude,
      this.longitude,
      this.clientCreatedOn,
      this.clientCreatedBy,
      this.clientLastEditOn,
      this.clientLastEditBy,
      this.clientIsActive,
      this.clientLocationCreatedOn,
      this.clientLocationCreatedBy,
      this.clientLocationLastEditOn,
      this.clientLocationLastEditBy,
      this.clientLocationIsActive
  );

  ClientClass.toPost(
    this.contactName,
      this.contactPerson,
      this.emailId,
      this.contactNumber,
      this.companyId,
      this.countryId,
      this.stateId,
      this.cityId,
      this.areaId,
      this.addressLine1,
      this.addressLine2,
      this.addressLine3,
      this.pincode,
      this.latitude,
      this.longitude,
      this.clientCreatedOn,
      this.clientCreatedBy
  );

  ClientClass.toPut(
    this.contactName,
      this.contactPerson,
      this.emailId,
      this.contactNumber,
      this.companyId,
      this.countryId,
      this.stateId,
      this.cityId,
      this.areaId,
      this.addressLine1,
      this.addressLine2,
      this.addressLine3,
      this.pincode,
      this.latitude,
      this.longitude,
      this.clientLastEditOn,
      this.clientLastEditBy
  );

  Map<String, dynamic> toMap() {
    var data = new Map<String, dynamic>();
    data['contactName'] = this.contactName;
    data['contactPerson'] = this.contactPerson;
    data['emailId'] = this.emailId;
    data['contactNumber'] = this.contactNumber;
    data['companyId'] = this.companyId;
    data['countryId'] = this.countryId;
    data['stateId'] = this.stateId;
    data['cityId'] = this.cityId;
    data['areaId'] = this.areaId;
    data['addressLine1'] = this.addressLine1;
    data['addressLine2'] = this.addressLine2;
    data['addressLine3'] = this.addressLine3;
    data['pincode'] = this.pincode;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['createdOn'] = this.clientCreatedOn;
    data['createdBy'] = this.clientCreatedBy;
    return data;
  }

  Map<String, dynamic> toPut() {
    var data = new Map<String, dynamic>();
    data['contactName'] = this.contactName;
    data['contactPerson'] = this.contactPerson;
    data['emailId'] = this.emailId;
    data['contactNumber'] = this.contactNumber;
    data['companyId'] = this.companyId;
    data['countryId'] = this.countryId;
    data['stateId'] = this.stateId;
    data['cityId'] = this.cityId;
    data['areaId'] = this.areaId;
    data['addressLine1'] = this.addressLine1;
    data['addressLine2'] = this.addressLine2;
    data['addressLine3'] = this.addressLine3;
    data['pincode'] = this.pincode;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['lastEditOn'] = this.clientLastEditOn;
    data['lastEditBy'] = this.clientLastEditBy;
    return data;
  }
}