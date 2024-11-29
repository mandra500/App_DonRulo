import 'package:app_donrulo/src/Base/ApiService/AppError.dart';
import 'package:app_donrulo/src/Base/Constants/ErrorMessage.dart';
import 'package:app_donrulo/src/funcionalidades/data/Repositorios/Autenticacion/SingUpRepository/SignUpRepository.dart';
import 'package:app_donrulo/src/funcionalidades/data/Repositorios/Autenticacion/SingUpRepository/SignUpRepositoryParameters.dart';
import 'package:app_donrulo/src/funcionalidades/dominios/CasoDeUso/Auth/SignUpUseCase/SignUpUseCaseParameters.dart';
import 'package:app_donrulo/src/funcionalidades/dominios/CasoDeUso/User/SaveUserDataUseCase/SaveUserDataUseCase.dart';
import 'package:app_donrulo/src/funcionalidades/dominios/CasoDeUso/User/SaveUserDataUseCase/SaveUserDataUseCaseParameters.dart';
import 'package:app_donrulo/src/funcionalidades/dominios/Entities/Authenticacion/SignUpEntity/SignUpEntity.dart';
import 'package:app_donrulo/src/funcionalidades/dominios/Entities/User/UserEntity.dart';
import 'package:app_donrulo/src/funcionalidades/dominios/Interfaces/interfaces.dart';
import 'package:app_donrulo/src/utils/Helpers/Dates/DateHelpers.dart';
import 'package:app_donrulo/src/utils/Helpers/ResultType/ResultType.dart';
import 'package:app_donrulo/src/utils/Helpers/UserPhotos/UserPhotosHelpers.dart';

abstract class SignUpUseCase {
  Future<Result<SignUpEntity, Fallas>> execute(
      {required SignUpUseCaseParameters params});
}

class DefaultSignUpUseCase extends SignUpUseCase {
//inyeccion de dependencia
  final SignUpRepository _signUpRepository;
  final SaveUserDataUseCase _saveUserDataUseCase;

  DefaultSignUpUseCase(
      {SignUpRepository? signUpRepository,
      SaveUserDataUseCase? saveUserDataUseCase})
      : _signUpRepository = signUpRepository ?? DefaultSignUpRepository(),
        _saveUserDataUseCase =
            saveUserDataUseCase ?? DefaultSaveUserDataUseCase();

  @override
  Future<Result<SignUpEntity, Fallas>> execute(
      {required SignUpUseCaseParameters params}) {
    return _signUpRepository
        .signUp(
            params: SignUpRepositoryParameters(
                email: params.email, password: params.password))
        .then((result) {
      switch (result.status) {
        case ResultStatus.success:
          //Null check
          if (result.value == null) {
            return Result.failure(Fallas.fromMessage(
                message: AppFailureMessage.unExpectedErrorMessage));
          }
          // return the result
          SignUpEntity entity = SignUpEntity.fromMap(result.value!.toMap());
          return saveUserDataInDataBase(params: params, entity: entity);
        case ResultStatus.error:
          return Result.failure(result.error);
      }
    });
  }
}

extension on DefaultSignUpUseCase {
  Future<Result<SignUpEntity, Fallas>> saveUserDataInDataBase(
      {required SignUpUseCaseParameters params, required SignUpEntity entity}) {
    SaveUserDataUseCaseParameters params0 = SaveUserDataUseCaseParameters(
        localId: entity.localId,
        role: UserRole.user,
        username: params.username,
        phone: params.phone,
        dateOfBirth: params.date,
        startDate: DateHelpers.getStartDate(),
        photo: UserPhotoHelper.defaultUserPhoto,
        shippingAddress: '',
        billingAddress: '',
        idToken: entity.idToken);
    return _saveUserDataUseCase.execute(parameters: params0).then((result) {
      switch (result.status) {
        case ResultStatus.success:
          return Result.success(entity);
        case ResultStatus.error:
          return Result.failure(result.error);
      }
    });
  }
}
