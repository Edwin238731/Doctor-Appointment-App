import 'package:doctor_appointment_app/components/button.dart';
import 'package:doctor_appointment_app/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/custom_appbar.dart';

class DoctorDetails extends StatefulWidget {
  const DoctorDetails({super.key});

  @override
  State<DoctorDetails> createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {
  //para el boton favito
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(

        appTile: 'Detalles del doctor',
        icon: const FaIcon(Icons.arrow_back_ios),
        actions: [
          //favorite button
          IconButton(
            onPressed: (){
              setState(() {
                isFav = !isFav;
              });
            },
            icon: FaIcon(
              isFav ? Icons.favorite_rounded : Icons.favorite_outline,
              color: Colors.red,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child:Column(
          children: <Widget>[
            //Crea un avatar de doctor y una introducción aquí
            AboutDoctor(),
            //Detalles del doctor
            DetailBody(),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(20),
              child:Button(
                width: double.infinity,
                title: 'Libro de citas',
                onPressed: (){
                  Navigator.of(context).pushNamed('booking_page');
                },
                disable: false,
                )
            ),
          ],
        ),
      ),
    );
  }
}

class AboutDoctor extends StatelessWidget {
  const AboutDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Container(
      width: double.infinity,
      child: Column(
        children:<Widget> [
          const CircleAvatar(
            radius: 65.0,
            backgroundImage: AssetImage('assets/perfiles/doctor_hause.jpeg'),
            backgroundColor: Colors.white,
          ),
          Config.spaceMedium,
          const Text(
            'Doctor Gregory Hause',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Config.spaceSamall,
          SizedBox(
            width: Config.width * 0.75,
            child: const Text(
              'Presentacion de credenciales, de donde viene, etc',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
              softWrap: true,
              textAlign: TextAlign.center,
            ),
          ),
          Config.spaceSamall,
          SizedBox(
            width: Config.width * 0.75,
            child: const Text(
              'donde labora',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
              softWrap: true,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class DetailBody extends StatelessWidget {
  const DetailBody({super.key});

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Container(
      padding:const EdgeInsets.all(20) ,
      margin: const EdgeInsets.only(bottom: 30),
      child: Column(
        children:<Widget> [
          Config.spaceSamall,
          const DoctorInfo(),
          Config.spaceMedium,
          const Text(
            'About Doctor',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
          ),
          Config.spaceSamall,
          Text('Dr. Gregory House: Interpretado por Hugh Laurie, es un médico brillante pero sarcástico y misántropo. Se especializa en diagnóstico',
          style: const TextStyle(
              fontWeight: FontWeight.w500,
              height: 1.5,
            ),
            softWrap: true,
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}

class DoctorInfo extends StatelessWidget {
  const DoctorInfo({
    super.key,
    // required this.patients,
    // required this.exp
  });

  // final int patients;
  // final int exp;

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Row(
      children: <Widget>[
        InfoCard(
          label: 'Patients',
          value: '109',
        ),
        const SizedBox(
          width: 15,
        ),
        InfoCard(
          label: 'Experiences',
          value: 'years',
        ),
        const SizedBox(
          width: 15,
        ),
        const InfoCard(
          label: 'Rating',
          value: '4.6',
        ),
      ],
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({super.key, required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Config.primaryColor,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 15,
        ),
        child: Column(
          children: <Widget>[
            Text(
              label,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
