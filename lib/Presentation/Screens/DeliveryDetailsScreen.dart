import 'package:flutter/material.dart';
import 'package:grocery_plus/Package/ElevatedButton.dart';
import 'package:grocery_plus/Package/ScrollColorRemove.dart';
import 'package:grocery_plus/Package/Constants.dart';
import 'package:grocery_plus/Package/CustomePadding.dart';
import 'package:grocery_plus/Package/CustomeTexts.dart';
import 'package:grocery_plus/Package/RippleEffectContainer.dart';
import 'package:grocery_plus/Presentation/Utils/Constants.dart';
import 'package:dotted_border/dotted_border.dart';
import '../../Package/LineDivider.dart';
import '../../Package/TextFormFeilds.dart';
import '../Utils/Widgets/Buttons/SaveButton.dart';

class DeliveryDetailsScreen extends StatelessWidget {
  DeliveryDetailsScreen({super.key});
  ScrollController controller = ScrollController();
  var itemCount = 10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        body: ScrollColorRemove(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          sizeH(45),
          CP(
            h: 16,
            child: Row(
              children: [
                ClickEffect(
                  onTap: () {
                    Nav.pop(context);
                  },
                  borderRadius: radius(10),
                  child: const Icon(
                    Icons.arrow_back,
                    size: 24,
                  ),
                ),
                sizeW(10),
                TextFW700(
                  text: 'Delivery Details',
                  fontSize: 24,
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
                      sizeH(25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextFW500(
                            text: 'Delivered on',
                            fontSize: 16,
                            textcolor: textColor1,
                            fontFamily: 'poppins',
                          ),
                          TextFW500(
                            text: '6:25 pm',
                            fontSize: 17,
                            textcolor: textColor4,
                            fontFamily: 'poppins',
                          )
                        ],
                      ),
                      sizeH(15),
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
                      sizeH(25),
                      Column(
                        children: [
                          DeatilRow(
                            isFirst: true,
                            isLast: false,
                            isCompleted: false,
                            title: 'Waiting of Confirmation',
                            subtitle: 'November 19, 2012 4:50 AM',
                            backgroundColor: progress,
                          ),
                          DeatilRow(
                            isFirst: false,
                            isLast: false,
                            isCompleted: true,
                            title: 'Delivering to Home',
                            subtitle: 'April 19, 2012 3:30 PM',
                            backgroundColor: button1,
                          ),
                          DeatilRow(
                            isFirst: false,
                            isLast: false,
                            isCompleted: true,
                            title: 'We are packaging your Items',
                            subtitle: 'March 11, 2016 11:08 PM',
                            backgroundColor: backgroundColor2,
                          ),
                          DeatilRow(
                            isFirst: false,
                            isLast: false,
                            isCompleted: true,
                            title: 'Your order is confirmed',
                            subtitle: 'November 19, 2012 4:50 AM',
                            backgroundColor: color1,
                          ),
                          DeatilRow(
                            isFirst: false,
                            isLast: true,
                            isCompleted: true,
                            title: 'Your order is received',
                            subtitle: 'November 19, 2012 4:50 AM',
                            backgroundColor: color2,
                          )
                        ],
                      ),
                    ],
                  ))),
          CP(
            v: 16,
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
        ])));
  }
}

class DeatilRow extends StatelessWidget {
  const DeatilRow({
    super.key,
    required this.isFirst,
    required this.isLast,
    required this.isCompleted,
    required this.title,
    required this.subtitle,
    required this.backgroundColor,
  });
  final bool isFirst;
  final bool isLast;
  final bool isCompleted;
  final String title;
  final String subtitle;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            SizedBox(
                height: 34.5,
                child: LineDivider(
                    direction: Axis.vertical,
                    dashlength: 12,
                    color: isFirst ? white : textColor6)),
            isCompleted
                ? Icon(
                    Icons.check_circle_rounded,
                    size: 20,
                    color: themeColor,
                  )
                : const Icon(
                    Icons.circle_outlined,
                    size: 20,
                  ),
            sizeH(5),
            SizedBox(
                height: 33,
                child: LineDivider(
                    direction: Axis.vertical,
                    dashlength: 12,
                    color: isLast ? white : textColor6)),
          ],
        ),
        sizeW(15),
        Expanded(
            child: Container(
          // alignment: Alignment.center,
          padding: const EdgeInsets.only(left: 16),
          height: 82,
          decoration:
              BoxDecoration(color: backgroundColor, borderRadius: radius(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFW500(
                text: title,
                fontSize: 18,
                textcolor: textColor1,
              ),
              TextFW500(
                text: subtitle,
                fontSize: 14,
                textcolor: textColor1,
                fontFamily: 'poppins',
              )
            ],
          ),
        ))
      ],
    );
  }
}
