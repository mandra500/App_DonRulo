
import 'package:app_donrulo/src/Services/Servicios_Firebase/Servicio_Autenticacion/interfaz_autenticacion.dart';

class DefaultIniciarSesionService extends IniciarUsuarioService {
  @override
  Future<Map<String, dynamic>> iniciarsesion({required Map<String, dynamic> bodyParameters}) {
    return apiService.getDataFromPostRequest(bodyParameters: bodyParameters, url: endpoint);
  }

}