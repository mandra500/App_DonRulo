import 'package:app_donrulo/src/colors/colors.dart';
import 'package:app_donrulo/src/funcionalidades/presentaciones/tabs/tab_mi_orden/componentes/vista_vacia.dart';
import 'package:app_donrulo/src/funcionalidades/presentaciones/widgets_personalizados/Headers/header_text.dart';
import 'package:flutter/material.dart';

class MyOrderTab extends StatefulWidget {
  const MyOrderTab({super.key});

  @override
  State<MyOrderTab> createState() => _MyOrderTabState();
}

class _MyOrderTabState extends State<MyOrderTab> {
  final emptyOrderState = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgGrey,
      body: emptyOrderState
          ? const EmptyView() // llama a la vista de cesta vacia
          : CustomScrollView(
              slivers: [
                SliverAppBar(
                  elevation: 0.5,
                  leading: const Text(''),
                  title: headerText(
                      texto: 'Mi Orden',
                      color: primaryColor,
                      fontSize: 17,
                      fontWeight: FontWeight.w600),
                ),
                SliverList(
                    delegate: SliverChildListDelegate([
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                      children: [
                        _ordenes(context),
                        _resumenCompra(context),
                        _buttonPagar(context)
                      ],
                    ),
                  )
                ]))
              ],
            ),
    );
  }
}

Widget _ordenes(BuildContext context) {
  return Column(
    children: [_cardsOrders(context)],
  );
}

Widget _cardsOrders(BuildContext context) {
  return Container(
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.symmetric(vertical: 2.0),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: listorden,
          boxShadow: const [
            BoxShadow(color: sombra, spreadRadius: 1.0, blurRadius: 4.0)
          ]),
      child: Column(
        children: [
          Row(
            children: [_ordenTopInfo()],
          ),
          Column(
            children: [_items(context), _items(context), _items(context)],
          ),
          _masContenido(context)
        ],
      ));
}

Widget _ordenTopInfo() {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 2.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 7.0, bottom: 7.0, right: 20.0),
          child: headerText(
              texto: 'Nuevo Pedido',
              fontWeight: FontWeight.bold,
              fontSize: 20.0),
        ),
        Row(
          children: [
            const Icon(Icons.location_on, color: gris, size: 16.0),
            headerText(
                texto: 'Av. Metropolitana 456',
                color: gris,
                fontWeight: FontWeight.w500,
                fontSize: 13.0)
            //aqui puede ir un boton para delivery
          ],
        ),
      ],
    ),
  );
}

Widget _items(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
        border:
            Border(bottom: BorderSide(color: Theme.of(context).focusColor))),
    child: ListTile(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize:
            MainAxisSize.min, // Reduce el espacio entre los hijos de la columna
        children: [
          headerText(
              texto: 'leche de tigre',
              color: Colors.black,
              fontWeight: FontWeight.w300,
              fontSize: 16.0),
          const SizedBox(height: 0.3), // Espacio reducido entre los textos
          headerText(
              texto: 'sin picante',
              color: grayx,
              fontWeight: FontWeight.w300,
              fontSize: 12.0),
        ],
      ),
      trailing: headerText(
          texto: 'S/ 25.00',
          color: grayx,
          fontWeight: FontWeight.w300,
          fontSize: 14.0),
    ),
  );
}

Widget _masContenido(BuildContext context) {
  return ListTile(
    title: headerText(
      texto: 'Agregar más pedido',
      color: rosa,
      fontWeight: FontWeight.w600,
      fontSize: 15.0,
    ),
  );
}

Widget _resumenCompra(BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(5),
    margin: const EdgeInsets.only(
        top: 122,
        bottom: 5), // Aumenta el margen superior para posicionar más abajo
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
      boxShadow: const [
        BoxShadow(
          color: sombra,
          spreadRadius: 1.0,
          blurRadius: 4.0,
        )
      ],
    ),
    child: Column(
      children: [
        _itemsResumenCompra(
            title: 'Subtotal', value: '23.50', context: context),
        _itemsResumenCompra(title: 'IGV', value: '3.50', context: context),
        _itemsResumenCompra(title: 'Delivery', value: '8.00', context: context),
      ],
    ),
  );
}

Widget _itemsResumenCompra({
  required String title,
  required String value,
  required BuildContext context,
  EdgeInsetsGeometry? margin, // Añadido como parámetro opcional
}) {
  return Container(
    margin: margin ??
        EdgeInsets
            .zero, // Usa el margen si se proporciona, o ningún margen por defecto
    padding:
        const EdgeInsets.all(8.0), // Ajusta el padding según tus necesidades
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        Text(value),
      ],
    ),
  );
}

Widget _buttonPagar(BuildContext context) {
  return Container(
    width: double.infinity,
    height: 45.0,
    margin: const EdgeInsets.only(top: 10.0),
    child: ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        elevation: 0.5,
        backgroundColor: orange,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(),
          Container(
            margin: const EdgeInsets.only(left: 30),
            child: headerText(
                texto: 'Pagar',
                fontSize: 17.0,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
          Container(
            child: headerText(
                texto: 'S/ 25.00',
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          )
        ],
      ),
    ),
  );
}
