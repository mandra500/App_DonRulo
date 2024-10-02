import 'package:flutter/material.dart';
import 'package:app_donrulo/src/colors/colors.dart';
import 'package:app_donrulo/src/funcionalidades/presentaciones/widgets_personalizados/Cards/card_populares.dart';
import 'package:app_donrulo/src/funcionalidades/presentaciones/widgets_personalizados/Headers/header_text.dart';

class ExploreTab extends StatelessWidget {
  const ExploreTab({super.key}); // Fixed the constructor syntax

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white, // Fondo blanco
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate([
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      _topBar(context),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10.0),
                        alignment: Alignment.centerLeft,
                        child: headerText(
                            texto: 'Descubre nuevos sabores',
                            color: Colors.black,
                            fontSize: 20.0),
                      ),
                      _sliderCards(),
                      _headers(context, 'Platillos top', "Mostrar todo"),
                      popularesCard(
                          context: context,
                          image: const NetworkImage(
                              'https://www.mediafire.com/convkey/7643/7560wws4n9n4do29g.jpg'),
                          title: 'Ceviche de Pescado',
                          subtitle: 'a base de pescado',
                          review: '4.8',
                          ratings: "(233 votos)",
                          buttonText: 'Delivery',
                          hasActionButton: true),
                      popularesCard(
                          context: context,
                          image: const NetworkImage(
                              'https://www.mediafire.com/convkey/53af/ju8hc47q4nthony9g.jpg'),
                          title: 'Ceviche Mixto',
                          subtitle: 'a base de pescado y mariscos',
                          review: '4.8',
                          ratings: "(233 votos)",
                          buttonText: 'Delivery',
                          hasActionButton: true),
                      popularesCard(
                          context: context,
                          image: const NetworkImage(
                              'https://www.mediafire.com/convkey/49ee/3008ln9rk93m9289g.jpg'),
                          title: 'Leche de Tigre',
                          subtitle: 'a base de pescado y pota',
                          review: '4.8',
                          ratings: "(233 votos)",
                          buttonText: 'Delivery',
                          hasActionButton: true),
                      const SizedBox(
                        height: 5.0,
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, 'collections');
                          },
                          child: _headers(
                              context, 'Lo más Pedido', "Mostrar todo")),
                      _sliderCollections()
                    ],
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _topBar(BuildContext context) {
  return Row(
    children: [
      GestureDetector(
        onTap: () => Navigator.pushNamed(context, 'search'),
        child: Container(
          width: 300,
          padding: const EdgeInsets.all(10.0),
          margin: const EdgeInsets.only(left: 10.0),
          decoration: BoxDecoration(
              border:
                  Border.all(color: const Color.fromRGBO(234, 236, 239, 1.0)),
              borderRadius: BorderRadius.circular(20.0)),
          child: Row(
            children: [
              const Icon(Icons.search, size: 20.0, color: Colors.grey),
              Container(
                margin: const EdgeInsets.only(left: 10),
                child: const Text(
                  'Buscar',
                  style: TextStyle(color: Colors.grey, fontSize: 17.0),
                ),
              ),
            ],
          ),
        ),
      ),
      Container(
        width: 45.0,
        height: 45.0,
        margin: const EdgeInsets.only(left: 5),
        decoration: BoxDecoration(
            color: const Color.fromRGBO(209, 209, 214, 1.0),
            borderRadius: BorderRadius.circular(10)),
        child: IconButton(
          icon: const Icon(
            Icons.filter_list,
            size: 20,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pushNamed(context, 'filter');
          },
        ),
      ),
    ],
  );
}

Widget _sliderCards() {
  return SizedBox(
      height: 250.0,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return _tarjeta(context);
          }));
}

Widget _tarjeta(BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, 'platos-detail');
    },
    child: Container(
      margin: const EdgeInsets.all(5),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: const Image(
                width: 250.0,
                height: 150.0,
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://www.mediafire.com/convkey/3666/xtr5hjx47iyxvfx9g.jpg')),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 200.0,
                height: 20.0,
                margin: const EdgeInsets.only(top: 5),
                child: const Text(
                  "Papa a la huancaina",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  "base de papa y crema huancaina",
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                      fontSize: 13.0),
                ),
              ),
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.yellow, size: 12),
                  const Text("4.8",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 10.0)),
                  const Text("(233 Calificaciones)",
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          fontSize: 12.0)),
                  SizedBox(
                    width: 95.0,
                    height: 20.0,
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          backgroundColor: orange,
                        ),
                        child: const Text('Delivery',
                            style: TextStyle(
                                fontSize: 11.0, color: Colors.white))),
                  )
                ],
              )
            ],
          )
        ],
      ),
    ),
  );
}

Widget _headers(BuildContext context, String textHeader, String textAction) {
  return Row(
    children: [
      Container(
        alignment: Alignment.centerLeft,
        child: headerText(texto: textHeader, fontSize: 25.0),
      ),
      const Spacer(),
      GestureDetector(
        child: Row(
          children: [
            Text(textAction,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 15.0)),
            const Icon(Icons.play_arrow)
          ],
        ),
      ),
    ],
  );
}

Widget _sliderCollections() {
  return SizedBox(
      height: 300.0,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return _tarjetaCollection(context);
          }));
}

Widget _tarjetaCollection(BuildContext context) {
  return Container(
    margin: const EdgeInsets.all(10.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: const Image(
            width: 250,
            height: 280,
            fit: BoxFit.cover,
            image: NetworkImage(
                'https://www.mediafire.com/convkey/78d0/tbcxajt1u28ljfy9g.jpg'),
          ),
        )
      ],
    ),
  );
}
