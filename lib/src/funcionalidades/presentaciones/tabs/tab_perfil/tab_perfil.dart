import 'package:app_donrulo/src/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:app_donrulo/src/funcionalidades/presentaciones/widgets_personalizados/Headers/header_text.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'perfil-detail'),
            child: _header()),
        _firtsBlok()
      ]),
    );
  }
}

//función cabecera (header)
Widget _header() {
  return Container(
    height: 250,
    color: bgGrey, // Asegúrate de que bgGrey esté definido
    padding: const EdgeInsets.all(50),
    child: Row(
      children: [
        const CircleAvatar(
          backgroundImage: NetworkImage(
              'https://arsitektur-hmaunivbosowa.weebly.com/uploads/1/0/5/9/105902765/7_2_orig.png'),
          radius: 50,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20.0),
              child: Row(
                children: [
                  headerText(
                      texto: 'Juan Perez',
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                  IconButton(
                    icon: const Icon(
                      Icons.chevron_right,
                      color: gris, // Asegúrate de que gris esté definido
                    ),
                    onPressed: () {},
                  )
                ],
              ),
            ),
            Container(
              height: 25,
              margin: const EdgeInsets.only(left: 20.0),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: rosa, // Color del botón
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                ),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 5),
                      child: headerText(
                        // Agregado dentro de un child
                        texto: 'Miembro VIP',
                        color: Colors.white,
                        fontSize: 11,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        )
      ],
    ),
  );
}

// primer bloqude de opciones del perfil
Widget _firtsBlok() {
  return Container(
    padding: const EdgeInsets.all(10),
    child: Column(
      children: [
        ListTile(
          leading: const Image(
            image: AssetImage('assets/images/noti.png'),
            width: 29,
            height: 29,
          ),
          title: headerText(
              texto: 'Notificaciones',
              fontSize: 15,
              fontWeight: FontWeight.w400),
          trailing: const Icon(
            Icons.chevron_right,
            color: gris,
          ),
        ),
        ListTile(
          leading: const Image(
            image: AssetImage('assets/images/payicon.png'),
            width: 29,
            height: 29,
          ),
          title: headerText(
              texto: 'Metodos de Pago',
              fontSize: 15,
              fontWeight: FontWeight.w400),
          trailing: const Icon(
            Icons.chevron_right,
            color: gris,
          ),
        ),
        ListTile(
          leading: const Image(
            image: AssetImage('assets/images/rewardicon.png'),
            width: 29,
            height: 29,
          ),
          title: headerText(
              texto: 'Historial de Pedidos',
              fontSize: 15,
              fontWeight: FontWeight.w400),
          trailing: const Icon(
            Icons.chevron_right,
            color: gris,
          ),
        ),
        ListTile(
          leading: const Image(
            image: AssetImage('assets/images/promoicon.png'),
            width: 29,
            height: 29,
          ),
          title: headerText(
              texto: 'Códigos promocionales',
              fontSize: 15,
              fontWeight: FontWeight.w400),
          trailing: const Icon(
            Icons.chevron_right,
            color: gris,
          ),
        ),
        ListTile(
          leading: const Image(
            image: AssetImage('assets/images/settingicon.png'),
            width: 29,
            height: 29,
          ),
          title: headerText(
              texto: 'Configuración',
              fontSize: 15,
              fontWeight: FontWeight.w400),
          trailing: const Icon(
            Icons.chevron_right,
            color: gris,
          ),
        ),
        ListTile(
          leading: const Image(
            image: AssetImage('assets/images/helpicon.png'),
            width: 29,
            height: 29,
          ),
          title: headerText(
              texto: 'Centro de Ayuda',
              fontSize: 15,
              fontWeight: FontWeight.w400),
          trailing: const Icon(
            Icons.chevron_right,
            color: gris,
          ),
        ),
        ListTile(
          leading: const Image(
            image: AssetImage('assets/images/acuerdo-de-contrato.png'),
            width: 29,
            height: 29,
          ),
          title: headerText(
              texto: 'Terminos y Condiciones',
              fontSize: 15,
              fontWeight: FontWeight.w400),
          trailing: const Icon(
            Icons.chevron_right,
            color: gris,
          ),
        ),
        ListTile(
          leading: const Image(
            image: AssetImage('assets/images/abouticon.png'),
            width: 29,
            height: 29,
          ),
          title: headerText(
              texto: 'About us', fontSize: 15, fontWeight: FontWeight.w400),
          trailing: const Icon(
            Icons.chevron_right,
            color: gris,
          ),
        ),
      ],
    ),
  );
}
