import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:app_donrulo/src/colors/colors.dart';
import 'package:app_donrulo/src/funcionalidades/presentaciones/widgets_personalizados/Botones/rounded_botton.dart';
import 'package:app_donrulo/src/funcionalidades/presentaciones/widgets_personalizados/Botones_de_regresos/back_botton.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.white));
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 350,
                  width: 350,
                  child: Image.network(
                    'https://lirp.cdn-website.com/a2c1bca6/dms3rep/multi/opt/2395418-515_logo-c51ce-1920w.png',
                  ),
                ),
                Positioned(
                  top: 40,
                  left: -10,
                  child: backButton(context, Colors.black),
                ),
              ],
            ),
            Transform.translate(
              offset: const Offset(0.0, -50),
              child: Container(
                width: double.infinity,
                height: 500,
                decoration: BoxDecoration(
                  color: Colors.white60,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                    right: 20.0,
                    top: 40.0,
                    bottom: 20.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '¡Bienvenido una vez más!',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,
                        ),
                      ),
                      const SizedBox(height: 30, width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Inicia sesión en tu cuenta',
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                              fontSize: 16.0,
                            ),
                          ),
                          const SizedBox(height: 30),
                          buildEmailInput(),
                          buildPasswordInput(),
                          roundedButton(
                              context: context,
                              labelButton: 'Iniciar sesión',
                              color: orange,
                              funcx: () {
                                Navigator.pushNamed(context, 'tabs');
                              }),
                          Container(
                            margin: const EdgeInsets.only(top: 30.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, 'forgot-password');
                              },
                              child: const Text(
                                '¿Olvidaste tu contraseña?',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15.0),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 30.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'No tiene cuenta? ',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15.0),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, 'sign-up');
                                  },
                                  child: const Text(
                                    'Registrate ahora!',
                                    style: TextStyle(
                                        color: Colors.orange,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 15.0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

//caja de texto del correo
  Widget buildEmailInput() {
    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      padding: const EdgeInsets.only(left: 20.0),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(142, 142, 147, 1.2),
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: const TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: 'Email',
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

// caja de texto para la contraseña
  Widget buildPasswordInput() {
    return Container(
      margin: const EdgeInsets.only(top: 15.0),
      padding: const EdgeInsets.only(left: 20.0),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(142, 142, 147, 1.2),
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: const TextField(
        obscureText: true,
        decoration: InputDecoration(
          hintText: 'Contraseña',
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
