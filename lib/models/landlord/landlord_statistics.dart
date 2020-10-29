class LandlordStats {
  Doingwell doingwell;
  String status;

  LandlordStats({this.doingwell, this.status});

  LandlordStats.fromJson(Map<String, dynamic> json) {
    doingwell = json['data'] != null
        ? new Doingwell.fromJson(json['data'])
        : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.doingwell != null) {
      data['data'] = this.doingwell.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class Doingwell {
  int complains;
  int house;
  int tenants;
  int apartments;

  Doingwell({this.complains, this.house, this.tenants, this.apartments});

  Doingwell.fromJson(Map<String, dynamic> json) {
    complains = json['complains'];
    house = json['house'];
    tenants = json['tenants'];
    apartments = json['apartments'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['complains'] = this.complains;
    data['house'] = this.house;
    data['tenants'] = this.tenants;
    data['apartments'] = this.apartments;
    return data;
  }
}