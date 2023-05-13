import 'package:get/get.dart';

class SmallController extends GetxController {
  var visible = true.obs;
  var currentValue = Rx<String>("");

  void changeVisible() {
    visible.toggle();
  }

  changeValue(String val) {
    currentValue.value = val;
  }
}
