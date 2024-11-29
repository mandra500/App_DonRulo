import 'dart:convert';

class AuthErrorDecorable {
  AuthErrorDecorableError? error;

  AuthErrorDecorable({
    this.error,
  });

  factory AuthErrorDecorable.fromJson(String str) =>
      AuthErrorDecorable.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AuthErrorDecorable.fromMap(Map<String, dynamic> json) =>
      AuthErrorDecorable(
        error: AuthErrorDecorableError.fromMap(json["error"]),
      );

  Map<String, dynamic> toMap() => {
        "error": error?.toMap(),
      };
}

class AuthErrorDecorableError {
  int? code;
  String? message;
  List<ErrorElement>? errors;

  AuthErrorDecorableError({
    this.code,
    this.message,
    this.errors,
  });

  factory AuthErrorDecorableError.fromJson(String str) =>
      AuthErrorDecorableError.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AuthErrorDecorableError.fromMap(Map<String, dynamic> json) =>
      AuthErrorDecorableError(
        code: json["code"],
        message: json["message"],
        errors: List<ErrorElement>.from(
            json["errors"].map((x) => ErrorElement.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "message": message,
        "errors": List<dynamic>.from(errors!.map((x) => x.toMap())),
      };
}

class ErrorElement {
  String? message;
  String? domain;
  String? reason;

  ErrorElement({
    this.message,
    this.domain,
    this.reason,
  });

  factory ErrorElement.fromJson(String str) =>
      ErrorElement.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ErrorElement.fromMap(Map<String, dynamic> json) => ErrorElement(
        message: json["message"],
        domain: json["domain"],
        reason: json["reason"],
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "domain": domain,
        "reason": reason,
      };
}
