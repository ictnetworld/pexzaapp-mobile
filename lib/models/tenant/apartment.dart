class ApartmentDetails {
  Data data;
  String status;

  ApartmentDetails({this.data, this.status});

  ApartmentDetails.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class Data {
  int id;
  String firstName;
  String lastName;
  String phone;
  String email;
  Null emailVerifiedAt;
  String userType;
  Null deletedAt;
  String createdAt;
  String updatedAt;
  String fullName;
  Assignment assignment;

  Data(
      {this.id,
      this.firstName,
      this.lastName,
      this.phone,
      this.email,
      this.emailVerifiedAt,
      this.userType,
      this.deletedAt,
      this.createdAt,
      this.updatedAt,
      this.fullName,
      this.assignment});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    phone = json['phone'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    userType = json['user_type'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    fullName = json['full_name'];
    assignment = json['assignment'] != null
        ? new Assignment.fromJson(json['assignment'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['user_type'] = this.userType;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['full_name'] = this.fullName;
    if (this.assignment != null) {
      data['assignment'] = this.assignment.toJson();
    }
    return data;
  }
}

class Assignment {
  int id;
  String userId;
  String landlordId;
  String apartmentId;
  String status;
  String code;
  String duration;
  String paymentPlan;
  String currency;
  String amount;
  Null deletedAt;
  String createdAt;
  String updatedAt;
  Apartment apartment;

  Assignment(
      {this.id,
      this.userId,
      this.landlordId,
      this.apartmentId,
      this.status,
      this.code,
      this.duration,
      this.paymentPlan,
      this.currency,
      this.amount,
      this.deletedAt,
      this.createdAt,
      this.updatedAt,
      this.apartment});

  Assignment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    landlordId = json['landlord_id'];
    apartmentId = json['apartment_id'];
    status = json['status'];
    code = json['code'];
    duration = json['duration'];
    paymentPlan = json['payment_plan'];
    currency = json['currency'];
    amount = json['amount'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    apartment = json['apartment'] != null
        ? new Apartment.fromJson(json['apartment'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['landlord_id'] = this.landlordId;
    data['apartment_id'] = this.apartmentId;
    data['status'] = this.status;
    data['code'] = this.code;
    data['duration'] = this.duration;
    data['payment_plan'] = this.paymentPlan;
    data['currency'] = this.currency;
    data['amount'] = this.amount;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.apartment != null) {
      data['apartment'] = this.apartment.toJson();
    }
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