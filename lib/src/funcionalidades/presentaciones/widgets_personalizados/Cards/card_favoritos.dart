import 'package:app_donrulo/src/funcionalidades/presentaciones/widgets_personalizados/Headers/header_text.dart';
import 'package:app_donrulo/src/utils/estilos/box_decoraciones_shadows.dart';
import 'package:flutter/material.dart';
import 'package:app_donrulo/src/colors/colors.dart';

Widget favoritosCard({
  required BuildContext context,
  double marginTop = 15.0,
  double marginRight = 0.0,
  double marginButton = 0.0,
  double marginLeft = 0.0,
  ImageProvider<Object>? image,
  required String title,
  required String subtitle,
  required String review,
  required String ratings,
  String buttonText = '',
  required bool hasActionButton,
  bool isFavorito = true,
}) {
  return Container(
    margin: EdgeInsets.only(
      top: marginTop,
      right: marginRight,
      bottom: marginButton,
      left: marginLeft,
    ),
    padding: const EdgeInsets.only(left: 5, top: 5, bottom: 20),
    width: double.infinity,
    //se cambio todo el codigo de la decoración ahora viene desde utils
    decoration: createBoxDecorationWithShadows(borderRadius: borderRadius),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(
                top: 20.0), // Ajusta esta cantidad para centrar la imagen
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image(
                width: 90.0,
                height: 90.0,
                fit: BoxFit.cover,
                image: image!,
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                      margin: const EdgeInsets.symmetric(vertical: 1.0),
                      child: headerText(
                          texto: title,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14)),
                  const SizedBox(
                    width: 60.0, // posición del icono bookmark
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.bookmark,
                        size: 35.0, // tamaño
                        color: isFavorito ? rosa : Colors.grey[300],
                      ),
                      onPressed: () {})
                ],
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(bottom: 7.0),
                child: headerText(
                    texto: subtitle,
                    color: gris,
                    fontWeight: FontWeight.w500,
                    fontSize: 13.0),
              ),
              Row(
                children: [
                  const Icon(Icons.star, color: camarillo, size: 16),
                  headerText(
                      texto: review,
                      fontWeight: FontWeight.w500,
                      fontSize: 14.0),
                  headerText(
                      texto: ratings,
                      color: gris,
                      fontWeight: FontWeight.w500,
                      fontSize: 10.0),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 25.0), // posición del botón
                    width: 100.0, // tamaño del botón
                    height: 25.0,
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          backgroundColor: orange,
                        ),
                        child: headerText(
                            texto: buttonText,
                            fontSize: 11.0,
                            color: Colors.white)),
                  )
                ],
              )
            ],
          ),
        )
        // Aquí puedes agregar más elementos en la columna si es necesario
      ],
    ),
  );
}
