import 'package:doctor_appointment_app/utils/config.dart';
import 'package:flutter/material.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({super.key});

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

//enum para los estados de una cita(Proximas, completadas y canceladas)
enum FilterEstado {proxima, completado, cancelado}

class _AppointmentPageState extends State<AppointmentPage> {
  FilterEstado estado = FilterEstado.completado;//equivale a status
  Alignment _alignment = Alignment.centerLeft;
  List<dynamic> horarios = [//schedules
    {
      "nombre_doctor":"Gregory Hause",
      "foto_doctor":"assets/perfiles/doctor_hause.jpeg",
      "categoria":"Diagnologo",
      "estatus": FilterEstado.proxima,
    },
    {
      "nombre_doctor": "Wilson",
      "foto_doctor": "assets/perfiles/doctor_wilson.jpeg",
      "categoria": "Cardiologia",
      "estatus": FilterEstado.completado,
    },
    {
      "nombre_doctor": "Cody",
      "foto_doctor": "assets/perfiles/doctor_cody.jpeg",
      "categoria": "Ginecologia",
      "estatus": FilterEstado.completado,
    },
    {
      "nombre_doctor": "Cameron",
      "foto_doctor": "assets/perfiles/doctor_cameron.jpeg",
      "categoria": "General",
      "estatus": FilterEstado.cancelado,
    },
  ];
  @override
  Widget build(BuildContext context) {//filtroHorarios equivalle a filteredSchedules
    List<dynamic> filtroHorarios = horarios.where((var horario){
      // switch(horario['estado']){
      //   case 'proxima':
      //     horario['estado'] = FilterEstado.proxima;
      //     break;
      //   case 'completado':
      //     horario['estado'] = FilterEstado.completado;
      //     break;
      //   case 'cancelado':
      //     horario['estado'] = FilterEstado.cancelado;
      //     break;
      // }
      return horario['estatus'] == estado;
    }).toList();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left:20, top:20, right: 20,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget> [
            const Text(
              'Horario de citas',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Config.spaceSamall,
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (FilterEstado filterStatus in FilterEstado.values)
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                if (filterStatus == FilterEstado.proxima) {
                                  estado = FilterEstado.proxima;
                                  _alignment = Alignment.centerLeft;
                                } else if (filterStatus ==
                                    FilterEstado.completado) {
                                  estado = FilterEstado.completado;
                                  _alignment = Alignment.center;
                                } else if (filterStatus ==
                                    FilterEstado.cancelado) {
                                  estado = FilterEstado.cancelado;
                                  _alignment = Alignment.centerRight;
                                }
                              });
                            },
                            child: Center(
                              child: Text(filterStatus.name),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                AnimatedAlign(
                  alignment: _alignment,
                  duration: const Duration(milliseconds: 200),
                  child: Container(
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Config.primaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        estado.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Config.spaceSamall,
            Expanded(
              child: ListView.builder(
                itemCount: filtroHorarios.length,
                itemBuilder: ((context,index){
                  var horario = filtroHorarios[index]; /* aqui equivale a _schedule */
                  bool ultimoElemento = filtroHorarios.length + 1 == index; /* aqui equivale a isLastElement */
                  return Card(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: !ultimoElemento ? const EdgeInsets.only(bottom: 20):EdgeInsets.zero,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundImage:
                                  AssetImage(horario['foto_doctor']),//aqui equivale a doctor_profile
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    horario['nombre_doctor'],
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    horario['categoria'],
                                    style: const TextStyle(
                                      color: Colors.black87,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          //Tarjetas de programacion
                          ScheduleCard(),
                          const SizedBox(
                            height: 5,
                          ),
                                                    Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                  ),
                                  onPressed: () {},
                                  child: const Text(
                                    'Cancelar',
                                    style:
                                        TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    backgroundColor: Config.primaryColor,
                                  ),
                                  onPressed: () {},
                                  child: const Text(
                                    'Reagendar',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ScheduleCard extends StatelessWidget {
  const ScheduleCard({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(
            Icons.calendar_today,
            color: Config.primaryColor,
            size: 15,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            'Miercoles, 18/12/2024',
            style: const TextStyle(color: Config.primaryColor),
          ),
          SizedBox(width: 20),
          Icon(
            Icons.access_alarm,
            color: Config.primaryColor,
            size: 17,
          ),
          SizedBox(
            width: 5,
          ),
          Flexible(
              child: Text(
            '2:00 pm',
            style: TextStyle(
              color: Config.primaryColor,
            ),
          ))
        ],
      ),
    );
  }
}
