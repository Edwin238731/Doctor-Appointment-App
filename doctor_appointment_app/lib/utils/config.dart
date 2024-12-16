import "package:flutter/material.dart";

class Config {
  static MediaQueryData? mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  void init (BuildContext context){
    mediaQueryData = MediaQuery.of(context);
    screenHeight = mediaQueryData!.size.height;
    screenWidth = mediaQueryData!.size.width;
  }

  static get width{
    return screenWidth;
  }

  static get height{
    return screenHeight;
  }

// definir el espacio del height(altura)
  static const spaceSamall = SizedBox(
    height: 25,
  );

  static final spaceMedium = SizedBox(
    height : screenHeight! * 0.05,
  );

    static final spaceBig = SizedBox(
    height: screenHeight! * 0.08,
  );

  //bordes para el campo de texto
  static const outlinedBorde = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8))
  );

  static const focusBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    borderSide: BorderSide(
      color: Colors.greenAccent,
    ));

  static const errorBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(
        color: Colors.red,
      ));

  static const primaryColor= Colors.greenAccent;

}