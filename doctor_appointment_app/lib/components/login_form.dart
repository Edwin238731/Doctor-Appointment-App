import 'package:doctor_appointment_app/components/button.dart';
import 'package:doctor_appointment_app/utils/config.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _fromKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  bool obsecurePass = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            cursorColor: Config.primaryColor,
            decoration: const InputDecoration(
              hintText: 'Campo del correo',//hint text = texto de sugerencia, funciona como una nombrador del campo
              labelText: 'Correo', //label text = placeholder, texto de sugerencia
              alignLabelWithHint: true,
              prefixIcon: Icon(Icons.email_outlined),
              prefixIconColor: Config.primaryColor,
            ),
          ),
          Config.spaceSamall,
          TextFormField(
            controller: _passController,
            keyboardType: TextInputType.visiblePassword,
            cursorColor: Config.primaryColor,
            obscureText: obsecurePass,
            decoration: InputDecoration(
              hintText: 'Campo de contraceña',
              labelText: 'Contraceña', //label text = placeholder, texto de sugerencia
              alignLabelWithHint: true,
              prefixIcon:const Icon(Icons.lock_outline),
              prefixIconColor: Config.primaryColor,
              suffixIcon: IconButton(
                onPressed:() {
                  setState(() {
                    obsecurePass =!obsecurePass;
                  });
                },
                icon: obsecurePass
                    ? const Icon(
                        Icons.visibility_off_outlined,
                        color:Colors.black38,
                      )
                    : const Icon(
                      Icons.visibility_outlined,
                      color: Config.primaryColor,
              ))
            ),
          ),
          Config.spaceSamall,
          //boton de sesion
          Button(
            width: double.infinity,
            title: 'iniciar sesion',
            onPressed: (){},
            disable: false,
            ),
        ],
      ),
    );
  }
}