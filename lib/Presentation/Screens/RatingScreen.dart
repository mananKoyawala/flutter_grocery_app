import 'package:flutter/material.dart';
import 'package:grocery_plus/Package/Constants.dart';
import 'package:grocery_plus/Package/CustomeTexts.dart';
import 'package:grocery_plus/Presentation/Utils/Constants.dart';
import 'package:grocery_plus/Presentation/Utils/Widgets/Buttons/SaveButton.dart';
import 'package:get/get.dart';
import '../../Logic/Controller/RatingController.dart';
import '../../Package/CustomePadding.dart';
import '../../Package/TextFormFeilds.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingScreen extends StatelessWidget {
  RatingScreen({super.key});
  RatingController controller = RatingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: CP(
        h: 16,
        child: Container(
          height: DP.infinity(context),
          width: DP.infinity(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              sizeH(45),
              TextFW500(
                text: 'Please share your \nexperience with us',
                fontSize: 24,
                textcolor: black,
                textAlign: TextAlign.center,
              ),
              sizeH10(),
              Expanded(
                  child: ListView(
                children: [
                  Obx(
                    () => TextFW500(
                      text: controller.ratingIndex.value.toString(),
                      fontSize: 35,
                      textcolor: textColor1,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  sizeH25(),
                  Center(
                    child: RatingBar.builder(
                      initialRating: controller.ratingIndex.value,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      maxRating: 5,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        // p;rint(rating)
                        controller.changeRating(rating);
                      },
                    ),
                  ),
                  sizeH25(),
                  TextFFeild(
                      border: true,
                      hintStyle: const TextStyle(color: Colors.blue),
                      focus: false,
                      mainColor: Colors.grey,
                      hintText: 'Review',
                      maxLines: 5,
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.text,
                      obsecureText: false,
                      borderRadius: 8,
                      funValidate: (val) {
                        if (val != null && val.isEmpty) {
                          return "Title required";
                        }
                        return null;
                      }),
                ],
              )),
              Visibility(
                visible: visible(context),
                child: Column(
                  children: [
                    SaveButton(
                        isIcon: true,
                        height: 48,
                        width: DP.infinity(context),
                        label: 'Submit',
                        icon: Icons.check,
                        backgroundColor: themeColor,
                        onTap: () {}),
                    sizeH(16),
                    SaveButton(
                        isIcon: true,
                        height: 48,
                        width: DP.infinity(context),
                        label: 'Skip',
                        icon: Icons.arrow_forward,
                        backgroundColor: themeColor3,
                        onTap: () {}),
                  ],
                ),
              ),
              sizeH(16),
            ],
          ),
        ),
      ),
    );
  }
}
