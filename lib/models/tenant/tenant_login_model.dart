class TenantDetails {
  String status;
  TenantIndividual data;

  TenantDetails({this.status, this.data});

  TenantDetails.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new TenantIndividual.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class TenantIndividual {
  int id;
  String firstName;
  String lastName;
  String phone;
  String email;
  Null emailVerifiedAt;
  String userType;
  String photo;
  Null deletedAt;
  String age;
  String gender;
  String createdAt;
  String updatedAt;
  String fullName;

  TenantIndividual(
      {this.id,
      this.firstName,
      this.lastName,
      this.phone,
      this.email,
      this.emailVerifiedAt,
      this.userType,
      this.photo,
      this.deletedAt,
      this.age,
      this.gender,
      this.createdAt,
      this.updatedAt,
      this.fullName});

  TenantIndividual.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    phone = json['phone'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    userType = json['user_type'];
    photo = json['photo'];
    deletedAt = json['deleted_at'];
    age = json['age'];
    gender = json['gender'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    fullName = json['full_name'];
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
    data['photo'] = this.photo;
    data['deleted_at'] = this.deletedAt;
    data['age'] = this.age;
    data['gender'] = this.gender;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['full_name'] = this.fullName;
    return data;
  }
}