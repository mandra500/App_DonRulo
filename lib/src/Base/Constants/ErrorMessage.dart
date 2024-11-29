abstract class FBFallasMessage {
  //Error Messages
  static String emailNotFoundMessage =
      "No se ha encontrado un registro de usuario asociado a este correo. Es posible que el usuario haya sido eliminado.";
  static String invalidPasswordMessage =
      "La contraseña no es válida o el usuario es incorrecto.";
  static String emailExistMessage =
      "La dirección de correo electrónico ya está siendo utilizada por otra cuenta.";
  static String tooManyAttempsMessage =
      "Hemos bloqueado todas las solicitudes de este dispositivo debido a una actividad inusual. Vuelve a intentarlo más tarde";
  static String invalidIdTokenMessage =
      "La credencial del usuario ya no  es válida. Por favor, inicia sesión nuevamente.";
  static String userNotFoundMessage =
      "No hay ningún registro de usuario que  coincida con la información proporcionada.";
}

abstract class AppFailureMessage {
  // Error Messages
  static String unExpectedErrorMessage =
      "Ha  ocurrido un error inesperado. Por favor, inténtelo de nuevo más tarde.";
}
