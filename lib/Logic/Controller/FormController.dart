import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormController extends GetxController {
  final title = TextEditingController();
  final price = TextEditingController();
  final desc = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  void resetAll() {
    title.clear();
    price.clear();
    desc.clear();
  }
}

class UpdateController extends GetxController {
  final title = TextEditingController();
  final price = TextEditingController();
  final desc = TextEditingController();

  void changeTitle(String t) {
    title.text = t;
  }

  void changePrice(String p) {
    price.text = p;
  }

  void changeDesc(String d) {
    desc.text = d;
  }
}
