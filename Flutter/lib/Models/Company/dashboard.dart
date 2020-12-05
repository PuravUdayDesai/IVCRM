class Dashboard {
  List<TopExecutives> topExecutives;
  int numberOfClients;
  int numberOfCompanies;
  int numberOfBranch;
  int numberOfProducts;
  int numberOfExecutives;
  int numberOftickets;

  Dashboard(
      {this.topExecutives,
      this.numberOfClients,
      this.numberOfCompanies,
      this.numberOfBranch,
      this.numberOfProducts,
      this.numberOfExecutives,
      this.numberOftickets});

  Dashboard.fromJson(Map<String, dynamic> json) {
    if (json['topExecutives'] != null) {
      topExecutives = new List<TopExecutives>();
      json['topExecutives'].forEach((v) {
        topExecutives.add(new TopExecutives.fromJson(v));
      });
    }
    numberOfClients = json['numberOfClients'];
    numberOfCompanies = json['numberOfCompanies'];
    numberOfBranch = json['numberOfBranch'];
    numberOfProducts = json['numberOfProducts'];
    numberOfExecutives = json['numberOfExecutives'];
    numberOftickets = json['numberOftickets'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.topExecutives != null) {
      data['topExecutives'] =
          this.topExecutives.map((v) => v.toJson()).toList();
    }
    data['numberOfClients'] = this.numberOfClients;
    data['numberOfCompanies'] = this.numberOfCompanies;
    data['numberOfBranch'] = this.numberOfBranch;
    data['numberOfProducts'] = this.numberOfProducts;
    data['numberOfExecutives'] = this.numberOfExecutives;
    data['numberOftickets'] = this.numberOftickets;
    return data;
  }
}

class TopExecutives {
  String executiveName;
  int plRate;

  TopExecutives({this.executiveName, this.plRate});

  TopExecutives.fromJson(Map<String, dynamic> json) {
    executiveName = json['executiveName'];
    plRate = json['plRate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['executiveName'] = this.executiveName;
    data['plRate'] = this.plRate;
    return data;
  }
}
