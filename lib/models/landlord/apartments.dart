class Apartments {
  List<Apartment> data;
  String status;

  Apartments({this.data, this.status});

  Apartments.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Apartment>();
      json['data'].forEach((v) {
        data.add(new Apartment.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class Apartment {
  int id;
  String houseId;
  String name;
  String type;
  String description;
  String createdAt;
  String updatedAt;

  Apartment(
      {this.id,
      this.houseId,
      this.name,
      this.type,
      this.description,
      this.createdAt,
      this.updatedAt});

  Apartment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    houseId = json['house_id'];
    name = json['name'];
    type = json['type'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['house_id'] = this.houseId;
    data['name'] = this.name;
    data['type'] = this.type;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}