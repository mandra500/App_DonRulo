import 'package:app_donrulo/src/colors/colors.dart';
import 'package:app_donrulo/src/funcionalidades/presentaciones/widgets_personalizados/Headers/header_text.dart';

import 'package:flutter/material.dart';

Widget popularesCard({
  required BuildContext context,
  double marginTop = 0.0,
  double marginRight = 0.0,
  double marginBottom = 0.0,
  double marginLeft = 1.0,
  ImageProvider<Object>? image,
  required String title,
  required String subtitle,
  required String review,
  required String ratings,
  String buttonText = '',
  required bool hasActionButton,
}) {
  final screenWidth = MediaQuery.of(context).size.width;

  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(
          top: marginTop,
          right: marginRight,
          bottom: marginBottom,
          left: marginLeft,
        ),
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image(
                width: screenWidth * 0.2,
                height: screenWidth * 0.2,
                fit: BoxFit.cover,
                image:
                    image ?? const AssetImage('assets/images/placeholder.png'),
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: screenWidth * 0.2,
                    height: screenWidth * 0.2,
                    color: Colors.grey,
                    child: const Icon(Icons.error, color: Colors.red),
                  );
                },
              ),
            ),
            const SizedBox(
                width: 10), // Añadir un espacio entre la imagen y el texto
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 7.0),
                    child: headerText(
                      texto: title,
                      color: Colors.black,
                      fontSize: screenWidth * 0.05,
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(bottom: 2),
                    child: Text(
                      subtitle,
                      style: TextStyle(
                        color: gris,
                        fontWeight: FontWeight.w500,
                        fontSize: screenWidth * 0.04,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.star,
                          color: Colors.yellow, size: screenWidth * 0.06),
                      const SizedBox(width: 5), // Añadir un pequeño espacio
                      Text(
                        review,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: screenWidth * 0.035,
                        ),
                      ),
                      const SizedBox(width: 5), // Añadir un pequeño espacio
                      Text(
                        ratings,
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          fontSize: screenWidth * 0.028,
                        ),
                      ),
                      const Spacer(),
                      if (hasActionButton)
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            backgroundColor: orange,
                          ),
                          child: Text(
                            buttonText,
                            style: TextStyle(
                              fontSize: screenWidth * 0.030,
                              color: Colors.white,
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
