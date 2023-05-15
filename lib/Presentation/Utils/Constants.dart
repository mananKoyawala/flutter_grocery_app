import 'package:flutter/material.dart';
import 'package:grocery_plus/Package/CustomeTexts.dart';

import '../../Package/Constants.dart';
import '../../Package/ElevatedButton.dart';

Color white = Colors.white;
Color black = Colors.black;
Color red = Colors.red;
Color blueAccent = Colors.blueAccent;
Color transparent = Colors.transparent;
Color border = Colors.grey.shade200;

Color themeColor = const Color(0xFF5EC401);
Color themeColor2 = const Color(0xFFFF5552);
Color themeColor3 = const Color(0xFFF37A20);
Color textColor1 = const Color(0xFF37474F);
Color textColor2 = const Color(0xFF3E3E3E);
Color textColor3 = const Color(0xFF3E3E3E).withOpacity(.54);
Color textColor4 = const Color(0xFFF37A20);
Color textColor5 = const Color(0xFF37474F).withOpacity(.72);
Color textColor6 = const Color(0xFF777777);
Color progress = const Color(0xFF37474F).withOpacity(.14);
Color backgroundColor1 = const Color(0xFFF3F4F4);
Color backgroundColor2 = const Color(0xFF236CD9).withOpacity(.12);
Color backgroundColor3 = const Color(0xFFF0F1F2);

Color button1 = const Color(0xFF36B37E).withOpacity(.14);
Color button2 = const Color(0xFF236CD9);
Color color1 = const Color(0xFFF37A20).withOpacity(.14);
Color color2 = const Color(0xFFFF5552).withOpacity(.14);

sizeH10() {
  return const SizedBox(height: 10);
}

sizeW10() {
  return const SizedBox(width: 10);
}

sizeH25() {
  return const SizedBox(height: 25);
}

sizeW25() {
  return const SizedBox(width: 25);
}

sizeH(double h) {
  return SizedBox(height: h);
}

sizeW(double w) {
  return SizedBox(width: w);
}

radius(double d) {
  return BorderRadius.circular(d);
}

visible(BuildContext context) {
  return MediaQuery.of(context).viewInsets.bottom == 0;
}

Future<dynamic> dialogSuccess(BuildContext context) {
  return showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: radius(10)),
            backgroundColor: white,
            icon: Icon(
              Icons.check_circle,
              color: themeColor,
              size: 65,
            ),
            content: TextFW500(
              text: 'Product Added',
              fontSize: 25,
              textcolor: textColor1,
              textAlign: TextAlign.center,
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
            actions: [
              Center(
                child: CustomButton(
                  radius: 10,
                  onPress: () {
                    Nav.pop(context);
                  },
                  height: 45,
                  width: 175,
                  label: 'OK',
                  txtcolor: white,
                  bgcolor: themeColor,
                ),
              ),
              sizeH(20)
            ],
          ));
}

Future<dynamic> dialogEdit(BuildContext context) {
  return showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: radius(10)),
            backgroundColor: white,
            icon: const Icon(
              Icons.upcoming_rounded,
              color: Colors.blue,
              size: 65,
            ),
            content: TextFW500(
              text: 'Details are Edited!!!',
              fontSize: 25,
              textcolor: textColor1,
              textAlign: TextAlign.center,
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
            actions: [
              Center(
                child: CustomButton(
                  radius: 10,
                  onPress: () {
                    Nav.pop(context);
                  },
                  height: 45,
                  width: 175,
                  label: 'OK',
                  txtcolor: white,
                  bgcolor: Colors.blue,
                ),
              ),
              sizeH(20)
            ],
          ));
}
