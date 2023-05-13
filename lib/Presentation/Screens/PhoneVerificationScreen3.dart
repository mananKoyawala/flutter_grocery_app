import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery_plus/Logic/Controller/SmallController.dart';
import 'package:grocery_plus/Package/Constants.dart';
import 'package:grocery_plus/Package/CustomePadding.dart';
import 'package:grocery_plus/Package/CustomeTexts.dart';
import 'package:grocery_plus/Package/ElevatedButton.dart';
import 'package:grocery_plus/Package/ScrollColorRemove.dart';
import 'package:grocery_plus/Presentation/Utils/Widgets/Buttons/SaveButton.dart';

import '../../Package/TextFormFeilds.dart';
import '../Utils/Constants.dart';
import '../Utils/OTP/PinTheme.dart';
import '../Utils/OTP/animation_Enam.dart';
import '../Utils/OTP/pin_feild.dart';
import 'PhoneVerificationScreen4.dart';

class PhoneVerificationScreen3 extends StatelessWidget {
  PhoneVerificationScreen3({super.key});
  ScrollController controller = ScrollController();
  StreamController<ErrorAnimationType>? errorController;
  TextEditingController textEditingController = TextEditingController();
  SmallController smallController = SmallController();
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
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                                text: 'Enter Verification Code',
                                fontSize: 20,
                                textcolor: textColor1,
                              ),
                              TextFW500(
                                text: 'We have sent SMS to:',
                                fontFamily: 'poppins',
                                fontSize: 14,
                                textcolor: textColor1,
                              ),
                              TextFW700(
                                text: '01XXXXXXXXXX',
                                fontSize: 14,
                                textcolor: textColor1,
                                fontWeight: FontWeight.w900,
                              ),
                            ],
                          ),
                        ),
                        sizeH(40),
                        CP(
                          h: 16,
                          child: Column(children: [
                            PinCodeTextField(
                              appContext: context,
                              pastedTextStyle: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                              length: 6,
                              obscureText: false,
                              obscuringCharacter: '*',
                              blinkWhenObscuring: false,
                              animationType: AnimationType.fade,
                              pinTheme: PinTheme(
                                  shape: PinCodeFieldShape.box,
                                  borderRadius: BorderRadius.circular(5),
                                  fieldHeight: 48,
                                  inactiveColor: Colors.transparent,
                                  selectedColor: Colors.transparent,
                                  selectedFillColor: Colors.white,
                                  inactiveFillColor: Colors.white,
                                  fieldWidth: 48,
                                  activeFillColor: Colors.transparent,
                                  activeColor: Colors.transparent),
                              cursorColor: Colors.black,
                              animationDuration:
                                  const Duration(milliseconds: 300),
                              enableActiveFill: true,
                              errorAnimationController: errorController,
                              controller: textEditingController,
                              keyboardType: TextInputType.number,
                              boxShadows: const [],
                              onCompleted: (v) {
                                debugPrint("Completed");
                              },
                              onChanged: (value) {
                                debugPrint(value);
                                smallController.changeValue(value);
                                print(smallController.currentValue.value
                                    .toString());
                              },
                              beforeTextPaste: (text) {
                                debugPrint("Allowing to paste $text");
                                return true;
                              },
                            ),
                            sizeH10(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomTextButton(
                                    onPressed: () {},
                                    textStyle: TextStyle(
                                        color: themeColor3,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'poppins'),
                                    title: 'Resend OTP'),
                                CustomTextButton(
                                    onPressed: () {},
                                    textStyle: TextStyle(
                                        color: Colors.grey.shade500,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'poppins'),
                                    title: 'Change Phone Number'),
                              ],
                            )
                          ]),
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
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => PhoneVerificationScreen4()));

                                }))),
                  ),
                  sizeH(16)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
