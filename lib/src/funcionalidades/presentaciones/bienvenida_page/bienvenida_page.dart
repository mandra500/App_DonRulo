//UIS
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:app_donrulo/src/colors/colors.dart';
//widgets_personalizados
import 'package:app_donrulo/src/funcionalidades/presentaciones/widgets_personalizados/Botones/rounded_botton.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  //utiliza toda la pantalla
                  fit: BoxFit.contain,
                  image: NetworkImage(
                    'https://lirp.cdn-website.com/a2c1bca6/dms3rep/multi/opt/2395418-515_logo-c51ce-1920w.png',
                  ),
                ),
              ),
              //intencidad del filtro
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
                child: Container(
                  color: Colors.black.withOpacity(0),
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 150),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: const Text(
                  '¡El auténtico Sabor Trujillano!',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 17.0,
                  ),
                ),
              ),
              roundedButton(
                  context: context,
                  labelButton: 'Iniciar sesión',
                  color: orange,
                  funcx: () {
                    Navigator.pushNamed(context, 'login');
                  }),
              roundedButton(
                context: context,
                labelButton: 'Iniciar sesión con Facebook',
                color: fbButtonColor,
                isWithIcon: true,
                icon: const AssetImage('assets/images/facebook.png'),
                funcx: () => debugPrint("goToFacebook"),
              ),
              //aqui va el botton azul de facebook
            ],
          ),
        ],
      ),
    );
  }
}
