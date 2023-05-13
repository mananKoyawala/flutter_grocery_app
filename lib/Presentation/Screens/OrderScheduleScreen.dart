import 'package:flutter/material.dart';
import 'package:grocery_plus/Package/ElevatedButton.dart';
import 'package:grocery_plus/Package/ScrollColorRemove.dart';
import 'package:grocery_plus/Package/Constants.dart';
import 'package:grocery_plus/Package/CustomePadding.dart';
import 'package:grocery_plus/Package/CustomeTexts.dart';
import 'package:grocery_plus/Package/RippleEffectContainer.dart';
import 'package:grocery_plus/Presentation/Utils/Constants.dart';
import 'package:dotted_border/dotted_border.dart';
import '../../Package/TextFormFeilds.dart';
import '../Utils/Widgets/Buttons/SaveButton.dart';

class OrderScheduleScreen extends StatelessWidget {
  OrderScheduleScreen({super.key});
  ScrollController controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScrollColorRemove(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sizeH(45),
          CP(
            h: 16,
            child: Row(
              children: [
                ClickEffect(
                  onTap: () {},
                  borderRadius: radius(10),
                  child: const Icon(
                    Icons.arrow_back,
                    size: 24,
                  ),
                ),
                sizeW(10),
                TextFW700(
                  text: 'Order #345',
                  fontSize: 25,
                  textcolor: textColor1,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
          ),
          Expanded(
            child: CP(
              h: 16,
              child: ListView(
                children: [
                  sizeH(30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextFW500(
                        text: 'Scheduled',
                        fontSize: 16,
                        textcolor: textColor1,
                        fontFamily: 'poppins',
                      ),
                      TextFW500(
                        text: '6:30 pm',
                        fontSize: 17,
                        textcolor: textColor4,
                        fontFamily: 'poppins',
                      )
                    ],
                  ),
                  sizeH10(),
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today_outlined,
                        color: textColor1,
                        size: 24,
                      ),
                      sizeW10(),
                      TextFW500(
                        text: 'March 5, 2019',
                        fontSize: 32,
                        textcolor: textColor1,
                        fontFamily: 'poppins',
                      )
                    ],
                  ),
                  sizeH10(),
                  sizeH10(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const ProgressBar(isProgress: true),
                      sizeW10(),
                      const ProgressBar(isProgress: false),
                      sizeW10(),
                      const ProgressBar(isProgress: false),
                      sizeW10(),
                      const ProgressBar(isProgress: false),
                    ],
                  ),
                  sizeH10(),
                  sizeH10(),
                  TextFW400(
                    text: 'Your order is received',
                    fontSize: 16,
                    textcolor: textColor6,
                    fontFamily: 'poppins',
                  ),
                  sizeH(40),
                  SimpleButton(
                      height: 48,
                      width: DP.infinity(context),
                      label: 'Show Delivery Details',
                      backgroundColor: button1,
                      textColor: themeColor,
                      onTap: () {}),
                  sizeH(20),
                  SimpleButton(
                      height: 48,
                      width: DP.infinity(context),
                      label: 'Show Full Package',
                      backgroundColor: button1,
                      textColor: themeColor,
                      onTap: () {}),
                  sizeH25(),
                  TextFW500(
                    text: 'Delivery Location',
                    fontSize: 16,
                    textcolor: textColor1,
                  ),
                  sizeH10(),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: backgroundColor2,
                        child: Image.asset(
                          'assets/images/location.png',
                          height: 20,
                        ),
                      ),
                      sizeW(15),
                      const Expanded(
                          child: TextFW400(
                        text:
                            'Floor 4, Wakil Tower, Ta 131 Gulshan Badda Link Road',
                        fontSize: 14,
                        fontFamily: 'poppins',
                      ))
                    ],
                  ),
                  sizeH(20),
                  const Divider(thickness: 1),
                  sizeH(10),
                  const TotalRow(label: 'Subtotal', value: 'BDT362'),
                  sizeH10(),
                  const TotalRow(label: 'Delivery Charge', value: 'BDT50'),
                  sizeH10(),
                  const TotalRow(label: 'Total', value: 'BDT412'),
                  sizeH10(),
                  sizeH25(),
                  TextFW500(
                    text: 'Payment Method',
                    fontSize: 16,
                    textcolor: textColor1,
                    fontFamily: 'poppins',
                  ),
                  sizeH(20),
                  Container(
                    height: 85,
                    width: DP.infinity(context),
                    decoration: BoxDecoration(
                      color: button1,
                      borderRadius: radius(10),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        sizeW(20),
                        Container(
                          alignment: Alignment.center,
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              color: themeColor, borderRadius: radius(50)),
                          child: TextFW700(
                            text: '৳',
                            textAlign: TextAlign.center,
                            fontSize: 28,
                            textcolor: white,
                          ),
                        ),
                        sizeW(20),
                        Expanded(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFW400(
                              text: 'You selected',
                              fontSize: 14,
                              textcolor: textColor1,
                              fontFamily: 'poppins',
                            ),
                            sizeH(5),
                            TextFW700(
                              text: 'Cash on Delivery',
                              fontSize: 14,
                              textcolor: textColor1,
                            )
                          ],
                        )),
                        const Icon(Icons.arrow_forward_ios),
                        sizeW25()
                      ],
                    ),
                  ),
                  sizeH25(),
                  const TextFW400(
                    text:
                        'Cash on derivery has some potential risks of spreading contamination. You can select other payment methods for a contactless safe delivery.',
                    fontSize: 14,
                    fontFamily: 'poppins',
                  ),
                  sizeH(120)
                ],
              ),
            ),
          ),
          CP(
            h: 16,
            child: Visibility(
              visible: visible(context),
              child: SaveButton(
                  isIcon: true,
                  height: 48,
                  width: DP.infinity(context),
                  label: 'Contact with Support',
                  icon: Icons.mode_comment_outlined,
                  backgroundColor: themeColor3,
                  onTap: () {}),
            ),
          ),
          sizeH(16),
          CP(
            h: 16,
            child: Visibility(
              visible: visible(context),
              child: SaveButton(
                  height: 48,
                  width: DP.infinity(context),
                  label: 'Cancel Order',
                  icon: Icons.comment,
                  isIcon: false,
                  textColor: themeColor2,
                  backgroundColor: white,
                  onTap: () {}),
            ),
          ),
          sizeH(16)
        ],
      )),
    );
  }
}

class TotalRow extends StatelessWidget {
  const TotalRow({super.key, required this.label, required this.value});
  final String label;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextFW400(
          text: label,
          fontSize: 15,
          textcolor: textColor1,
          fontFamily: 'poppins',
        ),
        TextFW400(
          text: value,
          fontSize: 15,
          textcolor: textColor1,
          fontFamily: 'poppins',
        )
      ],
    );
  }
}

class ProgressBar extends StatelessWidget {
  const ProgressBar({super.key, required this.isProgress});
  final bool isProgress;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 3,
        decoration: BoxDecoration(
            color: isProgress ? themeColor : progress,
            borderRadius: radius(10)),
      ),
    );
  }
}
