import 'dart:convert';

class RegistrarseDecodables {
  String? kind;
  String? idToken;
  String? email;
  String? refreshToken;
  String? expiresIn;
  String? localId;

  RegistrarseDecodables({
    this.kind,
    this.idToken,
    this.email,
    this.refreshToken,
    this.expiresIn,
    this.localId,
  });

  factory RegistrarseDecodables.fromJson(String str) => RegistrarseDecodables.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RegistrarseDecodables.fromMap(Map<String, dynamic> json) => RegistrarseDecodables(
    kind: json["kind"],
    idToken: json["idToken"],
    email: json["email"],
    refreshToken: json["refreshToken"],
    expiresIn: json["expiresIn"],
    localId: json["localId"],
  );

  Map<String, dynamic> toMap() => {
    "kind": kind,
    "idToken": idToken,
    "email": email,
    "refreshToken": refreshToken,
    "expiresIn": expiresIn,
    "localId": localId,
  };
}
