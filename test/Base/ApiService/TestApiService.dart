import 'package:app_donrulo/src/Base/ApiService/ApiService.dart';
import 'package:flutter_test/flutter_test.dart';
import 'Mocks/TestApiMocks.dart';

abstract class _Constantes {
  static Map<String, String> defaultHeaders = {
    'Content-Type': 'application/json; charset=UTF-8'
  };
  static String postEndpoint =
      "https://jsonplaceholder.typicode.com/posts"; // -- POST
  static String getEndpoint =
      "https://jsonplaceholder.typicode.com/posts/1"; // --GET
  static String putEndpoint =
      "https://jsonplaceholder.typicode.com/posts/1"; // --PUT
}

void main() {
  //Esta la api que se va a testear
  final ApiService testApiService = DefaultApiService();

  //Test de Conexion a la Api Service
  group('Latido Digital en curso...', () {
    //Latido Digital Establecido para POST
    test('Latido Digital Establecido para POST desde jsonplaceholder',
        () async {
      final bodyParams = CorrectPostBody(title: 'foo', body: 'bar', userId: 1);
      final result = await testApiService.getDataFromPostRequest(
          bodyParameters: bodyParams.toMap(),
          url: _Constantes.postEndpoint,
          headers: _Constantes.defaultHeaders);

      expect(result, Map.from(result));
    });

    //Latido Digital Establecido para GET
    test('Latido Digital Establecido para GET desde jsonplaceholder', () async {
      final result = await testApiService.getDataFromGetRequest(
          url: _Constantes.getEndpoint);

      expect(result, Map.from(result));
    });
    //Latido Digital Establecido para PUT
    test('Latido Digital Establecido para PUT desde jsonplaceholder', () async {
      final body = CorrectPutBody(id: 1, title: 'foo', body: 'bar', userId: 1);
      final result = await testApiService.getDataFromPutRequest(
          bodyParameters: body.toMap(),
          url: _Constantes.putEndpoint,
          headers: _Constantes.defaultHeaders);
      expect(result, Map.from(result));
    });
  });
}

//web api key AIzaSyA6QHI0b3nmpnRTCAXbxrQHD9gbYMWv48w