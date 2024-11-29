import 'package:app_donrulo/src/Services/FirebaseService/AuthFirebaseServices/Interfaces/AuthFirebaseInterfaces.dart';

class DefaultSignInService extends SignInService {
  @override
  Future<Map<String, dynamic>> signIn(
      {required Map<String, dynamic> bodyParameters}) {
    return apiService.getDataFromPostRequest(
        bodyParameters: bodyParameters, url: endpoint);
  }
}
