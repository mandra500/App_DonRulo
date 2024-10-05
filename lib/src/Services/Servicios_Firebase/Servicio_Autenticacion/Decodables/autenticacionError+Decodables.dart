import 'dart:convert';

class AutenticacionErrorDecodables {
  AutenticacionErrorDecodablesError? error;

  AutenticacionErrorDecodables({
    this.error,
  });

  factory AutenticacionErrorDecodables.fromJson(String str) => AutenticacionErrorDecodables.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AutenticacionErrorDecodables.fromMap(Map<String, dynamic> json) => AutenticacionErrorDecodables(
    error: AutenticacionErrorDecodablesError.fromMap(json["error"]),
  );

  Map<String, dynamic> toMap() => {
    "error": error?.toMap(),
  };
}

class AutenticacionErrorDecodablesError {
  int? code;
  String? message;
  List<ErrorElement>? errors;

  AutenticacionErrorDecodablesError({
    this.code,
    this.message,
    this.errors,
  });

  factory AutenticacionErrorDecodablesError.fromJson(String str) => AutenticacionErrorDecodablesError.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AutenticacionErrorDecodablesError.fromMap(Map<String, dynamic> json) => AutenticacionErrorDecodablesError(
    code: json["code"],
    message: json["message"],
    errors: List<ErrorElement>.from(json["errors"].map((x) => ErrorElement.fromMap(x))),
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

  factory ErrorElement.fromJson(String str) => ErrorElement.fromMap(json.decode(str));

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
