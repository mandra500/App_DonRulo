import 'dart:convert';
import 'dart:io';
import 'package:app_donrulo/src/Base/ApiService/AppError.dart';
import 'package:http/http.dart' as http;

abstract class _Exceptions {
  static String socketExceptionMessage = "No hay conexión a internet 😕";
  static String httpException = "Error de conexión con el servidor 😵";
  static String formatException = "Error de formato 🤯";
}

abstract class ApiService {
  // POST
  Future<Map<String, dynamic>> getDataFromPostRequest({
    required Map<String, dynamic> bodyParameters,
    required String url,
    Map<String, String>? headers,
  });

  // PUT
  Future<Map<String, dynamic>> getDataFromPutRequest({
    required Map<String, dynamic> bodyParameters,
    required String url,
    Map<String, String>? headers,
  });

  // GET
  Future<Map<String, dynamic>> getDataFromGetRequest({
    required String url,
    Map<String, String>? headers,
  });
}

// Implementación, inyección de dependencias
class DefaultApiService extends ApiService {
  @override // GET
  Future<Map<String, dynamic>> getDataFromGetRequest({
    required String url,
    Map<String, String>? headers,
  }) async {
    final _url = Uri.parse(url);
    final response = await http.get(_url, headers: headers);

    try {
      if (response.statusCode >= 200 && response.statusCode < 300) {
        // Hizo conexión al servidor
        var jsonData = jsonDecode(response.body);
        return jsonData;
      } else {
        // No se pudo conectar al servidor
        throw Fallas.fromBody(body: response.body);
      }
    } on SocketException {
      throw Fallas.fromMessage(message: _Exceptions.socketExceptionMessage);
    } on HttpException {
      throw Fallas.fromMessage(message: _Exceptions.httpException);
    } on FormatException {
      throw Fallas.fromMessage(message: _Exceptions.formatException);
    }
  }

  @override // POST
  Future<Map<String, dynamic>> getDataFromPostRequest({
    required Map<String, dynamic> bodyParameters,
    required String url,
    Map<String, String>? headers,
  }) async {
    final _url = Uri.parse(url);
    final body = json.encode(bodyParameters);
    final response = await http.post(_url, headers: headers, body: body);

    try {
      if (response.statusCode >= 200 && response.statusCode < 300) {
        // Hizo conexión al servidor
        var jsonData = jsonDecode(response.body);
        return jsonData;
      } else {
        // No se pudo conectar al servidor
        throw Fallas.fromBody(body: response.body);
      }
    } on SocketException {
      throw Fallas.fromMessage(message: _Exceptions.socketExceptionMessage);
    } on HttpException {
      throw Fallas.fromMessage(message: _Exceptions.httpException);
    } on FormatException {
      throw Fallas.fromMessage(message: _Exceptions.formatException);
    }
  }

  @override // PUT
  Future<Map<String, dynamic>> getDataFromPutRequest({
    required Map<String, dynamic> bodyParameters,
    required String url,
    Map<String, String>? headers,
  }) async {
    final _url = Uri.parse(url);
    final body = json.encode(bodyParameters);
    final response = await http.put(_url, headers: headers, body: body);

    try {
      if (response.statusCode >= 200 && response.statusCode < 300) {
        // Hizo conexión al servidor
        var jsonData = jsonDecode(response.body);
        return jsonData;
      } else {
        // No se pudo conectar al servidor
        throw Fallas.fromBody(body: response.body);
      }
    } on SocketException {
      throw Fallas.fromMessage(message: _Exceptions.socketExceptionMessage);
    } on HttpException {
      throw Fallas.fromMessage(message: _Exceptions.httpException);
    } on FormatException {
      throw Fallas.fromMessage(message: _Exceptions.formatException);
    }
  }
}
