import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery_plus/Logic/Controller/SmallController.dart';
import 'package:grocery_plus/Package/Constants.dart';
import 'package:grocery_plus/Package/CustomePadding.dart';
import 'package:grocery_plus/Package/CustomeTexts.dart';
import 'package:grocery_plus/Package/RippleEffectContainer.dart';
import 'package:grocery_plus/Package/ScrollColorRemove.dart';
import 'package:grocery_plus/Presentation/Utils/Widgets/Buttons/SaveButton.dart';
import 'package:get/get.dart';
import '../../Package/ElevatedButton.dart';
import '../../Package/TextFormFeilds.dart';
import '../Utils/Constants.dart';
import 'PhoneVerificationScreen3.dart';

class PhoneVerificationScreen2 extends StatelessWidget {
  PhoneVerificationScreen2({super.key});
  ScrollController controller = ScrollController();
  SmallController smallController = SmallController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        body: ScrollColorRemove(
          child: Stack(children: [
            CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            sizeH25(),
                            sizeH25(),
                            CP(
                              h: 25,
                              child: SvgPicture.asset(
                                'assets/images/loginIcon2.svg',
                                height: DP.dHeight(context, 2),
                              ),
                            ),
                            CP(
                              h: 16,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextFW500(
                                    text: 'Enter the password',
                                    fontSize: 20,
                                    textcolor: textColor1,
                                  ),
                                  TextFW500(
                                    text:
                                        'It looks like you already have an account in this number. Please enter the password to proceed',
                                    fontFamily: 'poppins',
                                    fontSize: 14,
                                    textcolor: textColor1,
                                  ),
                                ],
                              ),
                            ),
                            sizeH(40),
                            CP(
                              h: 16,
                              child: Column(
                                children: [
                                  Obx(
                                    () => TextFFeild(
                                        border: true,
                                        hintStyle: const TextStyle(),
                                        focus: false,
                                        mainColor: black,
                                        hintText: 'Password',
                                        prifixIcon: Container(
                                          padding: const EdgeInsets.all(15),
                                          height: 40,
                                          child: const Icon(Icons.lock),
                                        ),
                                        suffixIconData: ClickEffect(
                                          onTap: () =>
                                              smallController.changeVisible(),
                                          borderRadius: radius(10),
                                          child: Container(
                                            padding: const EdgeInsets.all(15),
                                            height: 40,
                                            child: smallController.visible.value
                                                ? const Icon(Icons.visibility)
                                                : const Icon(
                                                    Icons.visibility_off),
                                          ),
                                        ),
                                        maxLines: 1,
                                        textInputAction: TextInputAction.next,
                                        textInputType: TextInputType.text,
                                        obsecureText:
                                            smallController.visible.value,
                                        borderRadius: 8,
                                        funValidate: (val) {
                                          if (val != null && val.isEmpty) {
                                            return "Password required";
                                          }
                                          return null;
                                        }),
                                  ),
                                  sizeH10(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomTextButton(
                                          onPressed: () {},
                                          textStyle: TextStyle(
                                              color: themeColor3,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'poppins'),
                                          title: 'Forgot Password?'),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Visibility(
                            visible: visible(context),
                            child: CP(
                                h: 16,
                                child: SaveButton(
                                    height: 48,
                                    width: DP.infinity(context),
                                    label: 'Submit',
                                    icon: Icons.arrow_forward,
                                    isIcon: true,
                                    backgroundColor: themeColor,
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (_) =>
                                                  PhoneVerificationScreen3()));
                                    }))),
                      ),
                      sizeH(16)
                    ],
                  ),
                )
              ],
            ),
            CP(
              v: 28,
              child: IconButton(
                  onPressed: () {
                    Nav.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  )),
            )
          ]),
        ));
  }
}
