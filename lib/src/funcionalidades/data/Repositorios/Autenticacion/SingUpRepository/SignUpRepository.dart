import 'package:app_donrulo/src/Base/ApiService/AppError.dart';
import 'package:app_donrulo/src/Services/FirebaseService/AuthFirebaseServices/Decodables/SignUpDecorable.dart';
import 'package:app_donrulo/src/Services/FirebaseService/AuthFirebaseServices/Interfaces/AuthFirebaseInterfaces.dart';
import 'package:app_donrulo/src/Services/FirebaseService/AuthFirebaseServices/Services/SignUpAuthService.dart';
import 'package:app_donrulo/src/funcionalidades/data/Repositorios/Autenticacion/SingUpRepository/SignUpRepositoryParameters.dart';
import 'package:app_donrulo/src/funcionalidades/dominios/Interfaces/interfaces.dart';
import 'package:app_donrulo/src/utils/Helpers/ResultType/ResultType.dart';

class DefaultSignUpRepository extends SignUpRepository {
//Dependencias
  final SignUpService _signUpService;

  DefaultSignUpRepository({SignUpService? signUpService})
      : _signUpService = signUpService ?? DefaultRegistrarseService();

  @override
  Future<Result<SignUpDecorable, Fallas>> signUp(
      {required SignUpRepositoryParameters params}) async {
    try {
      final result =
          await _signUpService.signUp(bodyParameters: params.toMap());
      SignUpDecorable decorable = SignUpDecorable.fromMap(result);
      return Result.success(decorable);
    } on Fallas catch (f) {
      return Result.failure(Fallas.getFirebaseAuthErrorMessage(error: f.error));
    }
  }
}
