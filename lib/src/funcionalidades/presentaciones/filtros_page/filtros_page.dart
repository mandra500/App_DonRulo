import 'package:flutter/material.dart';
import 'package:app_donrulo/src/colors/colors.dart';
import 'package:app_donrulo/src/funcionalidades/presentaciones/widgets_personalizados/Headers/header_text.dart';

import 'package:app_donrulo/src/funcionalidades/presentaciones/filtros_page/customsWidgets/filtro_categorias.dart';
import 'package:app_donrulo/src/funcionalidades/presentaciones/filtros_page/customsWidgets/filtro_precio.dart';

import 'customsWidgets/lista_checked.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  //ordenado por...
  bool loMasVendido = false;
  bool precioAltoABajo = false;
  bool precioBajoAAlto = false;
  bool masPopular = false;

  //
  //aquí pueden ir otros filtros
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  alignment: Alignment.centerLeft,
                  margin:
                      const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 15.0),
                  child: headerText(
                    texto: 'Categorias',
                    color: gris,
                    fontWeight: FontWeight.w600,
                    fontSize: 17.0,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: const CusinesFilter(),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin:
                      const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 15.0),
                  child: headerText(
                    texto: 'ORDENAR POR',
                    color: gris,
                    fontWeight: FontWeight.w600,
                    fontSize: 17.0,
                  ),
                ),
                _sortByContainer(),
                Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(
                        top: 5.0, bottom: 5.0, left: 15.0),
                    child: headerText(
                        texto: 'PRECIOS',
                        color: gris,
                        fontWeight: FontWeight.w600,
                        fontSize: 17.0)),
                const PrecioFilter()
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _sortByContainer() {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            ListTileOrder(
              texto: 'Lo más vendido',
              isActive: loMasVendido,
              func: () {
                setState(() => loMasVendido = !loMasVendido);
              },
            ),
            ListTileOrder(
              texto: 'Precio del mas Alto al mas Bajo',
              isActive: precioAltoABajo,
              func: () {
                setState(() => precioAltoABajo = !precioAltoABajo);
              },
            ),
            ListTileOrder(
              texto: 'Precio del mas Bajo al mas Alto',
              isActive: precioBajoAAlto,
              func: () {
                setState(() => precioBajoAAlto = !precioBajoAAlto);
              },
            ),
            ListTileOrder(
              texto: 'Los más Populares',
              isActive: masPopular,
              func: () {
                setState(() => masPopular = !masPopular);
              },
            ),
          ],
        ));
  }
}

AppBar _appBar(BuildContext context) {
  return AppBar(
    elevation: 0.5,
    backgroundColor: Colors.white,
    centerTitle: true,
    title: headerText(
      texto: 'Filtros',
      fontWeight: FontWeight.w600,
      fontSize: 20.0,
    ),
    leading: Container(
      padding: const EdgeInsets.only(top: 20, left: 5),
      child: headerText(
        texto: 'Reset',
        fontWeight: FontWeight.w500,
        fontSize: 17.0,
      ),
    ),
    actions: [
      GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          padding: const EdgeInsets.only(top: 20, right: 10.0),
          child: headerText(
            texto: 'Enviar',
            color: orange,
            fontWeight: FontWeight.w500,
            fontSize: 17.0,
          ),
        ),
      ),
    ],
  );
}
