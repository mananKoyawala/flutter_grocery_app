import 'package:get/get.dart';

class MyBagController extends GetxController {
  var selected1 = true.obs;
  var selected2 = false.obs;
  var selected3 = false.obs;
  var selected4 = false.obs;
  var selected5 = false.obs;
  var selected6 = false.obs;

  resetAll() {
    selected1.value = false;
    selected2.value = false;
    selected3.value = false;
    selected4.value = false;
    selected5.value = false;
    selected6.value = false;
  }

  void changeSelect1() {
    resetAll();
    selected1.value = true;
  }

  void changeSelect2() {
    resetAll();
    selected2.value = true;
  }

  void changeSelect3() {
    resetAll();
    selected3.value = true;
  }

  void changeSelect4() {
    resetAll();
    selected4.value = true;
  }

  void changeSelect5() {
    resetAll();
    selected5.value = true;
  }

  void changeSelect6() {
    resetAll();
    selected6.value = true;
  }
}
