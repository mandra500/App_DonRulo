import 'package:flutter/material.dart';
import 'package:app_donrulo/src/funcionalidades/presentaciones/widgets_personalizados/Botones_de_regresos/back_botton.dart';
import 'package:app_donrulo/src/funcionalidades/presentaciones/widgets_personalizados/Headers/header_text.dart';

class CollectionsPage extends StatelessWidget {
  const CollectionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.white,
            title: headerText(fontSize: 17, texto: 'Nuestra Carta'),
            leading: Builder(builder: (BuildContext context) {
              return backButton(context, Colors.black);
            }),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            sliver: SliverGrid.count(
              crossAxisCount: 2,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              children: [
                _card(context),
                _card(context),
                _card(context),
                _card(context),
                _card(context),
                _card(context),
                _card(context),
                _card(context),
                _card(context),
                _card(context),
                _card(context),
                _card(context),
                _card(context),
                _card(context),
                _card(context),
                _card(context),
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget _card(BuildContext context) {
  return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
            context, 'collections-detail'); //navegación a la colection_detail
      },
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: const Image(
                width: 165,
                height: 190,
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://www.mediafire.com/convkey/170b/iu7gebr4ifkezie9g.jpg')),
          ),
          Container(
            //opacidad
            width: 165,
            height: 190,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(0, 0, 0, 1.3),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(right: 5, bottom: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                headerText(
                    fontSize: 18,
                    texto: 'Entradas',
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                headerText(
                    fontSize: 15,
                    texto: '8 platillos',
                    color: Colors.white,
                    fontWeight: FontWeight.w300)
              ],
            ),
          )
        ],
      ));
}
