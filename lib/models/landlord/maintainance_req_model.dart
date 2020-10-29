class TenantMaintaincesReq {
  List<Requests> requests;
  String status;

  TenantMaintaincesReq({this.requests, this.status});

  TenantMaintaincesReq.fromJson(Map<String, dynamic> json) {
    if (json['requests'] != null) {
      requests = new List<Requests>();
      json['requests'].forEach((v) {
        requests.add(new Requests.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.requests != null) {
      data['requests'] = this.requests.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class Requests {
  int id;
  String tenantId;
  String landlordId;
  String level;
  String duty;
  String isFixed;
  String createdAt;
  String updatedAt;
  Tenant tenant;

  Requests(
      {this.id,
      this.tenantId,
      this.landlordId,
      this.level,
      this.duty,
      this.isFixed,
      this.createdAt,
      this.updatedAt,
      this.tenant});

  Requests.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tenantId = json['tenant_id'];
    landlordId = json['landlord_id'];
    level = json['level'];
    duty = json['duty'];
    isFixed = json['is_fixed'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    tenant =
        json['tenant'] != null ? new Tenant.fromJson(json['tenant']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tenant_id'] = this.tenantId;
    data['landlord_id'] = this.landlordId;
    data['level'] = this.level;
    data['duty'] = this.duty;
    data['is_fixed'] = this.isFixed;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.tenant != null) {
      data['tenant'] = this.tenant.toJson();
    }
    return data;
  }
}

class Tenant {
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

  Tenant(
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
      this.fullName});

  Tenant.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}


