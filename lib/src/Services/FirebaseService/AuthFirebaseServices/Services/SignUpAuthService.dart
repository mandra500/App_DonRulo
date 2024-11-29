import 'package:app_donrulo/src/Services/FirebaseService/AuthFirebaseServices/Interfaces/AuthFirebaseInterfaces.dart';

class DefaultRegistrarseService extends SignUpService {
  @override
  Future<Map<String, dynamic>> signUp(
      {required Map<String, dynamic> bodyParameters}) {
    return apiService.getDataFromPostRequest(
        bodyParameters: bodyParameters, url: endpoint);
  }
}
