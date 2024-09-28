import 'package:flutter/material.dart';

Widget roundedButton({
  required BuildContext context,
  double width = 300.0,
  double height = 70.0,
  double radius = 20.0,
  bool isWithIcon = false,
  ImageProvider<Object>? icon,
  required String labelButton,
  required Color color,
  required Function()? funcx,
}) {
  return Container(
    width: width,
    height: height,
    padding: const EdgeInsets.only(top: 20),
    child: isWithIcon
        ? _raisedButtonWithIcon(
            radius, icon, labelButton, context, color, funcx)
        : _raisedButtonNotIcon(radius, labelButton, context, color, funcx),
  );
}

Widget _raisedButtonWithIcon(double radius, ImageProvider<Object>? icon,
    String labelButton, BuildContext context, Color color, Function()? funcx) {
  return ElevatedButton.icon(
    onPressed: funcx,
    style: ElevatedButton.styleFrom(
      backgroundColor: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
    ),
    icon: Image(image: icon!),
    label: Text(
      labelButton,
      style: const TextStyle(color: Colors.white),
    ),
  );
}

Widget _raisedButtonNotIcon(double radius, String labelButton,
    BuildContext context, Color color, Function()? funcx) {
  return ElevatedButton(
    onPressed: funcx,
    style: ElevatedButton.styleFrom(
      backgroundColor: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
    ),
    child: Text(
      labelButton,
      style: const TextStyle(color: Colors.white),
    ),
  );
}
