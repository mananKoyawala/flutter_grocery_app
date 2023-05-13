import 'package:flutter/material.dart';
import 'package:grocery_plus/Package/ElevatedButton.dart';
import 'package:grocery_plus/Package/ScrollColorRemove.dart';
import 'package:grocery_plus/Package/Constants.dart';
import 'package:grocery_plus/Package/CustomePadding.dart';
import 'package:grocery_plus/Package/CustomeTexts.dart';
import 'package:grocery_plus/Package/RippleEffectContainer.dart';
import 'package:grocery_plus/Presentation/Utils/Constants.dart';
import 'package:grocery_plus/Presentation/Utils/Widgets/Buttons/SaveButton.dart';

class FullPackageDetailScreen extends StatelessWidget {
  FullPackageDetailScreen({super.key});
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
                  text: 'Wishist',
                  fontSize: 25,
                  textcolor: textColor1,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                  ),
                  decoration: BoxDecoration(
                      border: Border(
                    bottom: BorderSide(color: textColor3, width: 1),
                  )),
                  child: CP(
                    h: 16,
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                              height: 120,
                              child: Image.asset('assets/images/nido.png')),
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
                          )),
                        ]),
                  ),
                );
              },
            ),
          ),
          sizeH(16),
          CP(
            h: 16,
            child: SaveButton(
                isIcon: true,
                height: 48,
                width: DP.infinity(context),
                label: 'Add New Product',
                icon: Icons.add,
                backgroundColor: themeColor,
                onTap: () {}),
          ),
          sizeH(16)
        ],
      )),
    );
  }
}

class Button extends StatelessWidget {
  const Button(
      {super.key,
      required this.color,
      required this.onClick,
      required this.icon});
  final Color color;
  final VoidCallback onClick;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return ClickEffect(
      onTap: onClick,
      borderRadius: radius(5),
      child: Container(
        height: 25,
        width: 25,
        decoration: BoxDecoration(color: color, borderRadius: radius(5)),
        alignment: Alignment.center,
        child: Icon(
          icon,
          color: white,
          size: 20,
        ),
      ),
    );
  }
}
