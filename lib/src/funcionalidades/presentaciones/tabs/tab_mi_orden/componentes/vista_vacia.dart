import 'package:app_donrulo/src/colors/colors.dart';
import 'package:app_donrulo/src/funcionalidades/presentaciones/widgets_personalizados/Headers/header_text.dart';
import 'package:flutter/material.dart';

class EmptyView extends StatelessWidget {
  const EmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgGrey,
      appBar: AppBar(
        elevation: 0.5,
        leading: const Text(''),
        backgroundColor: Colors.white,
        title: headerText(
          texto: 'Mi Orden',
          color: primaryColor,
          fontSize: 17,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              width: 216,
              height: 216,
              image: AssetImage('assets/images/emptyOrder.png'),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: headerText(
                  texto: 'Cesta vacia',
                  color: gris,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            Container(
                margin: const EdgeInsets.only(top: 20.0),
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: headerText(
                  texto:
                      '¡Siempre se está cocinando buena comida! ¡Anímate y pide algunos platos deliciosos de nuestra carta!',
                  textAlign: TextAlign.center,
                  color: gris,
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ))
          ],
        ),
      ),
    );
  }
}
