import 'package:app_donrulo/src/colors/colors.dart';
import 'package:app_donrulo/src/utils/extensiones/screen_size.dart';
import 'package:flutter/material.dart';

class TextFieldProfileVista extends StatelessWidget {
  const TextFieldProfileVista({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _createTextFieldUsername(context),
        _createTextFieldEmail(context),
        _createTextFieldPhone(context),
        _createTextFieldDate(context),
        _createTextFieldDeliveryAdress(context)
      ],
    );
  }
}

// metodo para el usuario
Widget _createTextFieldUsername(BuildContext context) {
  return Container(
    width: context.getScreenWidth(multiplier: 0.90),
    decoration: BoxDecoration(
        border:
            Border(bottom: BorderSide(color: Theme.of(context).dividerColor))),
    child: const ListTile(
        title: TextField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: 'Username',
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: gris)),
      ),
    )),
  );
}

//metodo email
Widget _createTextFieldEmail(BuildContext context) {
  return Container(
    width: context.getScreenWidth(multiplier: 0.90),
    decoration: BoxDecoration(
        border:
            Border(bottom: BorderSide(color: Theme.of(context).dividerColor))),
    child: const ListTile(
        title: TextField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: 'E-mail',
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: gris)),
      ),
    )),
  );
}

//metodo para el telefono
Widget _createTextFieldPhone(BuildContext context) {
  return Container(
    width: context.getScreenWidth(multiplier: 0.90),
    decoration: BoxDecoration(
        border:
            Border(bottom: BorderSide(color: Theme.of(context).dividerColor))),
    child: const ListTile(
        title: TextField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: 'Phone',
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: gris)),
      ),
    )),
  );
}

//meoto fecha nacimiento
Widget _createTextFieldDate(BuildContext context) {
  return Container(
    width: context.getScreenWidth(multiplier: 0.90),
    decoration: BoxDecoration(
        border:
            Border(bottom: BorderSide(color: Theme.of(context).dividerColor))),
    child: const ListTile(
        title: TextField(
      keyboardType: TextInputType.datetime,
      decoration: InputDecoration(
        hintText: 'Fecha de Nacimiento',
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: gris)),
      ),
    )),
  );
}

//meotod de dirección de delivery
Widget _createTextFieldDeliveryAdress(BuildContext context) {
  return Container(
    width: context.getScreenWidth(multiplier: 0.90),
    decoration: BoxDecoration(
        border:
            Border(bottom: BorderSide(color: Theme.of(context).dividerColor))),
    child: const ListTile(
        title: TextField(
      keyboardType: TextInputType.text,
      maxLines: 3,
      decoration: InputDecoration(
        hintText: 'Dirección de entrega',
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: gris)),
      ),
    )),
  );
}
