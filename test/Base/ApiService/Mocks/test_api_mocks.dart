import 'dart:convert';

class CorrectPostBody {
  String? title;
  String? body;
  int? userId;

  CorrectPostBody({
    this.title,
    this.body,
    this.userId,
  });

  factory CorrectPostBody.fromJson(String str) => CorrectPostBody.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CorrectPostBody.fromMap(Map<String, dynamic> json) => CorrectPostBody(
    title: json["title"],
    body: json["body"],
    userId: json["userId"],
  );

  Map<String, dynamic> toMap() => {
    "title": title,
    "body": body,
    "userId": userId,
  };
}

//CorrectPUTBody

class CorrectPutBody {
  int? id;
  String? title;
  String? body;
  int? userId;

  CorrectPutBody({
    this.id,
    this.title,
    this.body,
    this.userId,
  });

  factory CorrectPutBody.fromJson(String str) => CorrectPutBody.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CorrectPutBody.fromMap(Map<String, dynamic> json) => CorrectPutBody(
    id: json["id"],
    title: json["title"],
    body: json["body"],
    userId: json["userId"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "title": title,
    "body": body,
    "userId": userId,
  };
}
