import 'package:flutter/material.dart';

class BaseColor {
  static const transparent = Colors.transparent;

  // neutral
  static const neutral0 = Color.fromRGBO(255, 255, 255, 1);
  static const neutral100 = Color.fromRGBO(248, 249, 252, 1);
  static const neutral200 = Color.fromRGBO(241, 243, 249, 1);
  static const neutral300 = Color.fromRGBO(225, 230, 239, 1);
  static const neutral500 = Color.fromRGBO(133, 136, 141, 1);
  static const neutral700 = Color.fromRGBO(63, 68, 77, 1);
  static const neutral800 = Color.fromRGBO(35, 39, 47, 1);
  static const neutral900 = Color.fromRGBO(27, 31, 39, 1);
  static const neutral1000 = Color.fromRGBO(10, 13, 20, 1);

  // primary
  static const primary = Color(0xff3264E5);
  static const darkPrimary = Color(0xf0002884);

  // success
  static const success100 = Color.fromRGBO(237, 253, 248, 1);
  static const success700 = Color.fromRGBO(8, 135, 93, 1);
  static const success800 = Color.fromRGBO(4, 114, 77, 1);
  static const success900 = Color.fromRGBO(6, 96, 66, 1);

  // warning
  static const warning100 = Color.fromRGBO(255, 248, 235, 1);
  static const warning700 = Color.fromRGBO(221, 140, 17, 1);
  static const warning800 = Color.fromRGBO(186, 120, 21, 1);
  static const warning900 = Color.fromRGBO(128, 70, 13, 1);

  // danger
  static const danger100 = Color.fromRGBO(254, 241, 242, 1);
  static const danger700 = Color.fromRGBO(224, 45, 60, 1);
  static const danger800 = Color.fromRGBO(186, 37, 50, 1);
  static const danger900 = Color.fromRGBO(152, 27, 37, 1);

  // info
  static const info100 = Color.fromARGB(255, 241, 246, 254);
  static const info700 = Color.fromARGB(255, 45, 111, 224);
  static const info800 = Color.fromARGB(255, 37, 104, 186);
  static const info900 = Color.fromARGB(255, 27, 52, 152);

  // gradient
  static const primaryGradient = LinearGradient(
    begin: Alignment.bottomCenter,
    end: Alignment.topRight,
    colors: [
      darkPrimary,
      primary,
    ],
  );
}
