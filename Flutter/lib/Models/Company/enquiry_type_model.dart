class EnquiryTypeClass{
	int enquiryTypeId;
  String enquiryTypeName;
  String enquiryTypeColorCode;
  int companyId;
  String companyName;
  int createdBy;
  String createdOn;
  int lastEditBy;
  String lastEditOn;

  EnquiryTypeClass.retrieve(
  	this.enquiryTypeId,
      this.enquiryTypeName,
      this.enquiryTypeColorCode,
      this.companyId,
      this.companyName,
      this.createdBy,
      this.createdOn,
      this.lastEditBy,
      this.lastEditOn
  );

  EnquiryTypeClass.toPost(
  	this.enquiryTypeName,
      this.enquiryTypeColorCode,
      this.companyId,
      this.createdBy,
      this.createdOn
  );

  EnquiryTypeClass.toPut(
    this.enquiryTypeName,
      this.enquiryTypeColorCode,
      this.companyId,
      this.lastEditBy,
      this.lastEditOn
  );

  Map<String, dynamic> toMap() {
    var data = new Map<String, dynamic>();
    data['enquiryTypeName'] = this.enquiryTypeName;
    data['enquiryTypeColorCode'] = this.enquiryTypeColorCode;
    data['companyId'] = this.companyId;
    data['createdBy'] = this.createdBy;
    data['createdOn'] = this.createdOn;
    return data;
  }

  Map<String, dynamic> toPut() {
    var data = new Map<String, dynamic>();
    data['enquiryTypeName'] = this.enquiryTypeName;
    data['enquiryTypeColorCode'] = this.enquiryTypeColorCode;
    data['companyId'] = this.companyId;
    data['lastEditBy'] = this.lastEditBy;
    data['lastEditOn'] = this.lastEditOn;
    return data;
  }


}