import 'package:flutter/material.dart';
import 'package:grocery_plus/Package/ElevatedButton.dart';
import 'package:grocery_plus/Package/ScrollColorRemove.dart';
import 'package:grocery_plus/Package/Constants.dart';
import 'package:grocery_plus/Package/CustomePadding.dart';
import 'package:grocery_plus/Package/CustomeTexts.dart';
import 'package:grocery_plus/Package/RippleEffectContainer.dart';
import 'package:grocery_plus/Presentation/Utils/Constants.dart';

class WishListScreen extends StatelessWidget {
  WishListScreen({super.key});
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
              itemCount: 10,
              itemBuilder: (context, index) {
                return ClickEffect(
                  onTap: () {},
                  borderRadius: radius(0),
                  child: Container(
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
                                TextFW500(
                                  text: '৳342',
                                  fontSize: 14,
                                  textcolor: textColor3,
                                  fontWeight: FontWeight.w300,
                                ),
                                // sizeH(1),
                                TextFW500(
                                  text: '৳270',
                                  fontSize: 20,
                                  textcolor: textColor4,
                                  fontWeight: FontWeight.w400,
                                ),
                              ],
                            )),
                          ]),
                    ),
                  ),
                );
              },
            ),
          ),
          sizeH(16)
        ],
      )),
    );
  }
}
