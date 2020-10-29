class YourTenants {
    YourTenants({
        this.id,
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
        this.fullName,
        this.assignment,
    });

    final int id;
    final String firstName;
    final String lastName;
    final String phone;
    final String email;
    final dynamic emailVerifiedAt;
    final String userType;
    final String photo;
    final dynamic deletedAt;
    final String age;
    final String gender;
    final DateTime createdAt;
    final DateTime updatedAt;
    final String fullName;
    final Assignment assignment;

    factory YourTenants.fromJson(Map<String, dynamic> json) => YourTenants(
        id: json["id"] == null ? null : json["id"],
        firstName: json["first_name"] == null ? null : json["first_name"],
        lastName: json["last_name"] == null ? null : json["last_name"],
        phone: json["phone"] == null ? null : json["phone"],
        email: json["email"] == null ? null : json["email"],
        emailVerifiedAt: json["email_verified_at"],
        userType: json["user_type"] == null ? null : json["user_type"],
        photo: json["photo"] == null ? null : json["photo"],
        deletedAt: json["deleted_at"],
        age: json["age"] == null ? null : json["age"],
        gender: json["gender"] == null ? null : json["gender"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        fullName: json["full_name"] == null ? null : json["full_name"],
        assignment: json["assignment"] == null ? null : Assignment.fromJson(json["assignment"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "first_name": firstName == null ? null : firstName,
        "last_name": lastName == null ? null : lastName,
        "phone": phone == null ? null : phone,
        "email": email == null ? null : email,
        "email_verified_at": emailVerifiedAt,
        "user_type": userType == null ? null : userType,
        "photo": photo == null ? null : photo,
        "deleted_at": deletedAt,
        "age": age == null ? null : age,
        "gender": gender == null ? null : gender,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "full_name": fullName == null ? null : fullName,
        "assignment": assignment == null ? null : assignment.toJson(),
    };
}

class Assignment {
    Assignment({
        this.id,
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
        this.apartment,
    });

    final int id;
    final String userId;
    final String landlordId;
    final String apartmentId;
    final String status;
    final String code;
    final String duration;
    final String paymentPlan;
    final String currency;
    final String amount;
    final dynamic deletedAt;
    final DateTime createdAt;
    final DateTime updatedAt;
    final Apartment apartment;

    factory Assignment.fromJson(Map<String, dynamic> json) => Assignment(
        id: json["id"] == null ? null : json["id"],
        userId: json["user_id"] == null ? null : json["user_id"],
        landlordId: json["landlord_id"] == null ? null : json["landlord_id"],
        apartmentId: json["apartment_id"] == null ? null : json["apartment_id"],
        status: json["status"] == null ? null : json["status"],
        code: json["code"] == null ? null : json["code"],
        duration: json["duration"] == null ? null : json["duration"],
        paymentPlan: json["payment_plan"] == null ? null : json["payment_plan"],
        currency: json["currency"] == null ? null : json["currency"],
        amount: json["amount"] == null ? null : json["amount"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        apartment: json["apartment"] == null ? null : Apartment.fromJson(json["apartment"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "user_id": userId == null ? null : userId,
        "landlord_id": landlordId == null ? null : landlordId,
        "apartment_id": apartmentId == null ? null : apartmentId,
        "status": status == null ? null : status,
        "code": code == null ? null : code,
        "duration": duration == null ? null : duration,
        "payment_plan": paymentPlan == null ? null : paymentPlan,
        "currency": currency == null ? null : currency,
        "amount": amount == null ? null : amount,
        "deleted_at": deletedAt,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "apartment": apartment == null ? null : apartment.toJson(),
    };
}

class Apartment {
    Apartment({
        this.id,
        this.houseId,
        this.name,
        this.type,
        this.description,
        this.createdAt,
        this.updatedAt,
    });

    final int id;
    final String houseId;
    final String name;
    final String type;
    final String description;
    final DateTime createdAt;
    final DateTime updatedAt;

    factory Apartment.fromJson(Map<String, dynamic> json) => Apartment(
        id: json["id"] == null ? null : json["id"],
        houseId: json["house_id"] == null ? null : json["house_id"],
        name: json["name"] == null ? null : json["name"],
        type: json["type"] == null ? null : json["type"],
        description: json["description"] == null ? null : json["description"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "house_id": houseId == null ? null : houseId,
        "name": name == null ? null : name,
        "type": type == null ? null : type,
        "description": description == null ? null : description,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
    };
}