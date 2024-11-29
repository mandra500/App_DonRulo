import 'dart:convert';

class SingInDecoranle {
  String? kind;
  String? localId;
  String? email;
  String? displayName;
  String? idToken;
  bool? registered;

  SingInDecoranle({
    this.kind,
    this.localId,
    this.email,
    this.displayName,
    this.idToken,
    this.registered,
  });

  factory SingInDecoranle.fromJson(String str) =>
      SingInDecoranle.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SingInDecoranle.fromMap(Map<String, dynamic> json) => SingInDecoranle(
        kind: json["kind"],
        localId: json["localId"],
        email: json["email"],
        displayName: json["displayName"],
        idToken: json["idToken"],
        registered: json["registered"],
      );

  Map<String, dynamic> toMap() => {
        "kind": kind,
        "localId": localId,
        "email": email,
        "displayName": displayName,
        "idToken": idToken,
        "registered": registered,
      };
}
