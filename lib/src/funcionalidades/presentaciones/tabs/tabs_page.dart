import 'package:flutter/material.dart';
import 'package:app_donrulo/src/colors/colors.dart';
import 'package:app_donrulo/src/funcionalidades/presentaciones/widgets_personalizados/Alertas/alerta_dialogo.dart';
import 'package:app_donrulo/src/funcionalidades/presentaciones/widgets_personalizados/Botones/rounded_botton.dart';
import 'package:app_donrulo/src/funcionalidades/presentaciones/tabs/tab_exploracion/tab_exploracion.dart';
import 'package:app_donrulo/src/funcionalidades/presentaciones/tabs/tab_favoritos/tab_favoritos.dart';
import 'package:app_donrulo/src/funcionalidades/presentaciones/tabs/tab_mi_orden/tab_mi_orden.dart';
import 'package:app_donrulo/src/funcionalidades/presentaciones/tabs/tab_perfil/tab_perfil.dart';

class TabsPage extends StatefulWidget {
  const TabsPage({super.key});

  @override
  State<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      _pedirUbicacion(context);
    });
  }

  final List<Widget> _widgetOptions = [
    const ExploreTab(),
    const MyOrderTab(),
    const FavouriteTab(),
    const ProfileTab()
  ];

  int _selectdItemIndex = 0;

  void _cambiarWidget(int index) {
    setState(() {
      _selectdItemIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectdItemIndex),
      bottomNavigationBar: _bottomNavigationBar(context),
    );
  }

  Widget _bottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      iconSize: 30,
      selectedItemColor: orange, //Theme.of(context).accentColor,
      unselectedItemColor: Colors.grey,
      backgroundColor: const Color.fromRGBO(
          255, 255, 255, 1.0), // Establecer el fondo blanco
      currentIndex: _selectdItemIndex,
      onTap: _cambiarWidget,
      showUnselectedLabels: true,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explorar',
            backgroundColor: Colors.white),
        BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Mi Orden',
            backgroundColor: Colors.white),
        BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Favoritos',
            backgroundColor: Colors.white),
        BottomNavigationBarItem(
            icon: Icon(Icons.person_pin),
            label: 'Perfil',
            backgroundColor: Colors.white),
      ],
    );
  }

  Future _pedirUbicacion(BuildContext context) async {
    showAlertDialog(
      context,
      const AssetImage('assets/images/location.png'),
      'Habilita tu Ubicación',
      "Permita usar su ubicación para mostrar el restaurante cercano en el mapa",
      roundedButton(
        context: context,
        labelButton: 'Habilitar ubicación',
        color: orange,
        funcx: () => debugPrint("habilitar geolocalización"),
      ),
    );
  }
}
