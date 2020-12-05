import 'enquiry_product_model.dart';
class EnquiryClass{
	int companyId;
  String enquiryRemarks;
  int enquiryType;
  int clientId;
  int countryId;
  int stateId;
  int cityId;
  int areaId;
  String addressLine1;
  String addressLine2;
  String addressLine3;
  String pincode;
  String latitude;
  String longitude;
  int statusId;
  String startDateAndTime;
  String deadlineDateAndTime;
  int prioirty;
  List<int> productId;
  int createdBy;
  String createdOn;
  int enquiryAccessListId;
  int enquiryId;
  String companyName;
  String enquiryTypeName;
  int enquiryLocationId;
  String countryName;
  String stateName;
  String cityName;
  String areaName;
  int enquiryClientId;
  String clientName;
  String contactPerson;
  String emailId;
  String contactNumber;
  List<EnquiryProductClass> enquiryProductList;
  int lastEditBy;
  String lastEditOn;
  String ticketRemarks;
  int priorityId;
  int singleProductId;


  EnquiryClass.retrieve(
    this.enquiryAccessListId,
      this.enquiryId,
      this.companyId,
      this.companyName,
      this.enquiryRemarks,
      this.enquiryType,
      this.enquiryTypeName,
      this.enquiryLocationId,
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
      this.startDateAndTime,
      this.deadlineDateAndTime,
      this.enquiryClientId,
      this.clientId,
      this.clientName,
      this.contactPerson,
      this.emailId,
      this.contactNumber,
      this.enquiryProductList,
      this.createdBy,
      this.createdOn,
      this.lastEditBy,
      this.lastEditOn
  );
  EnquiryClass.toPost(
  	this.companyId,
      this.enquiryRemarks,
      this.enquiryType,
      this.clientId,
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
      this.statusId,
      this.startDateAndTime,
      this.deadlineDateAndTime,
      this.prioirty,
      this.productId,
      this.createdBy,
      this.createdOn
  );

  EnquiryClass.toPostEnquiryProduct(
    this.enquiryId,
      this.singleProductId,
      this.statusId,
      this.ticketRemarks,
      this.priorityId,
      this.createdBy,
      this.createdOn
  );

  

  EnquiryClass.toPut(
    this.clientId,
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
      this.enquiryRemarks,
      this.enquiryType,
      this.lastEditBy,
      this.lastEditOn
  );

  Map<String, dynamic> toMap() {
    var data = new Map<String, dynamic>();
    data['companyId'] = this.companyId;
    data['enquiryRemarks'] = this.enquiryRemarks;
    data['enquiryType'] = this.enquiryType;
    data['clientId'] = this.clientId;
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
    data['statusId'] = this.statusId;
    data['startDateAndTime'] = this.startDateAndTime;
    data['deadlineDateAndTime'] = this.deadlineDateAndTime;
    data['prioirty'] = this.prioirty;
    data['productId'] = this.productId;
    data['createdBy'] = this.createdBy;
    data['createdOn'] = this.createdOn;
    return data;
  }

  Map<String, dynamic> toMapEnquiryProduct() {
    var data = new Map<String, dynamic>();
    data['enquiryId'] = this.enquiryId;
    data['productId'] = this.singleProductId;
    data['statusId'] = this.statusId;
    data['ticketRemarks'] = this.ticketRemarks;
    data['priorityId'] = this.priorityId;
    data['createdBy'] = this.createdBy;
    data['createdOn'] = this.createdOn;
    return data;
  }

  Map<String, dynamic> toMapPut() {
    var data = new Map<String, dynamic>();
    data['clientId'] = this.clientId;
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
    data['enquiryRemarks'] = this.enquiryRemarks;
    data['enquiryType'] = this.enquiryType;
    data['lastEditBy'] = this.lastEditBy;
    data['lastEditOn'] = this.lastEditOn;
    return data;
  }
}