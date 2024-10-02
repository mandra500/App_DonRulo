import 'package:app_donrulo/src/funcionalidades/presentaciones/widgets_personalizados/Headers/header_text.dart';
import 'package:flutter/material.dart';

//Image.asset('assets/images/lock.png','Done' 'En breve recibirá un correo electrónico con un código para configurar una nueva contraseña'

void showAlertDialog(BuildContext context, ImageProvider<Object> imagePath,
    String headerTitle, String headerSubTitle, Widget doneButton) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        backgroundColor: Colors.white,
        content: SizedBox(
          //se cambio el tamaño del heigh
          height: 350,
          child: Column(
            children: [
              Image(
                image: imagePath,
                width: 130,
                height: 130,
              ),
              Container(
                margin: const EdgeInsets.all(20.0),
                child: headerText(
                    textAlign: TextAlign.center,
                    texto: headerTitle,
                    color: Theme.of(context).primaryColor,
                    fontSize: 20.0),
              ),
              Container(
                //se cambio la propiedad .all a .only
                margin: const EdgeInsets.only(top: 15.0),
                child: Text(
                  headerSubTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 15.0),
                ),
              ),
              doneButton
            ],
          ),
        ),
      );
    },
  );
}
