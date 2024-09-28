import 'package:app_donrulo/src/colors/colors.dart';
import 'package:app_donrulo/src/funcionalidades/presentaciones/widgets_personalizados/Botones_de_regresos/back_botton.dart';
import 'package:app_donrulo/src/funcionalidades/presentaciones/widgets_personalizados/Headers/header_doble.dart';
import 'package:app_donrulo/src/funcionalidades/presentaciones/widgets_personalizados/Headers/header_text.dart';
import 'package:flutter/material.dart';

class PlatosDetallesPage extends StatelessWidget {
  const PlatosDetallesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          backgroundColor: orange,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          label: headerText(
              texto: 'agregar',
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 17)),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: orange,
            expandedHeight: 395,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  const Image(
                      width: double.infinity,
                      height: 350,
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://www.mediafire.com/convkey/170b/iu7gebr4ifkezie9g.jpg')),
                  Container(
                      decoration: const BoxDecoration(
                          color: Color.fromRGBO(0, 0, 0, 1.4)),
                      width: double.infinity,
                      height: 350),
                  Positioned(
                    top: 150,
                    left: 30,
                    right: 30,
                    child: _infoPlatos(),
                  ),
                  Positioned(
                    bottom: 110,
                    left: 2,
                    right: 2,
                    child: _infoStats(),
                  ),
                  Positioned(
                    bottom: 0.3,
                    left: 1,
                    right: 1,
                    child: _ofertaBanner(),
                  ),
                ],
              ),
            ),
            //boton de regreso
            leading: Builder(builder: (BuildContext context) {
              return backButton(context, Colors.white);
            }),
            actions: [
              Container(
                //iconos
                margin: const EdgeInsets.all(10),
                child: const Image(
                    width: 20,
                    height: 20,
                    image: AssetImage('assets/images//share.png')),
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.bookmark_border,
                    color: Colors.white,
                    size: 25,
                  ))
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              _headerTexto(texto: 'Agregar'), //funcion privada
              _sliderCards(),
              _headerTexto(texto: 'Acompaña Tu Orden con'), //funcion privada
              _menuList(context),
              _headerTexto(texto: 'Comentarios'), //funcion privada
              _comentario(),
              _headerTexto(texto: 'Calificanos'),
              _calificacion(),
              const SizedBox(height: 150.0)
            ]),
          )
        ],
      ),
    );
  }
}

//funcion
Widget _infoPlatos() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 30.0),
    margin: const EdgeInsets.symmetric(vertical: 7.0),
    child: headerText(
        texto: "Leche de tigre",
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 30.0),
  );
}

Widget _infoStats() {
  return Container(
    margin: const EdgeInsets.only(top: 26.0),
    padding: const EdgeInsets.symmetric(horizontal: 40.0),
    height: 70.0,
    decoration: const BoxDecoration(
        border: Border(
            top: BorderSide(color: Colors.white),
            bottom: BorderSide(color: Colors.white))),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              //icono de la estrella
              const Icon(
                Icons.star,
                color: Colors.white,
                size: 19.0,
              ),
              headerText(
                  texto: '4.5',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0)
            ]),
            headerText(
                texto: "Comentarios",
                color: gris,
                fontWeight: FontWeight.w500,
                fontSize: 15.0)
          ],
        ),
        Container(
          height: 40,
          decoration: const BoxDecoration(
              border: Border(right: BorderSide(color: Colors.white))),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              //icono de favorito
              const Icon(
                Icons.bookmark,
                color: Colors.white,
                size: 19.0,
              ),
              headerText(
                  texto: '137k',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0)
            ]),
            headerText(
                texto: "Favoritos",
                color: gris,
                fontWeight: FontWeight.w500,
                fontSize: 15.0)
          ],
        ),
        Container(
          height: 40,
          decoration: const BoxDecoration(
              border: Border(right: BorderSide(color: Colors.white))),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              //icono de moneda
              const Icon(
                Icons.money,
                color: Colors.white,
                size: 19.0,
              ),
              headerText(
                  texto: 'S/ 25.00',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0)
            ]),
            headerText(
                texto: "precio",
                color: gris,
                fontWeight: FontWeight.w500,
                fontSize: 15.0)
          ],
        ),
      ],
    ),
  );
}

Widget _ofertaBanner() {
  return Container(
    color: banner,
    padding: const EdgeInsets.all(20),
    height: 106.0,
    width: double.infinity,
    child: Row(
      children: [
        Column(
          // alinear ordenar nuevamente
          crossAxisAlignment:
              CrossAxisAlignment.start, // Alinea el contenido a la izquierda
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            headerText(
                texto: "Ordenar Nuevamente",
                color: orange,
                fontWeight: FontWeight.bold,
                fontSize: 14.0),
            const SizedBox(height: 5.0),
            headerText(
                texto: "¡Tu pedido estará listo!\n ¡cuando tú lo desees.!",
                color: primaryColor,
                fontWeight: FontWeight.w400,
                fontSize: 13.0),
          ],
        ),
        const Spacer(),
        ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor: orange,
            ),
            child: headerText(
                texto: 'Ordenar Ahora',
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 13.0)),
      ],
    ),
  );
}

Widget _headerTexto({required String texto}) {
  return Container(
    margin: const EdgeInsets.only(top: 20.0, bottom: 5.0),
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: headerDoubleText(textHeader: texto, textAction: '', func: null),
  );
}

Widget _sliderCards() {
  return Container(
      height: 210.0,
      padding: const EdgeInsets.only(left: 10),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext _, int index) {
            //se utiliza un _ para no utilizar el context
            return _cards();
          }));
}

