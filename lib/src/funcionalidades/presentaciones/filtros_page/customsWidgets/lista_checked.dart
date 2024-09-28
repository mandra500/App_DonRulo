import 'package:flutter/material.dart';
import 'package:app_donrulo/src/colors/colors.dart';
import 'package:app_donrulo/src/funcionalidades/presentaciones/widgets_personalizados/Headers/header_text.dart';

class ListTileOrder extends StatefulWidget {
  final String texto;
  final bool isActive;
  final Function()? func;

  const ListTileOrder({
    super.key,
    required this.texto,
    required this.isActive,
    required this.func,
  });

  @override
  State<ListTileOrder> createState() => _ListTileOrderState();
}

class _ListTileOrderState extends State<ListTileOrder> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        listTiles(
          context: context,
          texto: widget.texto,
          isActive: widget.isActive,
          func: widget.func,
        ),
      ],
    );
  }
}

Widget listTiles({
  required BuildContext context,
  required String texto,
  bool isActive = false,
  Function()? func,
}) {
  return Container(
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: Theme.of(context).dividerColor,
        ),
      ),
    ),
    child: ListTile(
      onTap: func,
      title: headerText(
        texto: texto,
        color: isActive ? orange : Colors.black,
        fontWeight: FontWeight.w400,
        fontSize: 17.0,
      ),
      trailing: isActive
          ? Icon(
              Icons.check,
              color: isActive ? orange : gris,
            )
          : const Text(''),
    ),
  );
}
