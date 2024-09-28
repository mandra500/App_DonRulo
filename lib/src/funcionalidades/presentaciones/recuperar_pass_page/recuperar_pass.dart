import 'package:app_donrulo/src/funcionalidades/presentaciones/widgets_personalizados/Headers/header_text.dart';
import 'package:flutter/material.dart';
// Colors
import 'package:app_donrulo/src/colors/colors.dart';
// Commons widgets
import 'package:app_donrulo/src/funcionalidades/presentaciones/widgets_personalizados/Botones/rounded_botton.dart';
import 'package:app_donrulo/src/funcionalidades/presentaciones/widgets_personalizados/Botones_de_regresos/back_botton.dart';
import 'package:app_donrulo/src/funcionalidades/presentaciones/widgets_personalizados/Alertas/alerta_dialogo.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: Builder(
          builder: (BuildContext context) {
            return backButton(context, Colors.black);
          },
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Center(
            child: Container(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  headerText(
                    texto: 'Has olvidado tu contraseña',
                    color: Theme.of(context).primaryColor,
                    fontSize: constraints.maxWidth * 0.06,
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Por favor, introduzca su dirección de correo electrónico. Recibirá un enlace para crear una nueva contraseña por correo electrónico.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: constraints.maxWidth * 0.04,
                      ),
                    ),
                  ),
                  buildEmailInput(constraints.maxWidth),
                  roundedButton(
                    context: context,
                    labelButton: 'Enviar',
                    color: orange,
                    funcx: () => _showAlerta(context),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// Caja de texto para el email
Widget buildEmailInput(double maxWidth) {
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

// Boton de enviar para restablecer contraseña
void _showAlerta(BuildContext context) {
  showAlertDialog(
    context,
    const AssetImage('assets/images/lock.png'),
    "Tu contraseña se ha restablecido",
    "En breve recibirá un código para configurar una nueva contraseña.",
    roundedButton(
      context: context,
      labelButton: 'Enviar',
      color: orange,
      funcx: () {
        Navigator.pushNamed(context, 'login');
      },
    ),
  );
}
