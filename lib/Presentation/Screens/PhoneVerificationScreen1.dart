import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery_plus/Package/Constants.dart';
import 'package:grocery_plus/Package/CustomePadding.dart';
import 'package:grocery_plus/Package/CustomeTexts.dart';
import 'package:grocery_plus/Package/ScrollColorRemove.dart';
import 'package:grocery_plus/Presentation/Utils/Widgets/Buttons/SaveButton.dart';

import '../../Package/TextFormFeilds.dart';
import '../Utils/Constants.dart';
import 'PhoneVerificationScreen2.dart';

class PhoneVerificationScreen1 extends StatelessWidget {
  PhoneVerificationScreen1({super.key});
  ScrollController controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        body: ScrollColorRemove(
          child: CustomScrollView(
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
                            h: 10,
                            child: SvgPicture.asset(
                              'assets/images/loginIcon1.svg',
                              height: DP.dHeight(context, 2),
                            ),
                          ),
                          CP(
                            h: 16,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextFW500(
                                  text: 'Enter your mobile number',
                                  fontSize: 20,
                                  textcolor: textColor1,
                                ),
                                TextFW500(
                                  text:
                                      'We need to verify you. We will send you a one time verification code.',
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
                                TextFFeild(
                                    border: true,
                                    hintStyle: const TextStyle(),
                                    focus: false,
                                    mainColor: black,
                                    hintText: 'Full Name',
                                    prifixIcon: Container(
                                      padding: const EdgeInsets.all(15),
                                      height: 40,
                                      child: const Icon(
                                        Icons.phone,
                                      ),
                                    ),
                                    textInputAction: TextInputAction.next,
                                    textInputType: TextInputType.text,
                                    obsecureText: false,
                                    borderRadius: 8,
                                    funValidate: (val) {
                                      if (val != null && val.isEmpty) {
                                        return "Full Name required";
                                      }
                                      return null;
                                    }),
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
                                  label: 'Next',
                                  icon: Icons.arrow_forward,
                                  isIcon: true,
                                  backgroundColor: themeColor,
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                PhoneVerificationScreen2()));
                                  }))),
                    ),
                    sizeH(16)
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
