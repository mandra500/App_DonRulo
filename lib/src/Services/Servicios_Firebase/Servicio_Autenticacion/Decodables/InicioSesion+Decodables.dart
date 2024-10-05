import 'dart:convert';

class InicioSesionDecodables {
  String? kind;
  String? localId;
  String? email;
  String? displayName;
  String? idToken;
  bool? registered;

  InicioSesionDecodables({
    this.kind,
    this.localId,
    this.email,
    this.displayName,
    this.idToken,
    this.registered,
  });

  factory InicioSesionDecodables.fromJson(String str) => InicioSesionDecodables.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory InicioSesionDecodables.fromMap(Map<String, dynamic> json) => InicioSesionDecodables(
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
