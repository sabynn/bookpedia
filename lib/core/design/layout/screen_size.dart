import 'package:flutter/material.dart';

class ScreenSize {
  static double width(context) {
    return MediaQuery.of(context).size.width;
  }

  static double height(context) {
    return MediaQuery.of(context).size.height;
  }

  static percentWidth(BuildContext context, double width) {
    return ((MediaQuery.of(context).size.width) * width) / 100;
  }

  static percentHeight(BuildContext context, double height) {
    return ((MediaQuery.of(context).size.height) * height) / 100;
  }
}
