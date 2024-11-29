//abstraccion del servicio
//Base del Servicio
abstract class BaseRealtimeService {
  String baseUrl = "https://donrulo-app-default-rtdb.firebaseio.com/";
  String endUrl = ".json";
}

abstract class RealtimeDataBaseService extends BaseRealtimeService {
  Future<Map<String, dynamic>> postData(
      {required Map<String, dynamic> bodyParamaters, required String path});

  Future<Map<String, dynamic>> putData(
      {required Map<String, dynamic> bodyParamaters, required String path});

  Future<Map<String, dynamic>> getData({required String path});
}
