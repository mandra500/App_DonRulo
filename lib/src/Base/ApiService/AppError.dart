import 'dart:convert';

import 'package:app_donrulo/src/Base/Constants/ErrorMessage.dart';
import 'package:app_donrulo/src/Services/FirebaseService/AuthFirebaseServices/Decodables/AuthErrorDecorable.dart';

class Fallas {
  String? message;
  Map<String, dynamic> error = {};

  @override
  String toString() => message ?? "";

  //constructor multiples

  Fallas.fromMessage({String? message}) {
    message = message;
  }

  Fallas.fromBody({required String body}) {
    var jsonData = jsonDecode(body);
    error = jsonData;
  }

  static Fallas getFirebaseAuthErrorMessage(
      {required Map<String, dynamic> error}) {
    AuthErrorDecorable errorDecodable = AuthErrorDecorable.fromMap(error);

    var message = "";
    errorDecodable.error?.errors?.forEach((error) {
      message = error.message ?? "";
    });

    if (message == "EMAIL_NOT_FOUND") {
      return Fallas.fromMessage(
          message: FBFallasMessage.emailNotFoundMessage); //email no encontrado
    } else if (message == "INVALID_PASSWORD") {
      return Fallas.fromMessage(
          message:
              FBFallasMessage.invalidPasswordMessage); //contraseña invalido
    } else if (message == "EMAIL_EXISTS") {
      return Fallas.fromMessage(
          message: FBFallasMessage.emailExistMessage); //email ya existe
    } else if (message == "TOO_MANY_ATTEMPTS_TRY_LATER") {
      return Fallas.fromMessage(
          message: FBFallasMessage.tooManyAttempsMessage); //dem
    } else if (message == "INVALID_ID_TOKEN") {
      return Fallas.fromMessage(
          message: FBFallasMessage.invalidIdTokenMessage); //token invalido
    } else if (message == "USER_NOT_FOUND") {
      return Fallas.fromMessage(
          message: FBFallasMessage.userNotFoundMessage); //usuario no encontrado
    } else {
      return Fallas.fromMessage(message: message); //error default
    }
  }
}
