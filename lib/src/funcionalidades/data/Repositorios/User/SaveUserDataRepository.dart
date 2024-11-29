import 'package:app_donrulo/src/Base/ApiService/AppError.dart';
import 'package:app_donrulo/src/Base/Constants/ErrorMessage.dart';
import 'package:app_donrulo/src/Services/FirebaseService/RealtimeDatabaseService/Interfaces/interfaces.dart';
import 'package:app_donrulo/src/Services/FirebaseService/RealtimeDatabaseService/Servicios/RealtimeDataBaseService.dart';
import 'package:app_donrulo/src/funcionalidades/data/Decorables/User/UserDecodable.dart';
import 'package:app_donrulo/src/funcionalidades/data/Repositorios/User/UserBodyParameters.dart';
import 'package:app_donrulo/src/funcionalidades/dominios/Interfaces/interfaces.dart';
import 'package:app_donrulo/src/utils/Helpers/ResultType/ResultType.dart';

abstract class _Paths {
  static const String userCollection = "users/";
}

class DefaultSaveUserDataRepository extends SaveUserDataRepository {
//inyeccion de dependencia
  final RealtimeDataBaseService _realtimeDataBaseService;

  DefaultSaveUserDataRepository(
      {RealtimeDataBaseService? realtimeDataBaseService})
      : _realtimeDataBaseService =
            realtimeDataBaseService ?? DefaultRealtimeDatabaseService();

  @override
  Future<Result<UserDecodable, Fallas>> saveUserData(
      {required UserBodyParameters parameters}) async {
    if (parameters.localId == null) {
      return Result.failure(Fallas.fromMessage(
          message: AppFailureMessage.unExpectedErrorMessage));
    }
    //Creamos el path
    var path = _Paths.userCollection + parameters.localId!;

    try {
      final result = await _realtimeDataBaseService.putData(
          bodyParamaters: parameters.toMap(),
          path: path); //enviamos el path y el body
      UserDecodable decodable = UserDecodable.fromMap(result);
      return Result.success(decodable);
    } on Fallas catch (f) {
      return Result.failure(f);
    }
  }
}
