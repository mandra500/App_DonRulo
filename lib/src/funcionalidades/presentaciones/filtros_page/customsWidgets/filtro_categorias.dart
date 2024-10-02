import 'package:flutter/material.dart';
import 'package:app_donrulo/src/colors/colors.dart';

class CusinesFilter extends StatefulWidget {
  const CusinesFilter({super.key});

  @override
  State<CusinesFilter> createState() => _CusinesFilterState();
}

class _CusinesFilterState extends State<CusinesFilter> {
  bool btnEntradas = false;
  bool btnCeviches = false;
  bool btnArroces = false;
  bool btnRondas = false;
  bool btnParihuelas = false;
  bool btnSudados = false;
  bool btnChupes = false;
  bool btnFrituras = false;
  bool btnEspeciales = false;
  bool bntCriollos = false;
  bool btnCocteles = false;
  bool btnBebidas = false;
  bool btnCervezas = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _roundedButtonFilter(() {
              setState(() => btnEntradas = !btnEntradas);
            }, btnEntradas, 'Entradas'),
            _roundedButtonFilter(() {
              setState(() => btnCeviches = !btnCeviches);
            }, btnCeviches, 'Ceviches'),
            _roundedButtonFilter(() {
              setState(() => btnArroces = !btnArroces);
            }, btnArroces, 'Arroces'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _roundedButtonFilter(() {
              setState(() => btnRondas = !btnRondas);
            }, btnRondas, 'Rondas'),
            _roundedButtonFilter(() {
              setState(() => btnSudados = !btnSudados);
            }, btnSudados, 'Sudados'),
            _roundedButtonFilter(() {
              setState(() => btnChupes = !btnChupes);
            }, btnChupes, 'Chupes'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _roundedButtonFilter(() {
              setState(() => btnParihuelas = !btnParihuelas);
            }, btnParihuelas, 'Parihuelas'),
            _roundedButtonFilter(() {
              setState(() => btnFrituras = !btnFrituras);
            }, btnFrituras, 'Frituras'),
            _roundedButtonFilter(() {
              setState(() => btnEspeciales = !btnEspeciales);
            }, btnEspeciales, 'Especiales'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _roundedButtonFilter(() {
              setState(() => bntCriollos = !bntCriollos);
            }, bntCriollos, 'Criollos'),
            _roundedButtonFilter(() {
              setState(() => btnBebidas = !btnBebidas);
            }, btnBebidas, 'Bebidas'),
            _roundedButtonFilter(() {
              setState(() => btnCervezas = !btnCervezas);
            }, btnCervezas, 'Cervezas'),
          ],
        ),
      ],
    );
  }
}

Widget _roundedButtonFilter(Function()? func, bool isActive, String labelText) {
  return Container(
    width: 100, // Establece el ancho que quieras para todos los botones
    height: 40, // Establece la altura deseada para los botones
    margin: const EdgeInsets.all(5.0),
    child: ElevatedButton(
      onPressed: func,
      style: ElevatedButton.styleFrom(
        elevation: 0.5,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
          side: BorderSide(color: isActive ? orange : gris),
        ),
      ),
      child: FittedBox(
        // Se asegura de que el texto se adapte al tamaño del botón
        fit: BoxFit.scaleDown,
        child: Text(
          labelText,
          style: TextStyle(
            color: isActive ? orange : gris,
            fontSize:
                16, // Tamaño de texto fijo, puedes ajustarlo según sea necesario
          ),
        ),
      ),
    ),
  );
}
