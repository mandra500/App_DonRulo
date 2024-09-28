import 'package:app_donrulo/src/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:app_donrulo/src/funcionalidades/presentaciones/widgets_personalizados/Headers/header_text.dart';
import 'package:app_donrulo/src/funcionalidades/presentaciones/widgets_personalizados/Botones_de_regresos/back_botton.dart';
import 'package:app_donrulo/src/funcionalidades/presentaciones/widgets_personalizados/Cards/card_favoritos.dart';

class CollectionDetailPage extends StatelessWidget {
  const CollectionDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 150, // tamaño de expanción de l aimagen
            backgroundColor: orange,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  const Image(
                      width: double.infinity,
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://www.mediafire.com/convkey/170b/iu7gebr4ifkezie9g.jpg')),
                  Container(
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(0, 0, 0, 1.3),
                          borderRadius: BorderRadius.circular(10)),
                      width: double.infinity,
                      height: double.infinity),
                  Center(
                    child: headerText(
                        fontSize: 35.0,
                        texto: 'Entradas',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.center),
                  )
                ],
              ),
            ),
            leading: Builder(builder: (BuildContext context) {
              return backButton(
                  context, Colors.white); //se utiliza la felcha hacia atras
            }),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment
                            .topLeft, // el texto se ubica ala izquierda
                        margin: const EdgeInsets.symmetric(vertical: 20.0),
                        child: headerText(
                          texto: '8 entradas',
                          color: const Color.fromRGBO(51, 58, 77, 1.0),
                          fontWeight: FontWeight.w600,
                          fontSize: 17,
                        ),
                      ),
                      Column(
                        children: [
                          favoritosCard(
                              context: context,
                              image: const NetworkImage(
                                  'https://www.mediafire.com/convkey/49ee/3008ln9rk93m9289g.jpg'),
                              title: 'Leche de Tigre',
                              subtitle: 'a base de pescado y pota',
                              review: '4.8',
                              ratings: "(233 votos)",
                              buttonText: 'Delivery',
                              hasActionButton: true,
                              isFavorito: true),
                          favoritosCard(
                              context: context,
                              image: const NetworkImage(
                                  'https://www.mediafire.com/convkey/53af/ju8hc47q4nthonyzg.jpg'),
                              title: 'Ceviche Mixto',
                              subtitle: 'a base de pescado y mariscos',
                              review: '4.8',
                              ratings: "(233 votos)",
                              buttonText: 'Delivery',
                              hasActionButton: true,
                              isFavorito: false),
                          favoritosCard(
                              context: context,
                              image: const NetworkImage(
                                  'https://www.mediafire.com/convkey/16fc/3qswl8tj7ni56ac9g.jpg'),
                              title: 'Papa Huancaina',
                              subtitle: 'A base de papa y crema huancaina',
                              review: '4.8',
                              ratings: "(233 votos)",
                              buttonText: 'Delivery',
                              hasActionButton: true,
                              isFavorito: false),
                        ],
                      )
                    ],
                  ),
                );
              },
              childCount:
                  1, // Aquí debes ajustar el número de elementos en la lista
            ),
          )
        ],
      ),
    );
  }
}
