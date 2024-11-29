import 'package:app_donrulo/src/Base/ApiService/AppError.dart';
import 'package:app_donrulo/src/Base/Constants/ErrorMessage.dart';
import 'package:app_donrulo/src/funcionalidades/data/Repositorios/User/SaveUserDataRepository.dart';
import 'package:app_donrulo/src/funcionalidades/data/Repositorios/User/UserBodyParameters.dart';
import 'package:app_donrulo/src/funcionalidades/dominios/CasoDeUso/User/SaveUserDataUseCase/SaveUserDataUseCaseParameters.dart';
import 'package:app_donrulo/src/funcionalidades/dominios/Entities/User/UserEntity.dart';
import 'package:app_donrulo/src/funcionalidades/dominios/Interfaces/interfaces.dart';
import 'package:app_donrulo/src/utils/Helpers/ResultType/ResultType.dart';

abstract class SaveUserDataUseCase {
  Future<Result<UserEntity, Fallas>> execute(
      {required SaveUserDataUseCaseParameters parameters});
}

class DefaultSaveUserDataUseCase extends SaveUserDataUseCase {
//inyeccion de dependencia
  final SaveUserDataRepository _saveUserDataRepository;

  DefaultSaveUserDataUseCase({SaveUserDataRepository? saveUserDataRepository})
      : _saveUserDataRepository =
            saveUserDataRepository ?? DefaultSaveUserDataRepository();

  @override
  Future<Result<UserEntity, Fallas>> execute(
      {required SaveUserDataUseCaseParameters parameters}) {
    UserBodyParameters parameters0 = UserBodyParameters(
        localId: parameters.localId,
        role: parameters.role?.toShortString(),
        username: parameters.username,
        email: parameters.email,
        phone: parameters.phone,
        dateOfBirth: parameters.dateOfBirth,
        startDate: parameters.startDate,
        photo: parameters.photo,
        shippingAddress: parameters.shippingAddress,
        billingAddress: parameters.billingAddress,
        idToken: parameters.idToken);

    return _saveUserDataRepository
        .saveUserData(parameters: parameters0)
        .then((result) {
      switch (result.status) {
        case ResultStatus.success:
          if (result.value == null) {
            return Result.failure(Fallas.fromMessage(
                message: AppFailureMessage.unExpectedErrorMessage));
          }
          var entity = UserEntity.fromMap(result.value!.toMap());
          return Result.success(entity);
        case ResultStatus.error:
          return Result.failure(result.error);
      }
    });
  }
}
