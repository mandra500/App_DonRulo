import 'package:app_donrulo/src/funcionalidades/presentaciones/detalles_perfil_page/perfil_detalle_page.dart';
import 'package:flutter/material.dart';
import 'package:app_donrulo/src/funcionalidades/presentaciones/bienvenida_page/bienvenida_page.dart';
import 'package:app_donrulo/src/funcionalidades/presentaciones/login_page/login_page.dart';
import 'package:app_donrulo/src/funcionalidades/presentaciones/recuperar_pass_page/recuperar_pass.dart';
import 'package:app_donrulo/src/funcionalidades/presentaciones/registrarse_page/registrarse.dart';
import 'package:app_donrulo/src/funcionalidades/presentaciones/tabs/tabs_page.dart';
import 'package:app_donrulo/src/funcionalidades/presentaciones/buscar_page/buscar_page.dart';
import 'package:app_donrulo/src/funcionalidades/presentaciones/filtros_page/filtros_page.dart';
import 'package:app_donrulo/src/funcionalidades/presentaciones/collection_detail_page/collection_detail_page.dart';
import 'package:app_donrulo/src/funcionalidades/presentaciones/collection_page/collection_page.dart';
import 'package:app_donrulo/src/funcionalidades/presentaciones/platos_detalles/platos_detalles_page.dart';

final routes = <String, WidgetBuilder>{
  'welcome': (BuildContext context) => const WelcomePage(),
  'login': (BuildContext context) => const LoginPage(),
  'forgot-password': (BuildContext context) => const ForgotPassword(),
  'sign-up': (BuildContext context) => const SignUpPage(),
  'tabs': (BuildContext context) => const TabsPage(),
  'search': (BuildContext context) => const SearchPage(),
  'filter': (BuildContext context) => const FilterPage(),
  'collections': (BuildContext context) => const CollectionsPage(),
  'collections-detail': (BuildContext context) => const CollectionDetailPage(),
  'platos-detail': (BuildContext context) => const PlatosDetallesPage(),
  'perfil-detail': (BuildContext context) => const DetallePerfilPage(),
};
