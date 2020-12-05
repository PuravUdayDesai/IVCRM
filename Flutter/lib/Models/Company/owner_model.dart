class OwnerClass{
	String ownerName;
  String ownerContact;
  String ownerEmail;
  String ownerUserName;
  String ownerPassword;
  String createdOn;

  OwnerClass.toPost(
  	this.ownerName,
      this.ownerContact,
      this.ownerEmail,
      this.ownerUserName,
      this.ownerPassword,
      this.createdOn
  );

  Map<String, dynamic> toMap() {
   var data = new Map<String, dynamic>();
    data['ownerName'] = this.ownerName;
    data['ownerContact'] = this.ownerContact;
    data['ownerEmail'] = this.ownerEmail;
    data['ownerUserName'] = this.ownerUserName;
    data['ownerPassword'] = this.ownerPassword;
    data['createdOn'] = this.createdOn;
    return data;
  }
}