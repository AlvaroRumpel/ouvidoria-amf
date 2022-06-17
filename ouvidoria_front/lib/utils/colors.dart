import 'package:flutter/material.dart';

class CustomColors {
  static const MaterialColor primaryColor = MaterialColor(
    0xff1E5FC1, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xff1E5FC1), //10%
      100: Color(0xff1E5FC1), //20%
      200: Color(0xff1E5FC1), //30%
      300: Color(0xff1E5FC1), //40%
      400: Color(0xff1E5FC1), //50%
      500: Color(0xff1E5FC1), //60%
      600: Color(0xff1E5FC1), //70%
      700: Color(0xff1E5FC1), //80%
      800: Color(0xff1E5FC1), //90%
      900: Color(0xff1E5FC1), //100%
    },
  );
  static const Color whiteStandard = Color(0xffEDEDED);
  static const Color blackStandard = Color(0xff364151);
  static const Color blackSecondary = Color(0xff1D192B);
  static const Color secondaryColor = Color(0xff29B6C5);
  static const Color tertiaryColor = Color(0xffEDDF84);
  static const Color labelColor = Color(0xffBCBCBC);
  static const Color whiteSecondary = Color(0xffF0F0F0);
  static const Color container = Color(0xfff7f7f7);
  static const Color errorColor = Color(0xFFFF2A08);
  static const Color sucessColor = Color(0xff4DB38A);
}
