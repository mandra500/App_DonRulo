import 'dart:convert';
import 'dart:io';
import 'package:app_donrulo/src/Base/ApiService/app_error.dart';
import 'package:http/http.dart' as http;

abstract class _Exceptions {
  static String socketExceptionMessage = "No hay conexión a Internet 🌐";
  static String httpException = "No se encuentra la ruta 🥴";
  static String formatException = "formato de respuesta incorrecto 😵";
}

 abstract class ApiService {
  Future<Map<String, dynamic>> getDataFromPostRequest({ required Map<String,dynamic> bodyParameters, required String url, Map<String,String>? headers});
  Future<Map<String, dynamic>> getDataFromPutRequest({ required Map<String,dynamic> bodyParameters, required String url, Map<String,String>? headers});
  Future<Map<String, dynamic>> getDataFromGetRequest({ required String url, Map<String,String>? headers});
 }

 //inyección de Dependencias

class DefaultApiService extends ApiService {
  @override
  //GET para obtener
  Future<Map<String, dynamic>> getDataFromGetRequest({required String url, Map<String, String>? headers}) async {
    final _url = Uri.parse(url);
    final response = await http.get(_url, headers: headers);
    try {
      if (response.statusCode.toString().contains('20')){
        //conexión establecida
        var jsonData = jsonDecode(response.body);
        return jsonData;
      } else {
        //conexión fallida
        throw Fallas.fromBody(body: response.body); // esto es una excepcion
      }
    } on SocketException {
      throw Fallas.fromMessage(message: _Exceptions.socketExceptionMessage);
    } on HttpException {
      throw Fallas.fromMessage(message: _Exceptions.httpException);
    } on FormatException {
      throw Fallas.fromMessage(message: _Exceptions.formatException);
    }
  }

  @override
  //POST nuevas cosas en la bd
  Future<Map<String, dynamic>> getDataFromPostRequest({required Map<String, dynamic> bodyParameters, required String url, Map<String, String>? headers}) async {
    final _url = Uri.parse(url);
    final body = jsonEncode(bodyParameters);
    final response = await http.post(_url, headers: headers, body: body);

    try {
      // TODO: Revisar este if con el contains
      if (response.statusCode.toString().contains('20')) {
        var jsonData = jsonDecode(response.body);
        return jsonData;
      } else {
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

  @override
  //PUT actualizar
  Future<Map<String, dynamic>> getDataFromPutRequest({required Map<String, dynamic> bodyParameters, required String url, Map<String, String>? headers}) async {
    final _url = Uri.parse(url);
    final body = jsonEncode(bodyParameters);
    final response = await http.put(_url, headers: headers, body: body);

    try {
      // TODO: Revisar este if con el contains
      if (response.statusCode.toString().contains('20')) {
        var jsonData = jsonDecode(response.body);
        return jsonData;
      } else {
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