import 'package:flutter/material.dart';
import 'package:grocery_plus/Package/Constants.dart';
import 'package:grocery_plus/Package/CustomePadding.dart';
import 'package:grocery_plus/Package/CustomeTexts.dart';
import 'package:grocery_plus/Package/RippleEffectContainer.dart';
import 'package:grocery_plus/Package/ScrollColorRemove.dart';
import 'package:grocery_plus/Presentation/Utils/Constants.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

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
                    text: 'Product Details',
                    fontSize: 25,
                    textcolor: textColor1,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  CP(
                    h: 16,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            margin: const EdgeInsets.symmetric(horizontal: 30),
                            height: 250,
                            child: Image.asset(
                              'assets/images/product1.png',
                              height: 500,
                            )),
                        sizeH(35),
                        TextFW500(
                            text: 'Arla DANO Full Cream Milk Powder Instant',
                            fontSize: 20,
                            textcolor: textColor1),
                        sizeH(20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextFW500(
                                text: '1 KG',
                                fontSize: 29,
                                textcolor: textColor2),
                            TextFW500(
                                text: '৳182',
                                fontSize: 29,
                                textcolor: themeColor),
                          ],
                        ),
                        sizeH25(),
                        Row(
                          children: [
                            SizedBox(
                              height: 25,
                              child: Image.asset('assets/images/hamBurger.png'),
                            ),
                            sizeW10(),
                            TextFW500(
                                text: 'Dairy Products',
                                fontSize: 16,
                                textcolor: textColor2),
                          ],
                        ),
                        sizeH(30),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(Icons.menu),
                            sizeW10(),
                            Expanded(
                              child: TextFW500(
                                  text:
                                      'Et quidem faciunt, ut summum bonum sit extremum et rationibus conquisitis de voluptate. Sed ut summum bonum sit id,',
                                  fontSize: 16,
                                  textcolor: textColor2),
                            ),
                          ],
                        ),
                        sizeH25(),
                        TextFW500(
                            text: 'You can also check this items',
                            fontSize: 16,
                            textcolor: textColor1),
                        sizeH25(),
                      ],
                    ),
                  ),
                  MoreItems(
                    onTap: () {},
                    img: 'assets/images/product1.png',
                    title: 'Nestle Nido Full Cream Milk Powder Instant',
                    originalPrice: '৳342',
                    offerPrice: '৳270',
                  )
                ],
              ),
            ),
            sizeH(16)
          ],
        ),
      ),
    );
  }
}

class MoreItems extends StatelessWidget {
  const MoreItems({
    super.key,
    required this.onTap,
    required this.title,
    required this.img,
    required this.offerPrice,
    required this.originalPrice,
  });
  final VoidCallback onTap;
  final String title;
  final String img;
  final String offerPrice;
  final String originalPrice;
  @override
  Widget build(BuildContext context) {
    return ClickEffect(
      onTap: onTap,
      borderRadius: radius(0),
      child: Container(
        padding: const EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: textColor3, width: 1))),
        height: 140,
        width: DP.infinity(context),
        child: CP(
          h: 16,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 120,
                child: Image.asset(img),
              ),
              sizeW25(),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFW500(
                    text: title,
                    fontSize: 16,
                    textcolor: textColor1,
                  ),
                  sizeH10(),
                  TextFW500(
                    text: originalPrice,
                    fontSize: 14,
                    textcolor: textColor3,
                  ),
                  TextFW500(
                    text: offerPrice,
                    fontSize: 20,
                    textcolor: textColor4,
                  ),
                ],
              )),
              Container()
            ],
          ),
        ),
      ),
    );
  }
}
