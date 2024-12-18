import 'package:doctor_appointment_app/utils/config.dart'; 
// Importa una clase de configuración que contiene métodos y propiedades globales para la aplicación.
import 'package:flutter/material.dart'; 
// Importa el paquete principal de Flutter para construir interfaces gráficas.

/// Un widget que crea un botón de estilo social, diseñado para acciones relacionadas con redes sociales.
class SocialButton extends StatelessWidget {
  /// Constructor del widget que recibe el nombre de la red social.
  const SocialButton({super.key, required this.social});

  /// Nombre de la red social (por ejemplo, "facebook" o "google") que define la imagen y el texto del botón.
  final String social;

  @override
  Widget build(BuildContext context) {
    // Inicializa las configuraciones generales con el contexto actual de la aplicación.
    Config().init(context);

    // Devuelve un botón estilizado con bordes que representa la red social.
    return OutlinedButton(
      // Estilo del botón con bordes.
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 15), 
        // Define el espacio interno (padding) en la parte superior e inferior.
        side: const BorderSide(width: 1, color: Colors.black), 
        // Define el borde negro con un ancho de 1 píxel.
      ),
      onPressed: () {}, 
      // Acción al presionar el botón (actualmente sin funcionalidad).

      // Contenedor interno del botón que define su tamaño y estructura.
      child: SizedBox(
        width: Config.width * 0.4, 
        // Establece el ancho del botón como el 40% del ancho total de la pantalla usando la configuración global.

        child: Row(
          // Organiza los elementos hijos en una fila horizontal.
          mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
          // Distribuye los elementos con espacios iguales entre ellos.

          children: <Widget>[
            // Imagen representativa de la red social.
            Image.asset(
              'assets/imagenes/$social.png', 
              // Ruta dinámica que carga la imagen del botón según el nombre de la red social.
              width: 40, 
              // Ancho de la imagen.
              height: 40, 
              // Altura de la imagen.
            ),

            // Texto que muestra el nombre de la red social en mayúsculas.
            Text(
              social.toUpperCase(), 
              // Convierte el texto del nombre de la red social a mayúsculas.
              style: const TextStyle(
                color: Colors.black, 
                // El texto es de color negro para mantener consistencia visual.
              ),
            ),
          ],
        ),
      ),
    );
  }
}
