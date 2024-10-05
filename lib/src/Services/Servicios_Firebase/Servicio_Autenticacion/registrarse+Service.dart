
import 'package:app_donrulo/src/Services/Servicios_Firebase/Servicio_Autenticacion/interfaz_autenticacion.dart';

class DefaultRegistrarseService extends RegistrarUsuarioService{
  @override
  Future<Map<String, dynamic>> registrarse({required Map<String, dynamic> bodyParameters}) {
    return apiService.getDataFromPostRequest(bodyParameters: bodyParameters, url: endpoint);
  }
  
}