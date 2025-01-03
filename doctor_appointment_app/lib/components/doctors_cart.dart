import 'package:doctor_appointment_app/utils/config.dart';
import 'package:flutter/material.dart';

class DoctorsCart extends StatelessWidget {
  const DoctorsCart({
    super.key,
    required this.route,
  });
  final String route;
  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: 150,
      child: GestureDetector(
        child: Card(
          elevation: 5,
          color: Colors.white,
          child: Row(
            children: [
              SizedBox(
                width: Config.width * 0.33,
                child:
                Image.asset('assets/perfiles/doctor_hause.jpeg', fit: BoxFit.fill,),
              ),
              Flexible(child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20,),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Dr Gregory Hause',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Diagnologo',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(Icons.star_border, color: Colors.yellow,size: 16),
                        Spacer(
                          flex: 1,
                        ),
                        Text('4.5',),
                        Spacer(
                          flex: 1,
                        ),
                        Text('Reseñas'),
                        Spacer(
                          flex: 1,
                        ),
                        Text('(20)'),
                        Spacer(
                          flex: 7,
                        ),
                      ],
                    )
                  ],
                ),
                )
              )
            ],
          ),
        ),
        onTap: (){
          // redirigir a detalles sobre el doctor
          Navigator.of(context).pushNamed(route);
        },
      ),
    );
  }
}