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

  static width(BuildContext context, double w) {
    return MediaQuery.of(context).size.height * w;
  }

  static visibility(BuildContext context) {
    return MediaQuery.of(context).viewInsets.bottom == 0;
  }
}

unfocus() {
  FocusManager.instance.primaryFocus?.unfocus();
}

class Nav {
  static push(BuildContext context, String routeName) {
    return Navigator.pushNamed(context, routeName);
  }

  static pushMaterial(BuildContext context, Widget widget) {
    return Navigator.push(context, MaterialPageRoute(builder: (_) => widget));
  }

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

Color blackO7 = const Color(0xFF000000).withOpacity(0.7);
