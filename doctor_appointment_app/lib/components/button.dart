import 'package:doctor_appointment_app/utils/config.dart';

import 'package:flutter/material.dart';

/// Clase que define un botón personalizado reutilizable.
class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.width, // Ancho del botón.
    required this.title, // Título o texto que se muestra en el botón.
    required this.onPressed, // Función que se ejecuta cuando se presiona el botón.
    required this.disable, // Indica si el botón está deshabilitado o no.
  });

  final double width; // Ancho del botón.
  final String title; // Texto que aparece en el botón.
  final bool disable; // Controla si el botón está activo o deshabilitado.
  final Function() onPressed; // Acción a ejecutar al presionar el botón.

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width, // Define el ancho del botón según el parámetro recibido.
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Config.primaryColor, // Color de fondo del botón, definido en la configuración global.
          foregroundColor: Colors.white, // Color del texto o contenido del botón.
        ),
        // Define la función que se ejecutará al presionar el botón.
        // Si `disable` es `true`, se deshabilita el botón (onPressed = null).
        onPressed: disable ? null : onPressed,
        child: Text(
          title, // Muestra el texto definido en el parámetro `title`.
          style: const TextStyle(
            fontSize: 18, // Tamaño del texto.
            fontWeight: FontWeight.bold, 
          ),
        ),
      ),
    );
  }
}
