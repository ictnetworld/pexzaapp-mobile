class AuthResponse {
  String status;
  String message;

  AuthResponse({this.status, this.message});

  AuthResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}


class LoginAuthResponse {
  int id;
  String firstName;
  String lastName;
  String phone;
  String email;
  String emailVerifiedAt;
  String userType;
  String createdAt;
  String updatedAt;

  LoginAuthResponse(
      {this.id,
      this.firstName,
      this.lastName,
      this.phone,
      this.email,
      this.emailVerifiedAt,
      this.userType,
      this.createdAt,
      this.updatedAt});

  LoginAuthResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    phone = json['phone'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    userType = json['user_type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
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
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}