import 'package:app_donrulo/src/colors/colors.dart';
import 'package:app_donrulo/src/utils/estilos/box_decoraciones_shadows.dart';
import 'package:flutter/material.dart';

@immutable
class VistaAvatar extends StatelessWidget {
  final String backgroundImage;

  const VistaAvatar({super.key, required this.backgroundImage});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          width: 142,
          height: 142,
          decoration: createBoxDecorationWithShadows(
              borderRadius: BorderRadius.circular(65)),
          child: CircleAvatar(
            backgroundImage: NetworkImage(backgroundImage),
            radius:
                71, // Optional: Use radius instead of fixed height/width for a better appearance
          ),
        ),
        Transform.translate(
          offset: const Offset(0, -35),
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                color: rosa, borderRadius: BorderRadius.circular(20)),
            child: const Icon(Icons.camera_alt, color: Colors.white, size: 20),
          ),
        ),
      ],
    );
  }
}
