class LandlordSignUp {
  String firstName;
  String lastName;
  String email;
  String phone;
  String password;
  String userType;

  LandlordSignUp(
      {this.firstName,
      this.lastName,
      this.email,
      this.phone,
      this.password,
      this.userType});

  LandlordSignUp.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
    userType = json['user_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['password'] = this.password;
    data['user_type'] = this.userType;
    return data;
  }
}