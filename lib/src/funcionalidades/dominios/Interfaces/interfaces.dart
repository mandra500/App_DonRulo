import 'package:app_donrulo/src/Base/ApiService/AppError.dart';
import 'package:app_donrulo/src/Services/FirebaseService/AuthFirebaseServices/Decodables/SignUpDecorable.dart';
import 'package:app_donrulo/src/funcionalidades/data/Decorables/User/UserDecodable.dart';
import 'package:app_donrulo/src/funcionalidades/data/Repositorios/Autenticacion/SingUpRepository/SignUpRepositoryParameters.dart';
import 'package:app_donrulo/src/utils/Helpers/ResultType/ResultType.dart';

import '../../data/Repositorios/User/UserBodyParameters.dart';

// Interfaz de autenticacion  de repositorio
abstract class SignUpRepository {
  Future<Result<SignUpDecorable, Fallas>> signUp(
      {required SignUpRepositoryParameters params});
}

//User Database Repository
abstract class SaveUserDataRepository {
  Future<Result<UserDecodable, Fallas>> saveUserData(
      {required UserBodyParameters parameters});
}