Widget _cards() {
  return Container(
    margin: const EdgeInsets.all(8.0),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: const Image(
          width: 200.0,
          height: 100.0,
          fit: BoxFit.cover,
          image: NetworkImage(
              'https://www.mediafire.com/convkey/3196/ay1b91oru4aq0qiag.jpg'),
        ),
      ),
      Container(
        margin: const EdgeInsets.only(top: 10),
        child: headerText(
            texto: 'rocoto molido',
            fontWeight: FontWeight.bold,
            fontSize: 15.0),
      ),
      Container(
        alignment: Alignment.centerLeft,
        child: headerText(
            texto: 'S/ 2.50',
            fontWeight: FontWeight.w500,
            fontSize: 14.0,
            color: gris),
      ),
      Row(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: headerText(
                // se va ha corregir mas adelanta
                texto: 'Selecciona',
                fontWeight: FontWeight.w500,
                fontSize: 15.0,
                color: orange),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10, left: 100),
            child: const Image(
                width: 20.0,
                height: 20.0,
                fit: BoxFit.cover,
                image: AssetImage('assets/images//plus_order.png')),
          )
        ],
      )
    ]),
  );
}

Widget _menuList(BuildContext context) {
  return Container(
    padding: const EdgeInsets.only(left: 10.0),
    child: Column(
      children: [
        _menuItem(context, 'Gaseosa de 500 ml', 'S/ 4.90'),
        _menuItem(context, 'Gaseosa de 1 L.', 'S/ 6.90'),
        _menuItem(context, 'Agua Mineral', 'S/ 3.90'),
        _menuItem(context, 'Chicha Morada', 'S/ 15.90'),
        _menuItem(context, 'Jugos', 'S/ 13.90'),
      ],
    ),
  );
}

Widget _menuItem(BuildContext context, String texto, String itemCount) {
  return Container(
      decoration:
          const BoxDecoration(border: Border(bottom: BorderSide(color: gris))),
      child: Column(
        children: [
          ListTile(
            title: headerText(
                texto: texto, fontWeight: FontWeight.w300, fontSize: 17.0),
            trailing: headerText(
                texto: itemCount, fontWeight: FontWeight.w300, fontSize: 17.0),
          ),
          _sliderCards()
        ],
      ));
}

Widget _comentario() {
  return Container(
    height: 130,
    padding: const EdgeInsets.only(left: 10),
    child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return _cardReviews();
        }),
  );
}

Widget _cardReviews() {
  var lorem =
      "Muy buena sazón, todos los platos deliciosos, y la atención muy cordial.";
  return Container(
    margin: const EdgeInsets.only(top: 10),
    padding: const EdgeInsets.symmetric(horizontal: 10),
    width: 328,
    child: Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: const Image(
                width: 40.0,
                height: 43.0,
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://www.mediafire.com/convkey/c9a3/2vvb1huwpwlo1a0ag.jpg'),
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                headerText(
                  texto: 'Jose Quezada',
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
                headerText(
                  texto: '45 reseñas',
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: gris,
                ),
              ],
            ),
            const Spacer(),
            ClipRRect(
              // este contenedor es para la calificación de estrellas
              borderRadius: BorderRadius.circular(8),
              child: Container(
                width: 60,
                height: 30,
                color: orange,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    headerText(
                      texto: '4',
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
                    const SizedBox(width: 4),
                    const Icon(Icons.star, color: Colors.white, size: 14),
                  ],
                ),
              ),
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: headerText(
              texto: lorem,
              color: gris,
              fontSize: 12,
              fontWeight: FontWeight.w400,
              textAlign: TextAlign.left),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: headerText(
              texto: 'Ver más',
              color: orange,
              fontSize: 15,
              fontWeight: FontWeight.w500),
        )
      ],
    ),
  );
}

Widget _calificacion() {
  /// se corrige mas adelante
  return Container(
    margin: const EdgeInsets.only(top: 10),
    padding: const EdgeInsets.only(left: 10, right: 10),
    child: Column(
      // para centrar crossAxisAlignment: start
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                width: 60,
                height: 30,
                color: naranjaO,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    headerText(
                      texto: '1',
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
                    const SizedBox(width: 4),
                    const Icon(Icons.star, color: Colors.white, size: 14),
                  ],
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                width: 60,
                height: 30,
                color: naranjaO,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    headerText(
                      texto: '2',
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
                    const SizedBox(width: 4),
                    const Icon(Icons.star, color: Colors.white, size: 14),
                  ],
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                width: 60,
                height: 30,
                color: naranjaO,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    headerText(
                      texto: '3',
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
                    const SizedBox(width: 4),
                    const Icon(Icons.star, color: Colors.white, size: 14),
                  ],
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                width: 60,
                height: 30,
                color: Colors.orange,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    headerText(
                      texto: '4',
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
                    const SizedBox(width: 4),
                    const Icon(Icons.star, color: Colors.white, size: 14),
                  ],
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                width: 60,
                height: 30,
                color: naranjaO,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    headerText(
                      texto: '5',
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
                    const SizedBox(width: 4),
                    const Icon(Icons.star, color: Colors.white, size: 14),
                  ],
                ),
              ),
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.only(top: 10, left: 20),
          child: headerText(
              texto: 'Nos gustaria saber mas de tu experiencia!',
              color: gris,
              fontSize: 12,
              fontWeight: FontWeight.w400,
              textAlign: TextAlign.left),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10, left: 20),
          child: headerText(
              texto: " + Escribe tu reseña",
              fontWeight: FontWeight.w500,
              fontSize: 15.0,
              color: orange),
        )
      ],
    ),
  );
}
