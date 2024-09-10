import 'package:flutter/material.dart';
import 'package:radio_head/display/widgets/play.dart';

class PlayerBar extends StatefulWidget {
  const PlayerBar({super.key});

  @override
  State<PlayerBar> createState() => _PlayBarState();
}

class _PlayBarState extends State<PlayerBar> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 80, // Coloca la barra en la parte inferior
      left: 26, // Alinea a la izquierda
      right: 26, // Alinea a la derecha
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15), // Redondea los bordes
        child: Container(
          height: 80,
          width: 50,// Ajusta la altura de la barra de reproducción
          color: Colors.grey, // Cambia el color a tu gusto
          child: const Padding(
            padding: EdgeInsets.all(18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround, // Centra el botón de reproducción y agrega espacio alrededor
              children: [
                Play(),
              ],
            )
          ),
        ),
      ),
    );
  }
}