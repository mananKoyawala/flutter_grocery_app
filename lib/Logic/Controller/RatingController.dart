import 'package:get/get.dart';

class RatingController extends GetxController {
  var ratingIndex = 3.0.obs;

  void changeRating(double rate) {
    ratingIndex.value = rate;
  }
}
