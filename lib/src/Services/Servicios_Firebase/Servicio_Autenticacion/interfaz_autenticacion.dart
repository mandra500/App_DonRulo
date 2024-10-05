import 'package:app_donrulo/src/Base/ApiService/api_service.dart';

abstract class BaseFirebaseServicio {
  ApiService apiService = DefaultApiService();
  static String baseUrl = "https://identitytoolkit.googleapis.com/v1/";
  static String registroEndpoint = "accounts:signUp?key=";
  static String inisesionEndpoint = "accounts:signInWithPassword?key=";
  static String adminToken = "AIzaSyA6QHI0b3nmpnRTCAXbxrQHD9gbYMWv48w";
}

abstract class RegistrarUsuarioService extends BaseFirebaseServicio{
  String endpoint = BaseFirebaseServicio.baseUrl + BaseFirebaseServicio.registroEndpoint + BaseFirebaseServicio.adminToken;
//Metodo de llamada
Future<Map<String,dynamic>> registrarse({ required Map<String,dynamic> bodyParameters});
}

abstract class IniciarUsuarioService extends BaseFirebaseServicio{
  String endpoint = BaseFirebaseServicio.baseUrl + BaseFirebaseServicio.inisesionEndpoint + BaseFirebaseServicio.adminToken;
//Metodo de llamada
  Future<Map<String,dynamic>> iniciarsesion({ required Map<String,dynamic> bodyParameters});

}