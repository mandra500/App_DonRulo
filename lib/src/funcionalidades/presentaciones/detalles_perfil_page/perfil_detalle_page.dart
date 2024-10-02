import 'package:app_donrulo/src/colors/colors.dart';
import 'package:app_donrulo/src/funcionalidades/presentaciones/detalles_perfil_page/componentes/textos_vistas.dart';
import 'package:app_donrulo/src/funcionalidades/presentaciones/detalles_perfil_page/componentes/vista_avatar.dart';
import 'package:app_donrulo/src/funcionalidades/presentaciones/widgets_personalizados/Botones_de_regresos/back_botton.dart';
import 'package:app_donrulo/src/funcionalidades/presentaciones/widgets_personalizados/Headers/header_text.dart';
import 'package:app_donrulo/src/utils/estilos/box_decoraciones_shadows.dart';
import 'package:app_donrulo/src/utils/extensiones/screen_size.dart';
import 'package:flutter/material.dart';

class DetallePerfilPage extends StatefulWidget {
  const DetallePerfilPage({super.key});

  @override
  State<DetallePerfilPage> createState() => _DetallePerfilPageState();
}

class _DetallePerfilPageState extends State<DetallePerfilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgGrey,
      appBar: AppBar(
        title: headerText(texto: 'Editar Perfil', fontSize: 17),
        backgroundColor: Colors.white,
        elevation: 0.4,
        leading: Builder(builder: (BuildContext context) {
          return backButton(context, Colors.black);
        }),
        actions: [
          GestureDetector(
            onTap: () {
              //navegar hacia atras ... por definir mas adelante
              Navigator.pop(context);
            },
            child: Container(
              padding: const EdgeInsets.only(top: 20, right: 15.0),
              child: headerText(
                texto: 'Guardar',
                color: orange,
                fontWeight: FontWeight.w500,
                fontSize: 17.0,
              ),
            ),
          )
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
                //array de widgets
                [
                  Container(
                    margin: EdgeInsets.only(
                      top: context.getScreenHeight(multiplier: 0.1),
                      left: 15,
                      right: 15,
                    ),
                    decoration: createBoxDecorationWithShadows(
                        borderRadius: borderRadius),
                    width: context.getScreenWidth(),
                    height: context.getScreenHeight(multiplier: 0.65),
                    child: Column(
                      children: [
                        Transform.translate(
                          offset: const Offset(0, -60), // move up by 20
                          child: const VistaAvatar(
                              backgroundImage:
                                  'https://arsitektur-hmaunivbosowa.weebly.com/uploads/1/0/5/9/105902765/7_2_orig.png'),
                        ),
                        const TextFieldProfileVista()
                      ],
                    ),
                  )
                ]),
          )
        ],
      ),
    );
  }
}
