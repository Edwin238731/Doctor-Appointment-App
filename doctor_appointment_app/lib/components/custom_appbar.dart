import 'package:doctor_appointment_app/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.appTile,
    this.route,
    this.icon,
    this.actions,
  });
  @override
  Size get preferredSize => const Size.fromHeight(60);
  final String? appTile;
  final String? route;
  final FaIcon? icon;
  final List<Widget>? actions;
  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      backgroundColor:Colors.white,//
      elevation: 0,
      title: Text(
        widget.appTile!,
        style: const TextStyle(
          fontSize: 20,
          color: Colors.black,
        ),
      ),
      //Si el icono no está configurado, devuelve nulo
      leading: widget.icon != null? Container(
        margin:  const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Config.primaryColor,
        ),
        child: IconButton(
          onPressed: (){
            //Si se proporciona una ruta, este botón de icono navegará a esa ruta.
                  if (widget.route != null) {
                    Navigator.of(context).pushNamed(widget.route!);
                  } else {
                    //else, simplemente regrese a la página anterior.
                    Navigator.of(context).pop();
                  }
          },
          icon: widget.icon!,
                iconSize: 16,
                color: Colors.white,
        ),
      )
      :  null,
      //si la accion no esta configurada regresara nulo
      actions: widget.actions ?? null,
    );
  }
}