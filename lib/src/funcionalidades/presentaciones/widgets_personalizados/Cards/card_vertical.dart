//colors
import 'package:app_donrulo/src/colors/colors.dart';
import 'package:app_donrulo/src/funcionalidades/presentaciones/widgets_personalizados/Headers/header_text.dart';
//commons widgets

import 'package:flutter/material.dart';

Widget cardVertical(
    {required BuildContext context,
    required double width,
    required double height,
    required ImageProvider<Object> image,
    required String title,
    required String subtitle}) {
  return Container(
    margin: const EdgeInsets.all(5.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Image(
              width: width, height: height, fit: BoxFit.cover, image: image),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 5.0),
              child: headerText(
                  texto: title, fontWeight: FontWeight.w500, fontSize: 18.0),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5.0),
              child: headerText(
                  texto: subtitle,
                  color: gris,
                  fontWeight: FontWeight.w500,
                  fontSize: 10.0),
            )
          ],
        )
      ],
    ),
  );
}
