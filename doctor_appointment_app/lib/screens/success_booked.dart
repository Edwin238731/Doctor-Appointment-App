import 'package:doctor_appointment_app/components/button.dart'; 
import 'package:flutter/material.dart'; 
import 'package:lottie/lottie.dart'; 

/// Un widget que muestra una pantalla de confirmación para indicar que la cita médica ha sido reservada exitosamente.
class AppointmentBooked extends StatelessWidget {
  /// Constructor de la clase, define que es un widget sin estado (StatelessWidget).
  const AppointmentBooked({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Estructura básica de la pantalla con soporte para una barra de estado segura.
      body: SafeArea(
        // Evita que el contenido de la pantalla invada las áreas sensibles del sistema operativo (como la barra de estado o muescas en el dispositivo).
        child: Column(
          // Organiza los widgets hijos de manera vertical.
          mainAxisAlignment: MainAxisAlignment.center,
          // Alinea los elementos principales verticalmente en el centro de la pantalla.
          children: <Widget>[
            // Un widget expandible para mostrar la animación.
            Expanded(
              flex: 3, // Ocupa 3/4 de la pantalla dentro del espacio disponible.
              child: Lottie.asset('assets/success.json'), 
              // Muestra una animación Lottie desde el archivo JSON ubicado en los assets.
            ),
            // Un contenedor que muestra el texto "Reservado con éxito".
            Container(
              width: double.infinity, // Hace que el contenedor ocupe todo el ancho disponible.
              alignment: Alignment.center, // Centra el contenido dentro del contenedor.
              child: const Text(
                'Reservado con éxito', // Texto que indica que la reserva fue exitosa.
                style: TextStyle(
                  fontSize: 20, // Tamaño del texto.
                  fontWeight: FontWeight.bold, // Negrita para destacar el texto.
                ),
              ),
            ),
            const Spacer(), 
            // Espacio flexible que ocupa el espacio restante de la columna para mantener la separación entre elementos.
            
            // Botón para volver a la página de inicio.
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15), 
              // Define un margen alrededor del botón.
              child: Button(
                width: double.infinity, // Hace que el botón ocupe todo el ancho del contenedor.
                title: 'Volver a la página de inicio', 
                // Texto del botón.
                onPressed: () => Navigator.of(context).pushNamed('main'), 
                // Define la acción que se ejecuta al presionar el botón: navegar a la página principal de la app.
                disable: false, 
                // Indica que el botón no está deshabilitado y se puede presionar.
              ),
            )
          ],
        ),
      ),
    );
  }
}
