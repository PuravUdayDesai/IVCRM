class EnquiryAccessClass{
	int enquiryAccessId;
  int enquiryId;
  int companyExecutiveId;
  String companyExecutiveName;
  String accessApplicationTime;
  bool ownerFlag;
  String contactNumber;
  int companyID;

  EnquiryAccessClass(
  	this.enquiryAccessId,
      this.enquiryId,
      this.companyExecutiveId,
      this.companyExecutiveName,
      this.accessApplicationTime,
      this.ownerFlag
  );

  EnquiryAccessClass.remaining(
  	this.companyExecutiveId,
      this.companyExecutiveName,
      this.contactNumber,
      this.companyID
  );

}