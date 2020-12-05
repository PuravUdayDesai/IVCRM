class OwnerModel {
  int id;
  String ownerName;
  String ownerContact;
  String ownerEmail;
  String userName;
  bool isActive;
  String createdOn;
  String lastEditOn;

  OwnerModel(
      {this.id,
      this.ownerName,
      this.ownerContact,
      this.ownerEmail,
      this.userName,
      this.isActive,
      this.createdOn,
      this.lastEditOn});

  OwnerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ownerName = json['ownerName'];
    ownerContact = json['ownerContact'];
    ownerEmail = json['ownerEmail'];
    userName = json['userName'];
    isActive = json['isActive'];
    createdOn = json['createdOn'];
    lastEditOn = json['lastEditOn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ownerName'] = this.ownerName;
    data['ownerContact'] = this.ownerContact;
    data['ownerEmail'] = this.ownerEmail;
    data['userName'] = this.userName;
    data['isActive'] = this.isActive;
    data['createdOn'] = this.createdOn;
    data['lastEditOn'] = this.lastEditOn;
    return data;
  }
}
