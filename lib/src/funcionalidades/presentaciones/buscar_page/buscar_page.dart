import 'package:flutter/material.dart';
import 'package:app_donrulo/src/colors/colors.dart';
import 'package:app_donrulo/src/funcionalidades/presentaciones/widgets_personalizados/Cards/card_populares.dart';
import 'package:app_donrulo/src/funcionalidades/presentaciones/widgets_personalizados/Cards/card_vertical.dart';
import 'package:app_donrulo/src/funcionalidades/presentaciones/widgets_personalizados/Headers/header_text.dart';
import 'package:app_donrulo/src/funcionalidades/presentaciones/widgets_personalizados/Headers/header_doble.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: const Icon(
                Icons.close,
                color: Colors.black,
                size: 40.0,
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        alignment: Alignment.centerLeft,
                        child: headerText(
                            texto: 'Buscar',
                            color: Colors.black,
                            fontSize: 30.0)),
                    _searchInput(context),
                    const SizedBox(height: 30.0),
                    headerDoubleText(
                        textHeader: 'Busqueda reciente',
                        textAction: 'Eliminar todo',
                        func: () {}),
                    _sliderRecentSearch(),
                    const SizedBox(height: 20.0),
                    headerDoubleText(
                        textHeader: 'Recomendado para ti',
                        textAction: '',
                        func: () {}),
                    const SizedBox(height: 20.0),
                    popularesCard(
                        context: context,
                        image: const NetworkImage(
                            'https://www.mediafire.com/convkey/7643/7560wws4n9n4do29g.jpg'),
                        title: 'Ceviche de Pescado',
                        subtitle: 'a base de pescado',
                        review: '4.8',
                        ratings: "(233 votos)",
                        hasActionButton: false),
                    popularesCard(
                        context: context,
                        image: const NetworkImage(
                            'https://www.mediafire.com/convkey/53af/ju8hc47q4nthony9g.jpg'),
                        title: 'Ceviche Mixto',
                        subtitle: 'a base de pescado y mariscos',
                        review: '4.8',
                        ratings: "(233 votos)",
                        hasActionButton: false),
                    popularesCard(
                        context: context,
                        image: const NetworkImage(
                            'https://www.mediafire.com/convkey/49ee/3008ln9rk93m9289g.jpg'),
                        title: 'Leche de Tigre',
                        subtitle: 'a base de pescado',
                        review: '4.8',
                        ratings: "(233 votos)",
                        hasActionButton: false),
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

//buscador
Widget _searchInput(BuildContext context) {
  return Container(
    height: 35.0,
    margin: const EdgeInsets.only(top: 20.0),
    padding: const EdgeInsets.only(left: 5.0),
    decoration: BoxDecoration(
        color: bgInputs, borderRadius: BorderRadius.circular(20.0)),
    child: const TextField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: 5.0),
          prefixIcon: Icon(Icons.search, color: gris),
          hintText: 'Buscar',
          border: OutlineInputBorder(borderSide: BorderSide.none)),
    ),
  );
}

Widget _sliderRecentSearch() {
  return Container(
    margin: const EdgeInsets.only(top: 5.0),
    height: 190.0,
    child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return cardVertical(
              context: context,
              width: 160.0,
              height: 120.0,
              title: "Ceviche Don Rulo",
              subtitle: "Pescado y conchas negra",
              image: const NetworkImage(
                  'https://www.mediafire.com/convkey/7520/j1oooxvesl3oooe9g.jpg'));
        }),
  );
}
