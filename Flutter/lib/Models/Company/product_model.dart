
class ProductClass {
  int id;
  String productName;
  String productDescription;
  int companyId;
  String companyName;
  dynamic cost;
  int createdBy;
  String createdOn;
  int lastEditBy;
  String lastEditOn;
  bool isActive;

  ProductClass.retrieve(
    this.id,
      this.productName,
      this.productDescription,
      this.companyId,
      this.companyName,
      this.cost,
      this.createdBy,
      this.createdOn,
      this.lastEditBy,
      this.lastEditOn,
      this.isActive
      );

  ProductClass.toPost(
      this.productName,
      this.productDescription,
      this.companyId,
      this.cost,
      this.createdBy,
      this.createdOn
      );

  ProductClass.toPut(
    this.productName,
      this.productDescription,
      this.companyId,
      this.cost,
      this.lastEditBy,
      this.lastEditOn
      );

  ProductClass.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productName = json['productName'];
    productDescription = json['productDescription'];
    companyId = json['companyId'];
    companyName = json['companyName'];
    cost = json['cost'];
    createdBy = json['createdBy'];
    createdOn = json['createdOn'];
    lastEditBy = json['lastEditBy'];
    lastEditOn = json['lastEditOn'];
    isActive = json['isActive'];
  }

  Map<String, dynamic> toMap() {
    var data = new Map<String, dynamic>();
    data['productName'] = this.productName;
    data['productDescription'] = this.productDescription;
    data['companyId'] = this.companyId;
    data['cost'] = this.cost;
    data['createdBy'] = this.createdBy;
    data['createdOn'] = this.createdOn;
    return data;
  }

  Map<String, dynamic> toMapPut() {
    var data = new Map<String, dynamic>();
    data['productName'] = this.productName;
    data['productDescription'] = this.productDescription;
    data['companyId'] = this.companyId;
    data['cost'] = this.cost;
    data['lastEditBy'] = this.lastEditBy;
    data['lastEditOn'] = this.lastEditOn;
    return data;
  }
}