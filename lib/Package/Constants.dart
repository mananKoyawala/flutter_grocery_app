import 'package:flutter/material.dart';

class DP {
  static dHeight(BuildContext context, int dp) {
    return MediaQuery.of(context).size.height / dp;
  }

  static dWidth(BuildContext context, int dp) {
    return MediaQuery.of(context).size.width / dp;
  }

  static infinity(BuildContext context) {
    return double.infinity;
  }

  static height(BuildContext context, double h) {
    return MediaQuery.of(context).size.height * h;
  }

  static visibility(BuildContext context) {
    return MediaQuery.of(context).viewInsets.bottom == 0;
  }
}

class Nav {
  static pop(BuildContext context) {
    Navigator.pop(context);
  }

  static closeDrawer(BuildContext context) {
    Scaffold.of(context).closeDrawer();
  }
}

class MyColor {
  static Color white = Colors.white;
  static Color black = Colors.black;
  static Color blackO_30 = const Color(0xFF000000).withOpacity(0.30);
  static Color blackO_50 = const Color(0xFF000000).withOpacity(0.50);
  static Color rippleColor = Colors.grey.shade500;
}
