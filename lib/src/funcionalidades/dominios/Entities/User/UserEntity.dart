import 'dart:convert';

class UserEntity {
  UserEntity(
      {this.localId,
      this.role,
      this.username,
      this.email,
      this.phone,
      this.dateOfBirtth,
      this.startDate,
      this.photo,
      this.shippingAddress,
      this.billingAddress,
      this.idToken});

  String? localId;
  String? role;
  String? username;
  String? email;
  String? phone;
  String? dateOfBirtth;
  String? startDate;
  String? photo;
  String? shippingAddress;
  String? billingAddress;
  String? idToken;

  factory UserEntity.fromJson(String str) =>
      UserEntity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserEntity.fromMap(Map<String, dynamic> json) => UserEntity(
        localId: json["localId"],
        role: json["role"],
        username: json["username"],
        email: json["email"],
        phone: json["phone"],
        dateOfBirtth: json["dateOfBirtth"],
        startDate: json["startDate"],
        photo: json["photo"],
        shippingAddress: json["shippingAddress"],
        billingAddress: json["billingAddress"],
        idToken: json["idToken"],
      );

  Map<String, dynamic> toMap() => {
        "localId": localId,
        "role": role,
        "username": username,
        "email": email,
        "phone": phone,
        "dateOfBirtth": dateOfBirtth,
        "startDate": startDate,
        "photo": photo,
        "shippingAddress": shippingAddress,
        "billingAddress": billingAddress,
        "idToken": idToken,
      };
}

enum UserRole { user, owner, admin, rider }

extension ParseToString on UserRole {
  String toShortString() {
    return toString().split('.').last;
  }
}
