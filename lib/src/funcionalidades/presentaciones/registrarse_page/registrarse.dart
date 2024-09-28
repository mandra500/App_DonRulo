import 'package:flutter/material.dart';
//colores
import 'package:app_donrulo/src/colors/colors.dart';
//widgets personalizados
import 'package:app_donrulo/src/funcionalidades/presentaciones/widgets_personalizados/Botones_de_regresos/back_botton.dart';
import 'package:app_donrulo/src/funcionalidades/presentaciones/widgets_personalizados/Botones/rounded_botton.dart';
import 'package:app_donrulo/src/funcionalidades/presentaciones/widgets_personalizados/Headers/header_text.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: Builder(builder: (BuildContext context) {
          return backButton(context, Colors.black);
        }),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                headerText(
                    texto: 'Crear una cuenta',
                    color: Theme.of(context).primaryColor,
                    fontSize: 30.0),
                _usernameInput(context),
                _emailInput(context),
                _phoneInput(context),
                _dateOfBirthInput(context),
                _passwordInput(context),
                roundedButton(
                    context: context,
                    labelButton: 'Registrarse',
                    color: orange,
                    funcx: () {}),
                Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 40),
                    child: const Text(
                        'Al hacer clic en registrarse, acepta los todos los términos y condiciones',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 13.0))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//nombre de usuario
Widget _usernameInput(BuildContext context) {
  return Container(
    margin: const EdgeInsets.only(top: 10.0),
    padding: const EdgeInsets.only(left: 20.0),
    decoration: BoxDecoration(
        color: const Color.fromRGBO(142, 142, 147, 1.2),
        borderRadius: BorderRadius.circular(40.0)),
    child: const TextField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          hintText: 'Username',
          border: OutlineInputBorder(borderSide: BorderSide.none)),
    ),
  );
}

// correo electronico
Widget _emailInput(BuildContext context) {
  return Container(
    margin: const EdgeInsets.only(top: 10.0),
    padding: const EdgeInsets.only(left: 20.0),
    decoration: BoxDecoration(
        color: const Color.fromRGBO(142, 142, 147, 1.2),
        borderRadius: BorderRadius.circular(40.0)),
    child: const TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          hintText: 'Correo Electrónico',
          border: OutlineInputBorder(borderSide: BorderSide.none)),
    ),
  );
}

//numero telefono usuario
Widget _phoneInput(BuildContext context) {
  return Container(
    margin: const EdgeInsets.only(top: 10.0),
    padding: const EdgeInsets.only(left: 20.0),
    decoration: BoxDecoration(
        color: const Color.fromRGBO(142, 142, 147, 1.2),
        borderRadius: BorderRadius.circular(40.0)),
    child: const TextField(
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
          hintText: 'Celular',
          border: OutlineInputBorder(borderSide: BorderSide.none)),
    ),
  );
}

// fecha de cumpleaños
Widget _dateOfBirthInput(BuildContext context) {
  return Container(
    margin: const EdgeInsets.only(top: 10.0),
    padding: const EdgeInsets.only(left: 20.0),
    decoration: BoxDecoration(
        color: const Color.fromRGBO(142, 142, 147, 1.2),
        borderRadius: BorderRadius.circular(40.0)),
    child: const TextField(
      keyboardType: TextInputType.datetime,
      decoration: InputDecoration(
          hintText: 'Fecha de Nacimiento',
          border: OutlineInputBorder(borderSide: BorderSide.none)),
    ),
  );
}

//Contraseña
Widget _passwordInput(BuildContext context) {
  return Container(
    margin: const EdgeInsets.only(top: 10.0),
    padding: const EdgeInsets.only(left: 20.0),
    decoration: BoxDecoration(
        color: const Color.fromRGBO(142, 142, 147, 1.2),
        borderRadius: BorderRadius.circular(40.0)),
    child: const TextField(
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
          hintText: 'Contraseña',
          border: OutlineInputBorder(borderSide: BorderSide.none)),
    ),
  );
}
