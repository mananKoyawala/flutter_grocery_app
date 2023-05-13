import 'package:flutter/material.dart';
import 'package:grocery_plus/Package/ElevatedButton.dart';
import 'package:grocery_plus/Package/ScrollColorRemove.dart';
import 'package:grocery_plus/Package/Constants.dart';
import 'package:grocery_plus/Package/CustomePadding.dart';
import 'package:grocery_plus/Package/CustomeTexts.dart';
import 'package:grocery_plus/Package/RippleEffectContainer.dart';
import 'package:grocery_plus/Presentation/Utils/Constants.dart';
import '../../Logic/Controller/MyBagController.dart';
import '../../Package/TextFormFeilds.dart';
import '../Utils/Widgets/Buttons/SaveButton.dart';
import 'FullPackageDetailScreen.dart';
import 'package:get/get.dart';

class MyBagScreen extends StatelessWidget {
  MyBagScreen({super.key});
  ScrollController controller = ScrollController();
  MyBagController bcontroller = MyBagController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: ScrollColorRemove(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sizeH(45),
          CP(
            h: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFW700(
                  text: 'My Bag',
                  fontSize: 25,
                  textcolor: textColor1,
                  fontWeight: FontWeight.w600,
                ),
                sizeH10(),
                TextFW500(
                  text: 'Products',
                  fontSize: 16,
                  textcolor: textColor1,
                  fontFamily: 'poppins',
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              controller: controller,
              physics: const BouncingScrollPhysics(),
              children: [
                SizedBox(
                  height: 350,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    controller: controller,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Container(
                        // margin: const EdgeInsets.only(top: 10),
                        padding: const EdgeInsets.symmetric(
                          vertical: 20,
                        ),
                        decoration: BoxDecoration(
                            border: Border(
                          bottom: BorderSide(color: border, width: 1),
                        )),
                        child: CP(
                          h: 16,
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                    height: 120,
                                    child:
                                        Image.asset('assets/images/nido.png')),
                                sizeW(20),
                                Expanded(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextFW500(
                                        text:
                                            'Nestle Nido Full Cream Milk Powder Instant',
                                        fontSize: 16,
                                        textcolor: textColor1),
                                    sizeH10(),
                                    TextFW500(
                                      text: '৳342',
                                      fontSize: 14,
                                      textcolor: textColor3,
                                      fontWeight: FontWeight.w300,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextFW500(
                                          text: '৳270',
                                          fontSize: 20,
                                          textcolor: textColor4,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        Row(
                                          children: [
                                            Button(
                                                color: themeColor2,
                                                onClick: () {},
                                                icon: Icons.remove),
                                            sizeW(15),
                                            TextFW500(
                                              text: '1',
                                              fontSize: 14,
                                              textcolor: textColor1,
                                              fontFamily: 'poppins',
                                            ),
                                            sizeW(15),
                                            Button(
                                                color: themeColor,
                                                onClick: () {},
                                                icon: Icons.add),
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                )),
                              ]),
                        ),
                      );
                    },
                  ),
                ),
                CP(
                  h: 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      sizeH(20),
                      SimpleButton(
                          height: 48,
                          width: DP.infinity(context),
                          label: 'Add More Product',
                          backgroundColor: button1,
                          textColor: themeColor,
                          onTap: () {}),
                      sizeH(35),
                      Obx(
                        () => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFW500(
                              text: 'Expected Date & TIme',
                              fontSize: 16,
                              textcolor: textColor1,
                            ),
                            sizeH(25),
                            Row(
                              children: [
                                SelectButton(
                                  onTap: () => bcontroller.changeSelect1(),
                                  isSelected: bcontroller.selected1.value,
                                  label: '8 AM - 11 AM',
                                ),
                                sizeW10(),
                                SelectButton(
                                  onTap: () => bcontroller.changeSelect2(),
                                  isSelected: bcontroller.selected2.value,
                                  label: '11 AM - 12 PM',
                                ),
                                sizeW10(),
                                SelectButton(
                                  onTap: () => bcontroller.changeSelect3(),
                                  isSelected: bcontroller.selected3.value,
                                  label: '12 PM - 2 PM',
                                ),
                              ],
                            ),
                            sizeH10(),
                            Row(
                              children: [
                                SelectButton(
                                  onTap: () => bcontroller.changeSelect4(),
                                  isSelected: bcontroller.selected4.value,
                                  label: '2 PM - 4 PM',
                                ),
                                sizeW10(),
                                SelectButton(
                                  onTap: () => bcontroller.changeSelect5(),
                                  isSelected: bcontroller.selected5.value,
                                  label: '4 PM - 6 PM',
                                ),
                                sizeW10(),
                                SelectButton(
                                  onTap: () => bcontroller.changeSelect6(),
                                  isSelected: bcontroller.selected6.value,
                                  label: '6 PM - 8 PM',
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      sizeH10(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextFW500(
                            text: 'Delivery Location',
                            fontSize: 16,
                            textcolor: textColor1,
                          ),
                          CustomTextButton(
                              onPressed: () {},
                              textStyle: TextStyle(
                                color: themeColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                fontFamily: 'poppins',
                              ),
                              title: 'Change')
                        ],
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
                                  text: 'Tap Here to select your',
                                  fontSize: 16,
                                  textcolor: textColor1,
                                  fontFamily: 'poppins',
                                ),
                                // sizeH(5),
                                TextFW400(
                                  text: 'Payment Method',
                                  fontSize: 16,
                                  textcolor: textColor1,
                                  fontFamily: 'poppins',
                                )
                              ],
                            )),
                            const Icon(Icons.arrow_forward_ios),
                            sizeW25()
                          ],
                        ),
                      ),
                      sizeH25(),
                      SaveButton(
                          isIcon: true,
                          height: 48,
                          width: DP.infinity(context),
                          label: 'Place Order',
                          icon: Icons.arrow_forward,
                          backgroundColor: themeColor,
                          onTap: () {}),
                      sizeH(120)
                    ],
                  ),
                )
              ],
            ),
          ),
          sizeH(16)
        ],
      )),
    );
  }
}

class SelectButton extends StatelessWidget {
  const SelectButton({
    super.key,
    required this.isSelected,
    required this.label,
    required this.onTap,
  });
  final bool isSelected;
  final String label;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ClickEffect(
        onTap: onTap,
        borderRadius: radius(10),
        child: Container(
          alignment: Alignment.center,
          height: 52,
          decoration: BoxDecoration(
              border: Border.all(
                  color: isSelected ? themeColor : transparent, width: 1.5),
              borderRadius: radius(10),
              color: backgroundColor3),
          child: TextFW400(
            text: label,
            fontSize: 12,
            textcolor: isSelected ? themeColor : textColor5,
          ),
        ),
      ),
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
