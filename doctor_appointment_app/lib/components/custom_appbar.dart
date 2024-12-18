import 'package:doctor_appointment_app/utils/config.dart'; 
// Importa una clase de configuración utilizada para manejar colores y estilos globales de la aplicación.
import 'package:flutter/material.dart'; 
// Importa el paquete principal de Flutter para construir interfaces gráficas.
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; 
// Importa la biblioteca FontAwesome para usar íconos personalizados.

/// Un widget de barra de aplicaciones personalizada (AppBar) que permite agregar iconos, rutas y acciones dinámicamente.
class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  /// Constructor de la barra de aplicaciones personalizada.
  const CustomAppBar({
    super.key,
    this.appTile, // Título de la barra de aplicaciones.
    this.route, // Ruta opcional para la navegación al presionar el ícono.
    this.icon, // Ícono personalizado (por ejemplo, FontAwesome).
    this.actions, // Lista opcional de widgets de acción (por ejemplo, botones en la esquina superior derecha).
  });

  /// Altura preferida de la barra de aplicaciones.
  @override
  Size get preferredSize => const Size.fromHeight(60);

  final String? appTile; // Título de la barra de aplicaciones (opcional).
  final String? route; // Ruta a la que navegar cuando se presiona el ícono (opcional).
  final FaIcon? icon; // Ícono personalizado que aparece como `leading` (opcional).
  final List<Widget>? actions; // Lista de acciones adicionales en la barra de aplicaciones (opcional).

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

/// Estado asociado al widget `CustomAppBar`.
class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true, 
      // Indica si se debe mostrar el botón de navegación por defecto (leading) en función de la estructura de la ruta.

      backgroundColor: Colors.white, 
      // Color de fondo de la barra de aplicaciones (blanco).

      elevation: 0, 
      // Elimina la sombra (elevation) debajo de la barra de aplicaciones.

      title: Text(
        widget.appTile!, 
        // Muestra el título proporcionado como argumento del widget.
        style: const TextStyle(
          fontSize: 20, 
          // Tamaño del texto del título.
          color: Colors.black, 
          // Color del texto del título (negro).
        ),
      ),

      /// Widget de ícono principal (leading):
      /// - Si se proporciona un ícono (`widget.icon`), lo muestra.
      /// - Si no, el valor será `null` y no se mostrará un ícono.
      leading: widget.icon != null 
          ? Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10), 
              // Márgenes alrededor del ícono.

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), 
                // Bordes redondeados del contenedor del ícono.
                color: Config.primaryColor, 
                // Color de fondo para el contenedor del ícono.
              ),
              child: IconButton(
                onPressed: () {
                  if (widget.route != null) {
                    // Si se proporciona una ruta, navega a esa ruta.
                    Navigator.of(context).pushNamed(widget.route!);
                  } else {
                    // Si no hay ruta, regresa a la página anterior.
                    Navigator.of(context).pop();
                  }
                },
                icon: widget.icon!, 
                // Ícono que se pasa como argumento.
                iconSize: 16, 
                // Tamaño del ícono.
                color: Colors.white, 
                // Color del ícono (blanco).
              ),
            )
          : null, 
          // Si no se proporciona un ícono, el `leading` será `null`.

      /// Acciones adicionales en la barra de aplicaciones:
      /// - Si se proporciona una lista de acciones (`widget.actions`), las muestra.
      /// - Si no, devuelve `null` y no se muestran acciones.
      actions: widget.actions ?? null,
    );
  }
}
