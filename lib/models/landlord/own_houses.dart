class OwnHouses {
  List<Data> data;
  String status;

  OwnHouses({this.data, this.status});

  OwnHouses.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
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

class Data {
  int id;
  String userId;
  String name;
  String photo;
  String propertyType;
  String houseType;
  String street;
  String town;
  String state;
  String country;
  String createdAt;
  String updatedAt;

  Data(
      {this.id,
      this.userId,
      this.name,
      this.photo,
      this.propertyType,
      this.houseType,
      this.street,
      this.town,
      this.state,
      this.country,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    photo = json['photo'];
    propertyType = json['property_type'];
    houseType = json['house_type'];
    street = json['street'];
    town = json['town'];
    state = json['state'];
    country = json['country'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['photo'] = this.photo;
    data['property_type'] = this.propertyType;
    data['house_type'] = this.houseType;
    data['street'] = this.street;
    data['town'] = this.town;
    data['state'] = this.state;
    data['country'] = this.country;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}