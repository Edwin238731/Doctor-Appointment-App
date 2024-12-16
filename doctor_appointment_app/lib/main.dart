import 'package:doctor_appointment_app/main_layout.dart';
import 'package:doctor_appointment_app/screens/auth_page.dart';
import 'package:doctor_appointment_app/utils/config.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final navigatorKey = GlobalKey<NavigatorState>();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,//tecla del navegador
      title: 'Aplicacion Doctor',
      debugShowCheckedModeBanner: false,
      //Tema de entrada, definida
      theme: ThemeData(
        inputDecorationTheme: const InputDecorationTheme(
          focusColor: Config.primaryColor,
          border: Config.outlinedBorde,
          focusedBorder: Config.focusBorder,
          errorBorder: Config.errorBorder,
          enabledBorder: Config.outlinedBorde,
          floatingLabelStyle: TextStyle(color:Config.primaryColor,),
          prefixIconColor: Colors.black38,
        ),
        scaffoldBackgroundColor: Colors.white,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Config.primaryColor,
          selectedItemColor: Colors.white,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          unselectedItemColor: Colors.grey.shade700,
          elevation: 10,
          type: BottomNavigationBarType.fixed,
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        //Esta es la ruta inicial de la aplicación, que es la página de autenticación (iniciar sesión y registrarse).
        '/':(context)=> const AuthPage(),
        //Esto es para el diseño principal después de iniciar sesión.
        'main': (context)=>const MainLayout()
      },
    );
  }
}
