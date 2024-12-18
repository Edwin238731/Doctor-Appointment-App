import 'package:doctor_appointment_app/utils/config.dart';

import 'package:flutter/material.dart';

/// Widget principal que representa una tarjeta de cita médica.
class AppointmentCard extends StatefulWidget {
  const AppointmentCard({super.key}); // Constructor de la tarjeta.

  @override
  State<AppointmentCard> createState() => _AppointmentCardState();
}


class _AppointmentCardState extends State<AppointmentCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // La tarjeta ocupa todo el ancho disponible.
      decoration: BoxDecoration(
        color: Config.primaryColor, // Color de fondo definido en la configuración global.
        borderRadius: BorderRadius.circular(10), // Bordes redondeados.
      ),
      child: Material(
        color: Colors.transparent, // Hace que el fondo del `Material` sea transparente.
        child: Padding(
          padding: EdgeInsets.all(20), // Margen interno para los elementos dentro de la tarjeta.
          child: Column(
            children: <Widget>[
              /// Sección que muestra información del doctor.
              Row(
                children: [
                  /// Foto del doctor.
                  CircleAvatar(
                    backgroundImage: AssetImage(
                      'assets/perfiles/dr_shaun_murphy.png', 
                      // Imagen del doctor almacenada localmente.
                    ),
                  ),
                  SizedBox(width: 10), // Espacio entre la imagen y el texto.
                  /// Nombre y especialidad del doctor.
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Dr Shaun Murphy', // Nombre del doctor.
                        style: TextStyle(color: Colors.white), // Estilo del texto.
                      ),
                      SizedBox(height: 2), // Espacio entre el nombre y la especialidad.
                      Text(
                        'Dental', // Especialidad del doctor.
                        style: TextStyle(color: Colors.black), // Estilo del texto.
                      ),
                    ],
                  ),
                ],
              ),

              Config.spaceSamall, // Espaciado definido en la configuración global.

              /// Sección que muestra el horario de la cita.
              ScheduleCard(), 

              Config.spaceSamall, // Espaciado definido en la configuración global.

              /// Botones para acciones (Cancelar o Completado).
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // Distribuye los botones con espacio entre ellos.
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red, // Color del botón "Cancelar".
                      ),
                      child: const Text(
                        'Cancelar', // Texto del botón.
                        style: TextStyle(color: Colors.white), // Color del texto.
                      ),
                      onPressed: () {
                        // Acción al presionar el botón "Cancelar".
                      },
                    ),
                  ),
                  const SizedBox(width: 20), // Espacio entre los dos botones.
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue, // Color del botón "Completado".
                      ),
                      child: const Text(
                        'Completado', // Texto del botón.
                        style: TextStyle(color: Colors.white), // Color del texto.
                      ),
                      onPressed: () {
                        // Acción al presionar el botón "Completado".
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Clase que representa el widget de horario de la cita.
class ScheduleCard extends StatelessWidget {
  const ScheduleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey, // Color de fondo del horario.
        borderRadius: BorderRadius.circular(10), // Bordes redondeados.
      ),
      width: double.infinity, // Ocupa todo el ancho disponible.
      padding: const EdgeInsets.all(20), // Margen interno para los elementos.
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center, // Alinea los elementos en el eje vertical.
        children: <Widget>[
          /// Ícono de calendario.
          Icon(
            Icons.calendar_today, // Representa la fecha.
            color: Colors.white, // Color del ícono.
            size: 15, // Tamaño del ícono.
          ),
          SizedBox(width: 5), // Espacio entre el ícono y el texto.
          /// Texto con la fecha de la cita.
          Text(
            'Miercoles, 18/12/2024', // Fecha de la cita.
            style: const TextStyle(color: Colors.white), // Estilo del texto.
          ),
          SizedBox(width: 20), // Espacio entre la fecha y el próximo ícono.
          /// Ícono de reloj.
          Icon(
            Icons.access_alarm, // Representa la hora.
            color: Colors.white, // Color del ícono.
            size: 17, // Tamaño del ícono.
          ),
          SizedBox(width: 5), // Espacio entre el ícono y el texto.
          /// Texto con la hora de la cita.
          Flexible(
            child: Text(
              '2:00 pm', // Hora de la cita.
              style: TextStyle(
                color: Colors.white, // Estilo del texto.
              ),
            ),
          ),
        ],
      ),
    );
  }
}
