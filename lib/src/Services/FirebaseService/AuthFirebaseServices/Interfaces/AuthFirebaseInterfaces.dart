import 'package:app_donrulo/src/Base/ApiService/ApiService.dart';

abstract class BaseFirebaseService {
  ApiService apiService = DefaultApiService();
  static String baseUrl = "https://identitytoolkit.googleapis.com/v1/";
  static String registroEndpoint = "accounts:signUp?key=";
  static String inisesionEndpoint = "accounts:signInWithPassword?key=";
  static String adminToken = "AIzaSyA6QHI0b3nmpnRTCAXbxrQHD9gbYMWv48w";
}

abstract class SignUpService extends BaseFirebaseService {
  String endpoint = BaseFirebaseService.baseUrl +
      BaseFirebaseService.registroEndpoint +
      BaseFirebaseService.adminToken;
//Metodo de llamada
  Future<Map<String, dynamic>> signUp(
      {required Map<String, dynamic> bodyParameters});
}

abstract class SignInService extends BaseFirebaseService {
  String endpoint = BaseFirebaseService.baseUrl +
      BaseFirebaseService.inisesionEndpoint +
      BaseFirebaseService.adminToken;
//Metodo de llamada
  Future<Map<String, dynamic>> signIn(
      {required Map<String, dynamic> bodyParameters});
}
