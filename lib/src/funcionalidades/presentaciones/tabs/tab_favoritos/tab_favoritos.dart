import 'package:flutter/material.dart';
import 'package:app_donrulo/src/colors/colors.dart';
import 'package:app_donrulo/src/funcionalidades/presentaciones/widgets_personalizados/Headers/header_text.dart';
import 'package:app_donrulo/src/funcionalidades/presentaciones/widgets_personalizados/Cards/card_favoritos.dart';

class FavouriteTab extends StatefulWidget {
  const FavouriteTab({super.key});

  @override
  State<FavouriteTab> createState() => _FavouriteTabState();
}

class _FavouriteTabState extends State<FavouriteTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgGrey,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            leading: const Text(''),
            backgroundColor: Colors.white,
            title: headerText(
                //Texto de cabecera
                texto: 'Mis Favoritos',
                color: primaryColor,
                fontSize: 17,
                fontWeight: FontWeight.w600),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
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
