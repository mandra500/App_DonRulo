import 'dart:convert';

class Fallas {
  String? message;
  Map<String, dynamic> error = {};

  @override
  String toString() => message ?? "";

  //CONSTRUCTORES
  Fallas.fromMessage({String? message}) {
    message = message;
  }

  Fallas.fromBody({required String body}) {
    var jsonData = jsonDecode(body);
    error = jsonData;
  }
}
