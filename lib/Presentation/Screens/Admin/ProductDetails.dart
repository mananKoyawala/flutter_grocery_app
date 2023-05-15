import 'package:flutter/material.dart';
import 'package:grocery_plus/Package/Constants.dart';
import 'package:grocery_plus/Package/CustomePadding.dart';
import 'package:grocery_plus/Package/CustomeTexts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grocery_plus/Package/RippleEffectContainer.dart';
import 'package:grocery_plus/Package/ScrollColorRemove.dart';
import 'package:grocery_plus/Presentation/Utils/Constants.dart';

class ProductDetails extends StatelessWidget {
  ProductDetails({super.key, required this.list});
  final DocumentSnapshot<Object?> list;
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
                            alignment: Alignment.center,
                            margin: const EdgeInsets.symmetric(horizontal: 30),
                            height: 250,
                            child: Image.network(
                              list['imgurl'],
                              height: 500,
                            )),
                        sizeH(35),
                        TextFW500(
                            text: list['title'],
                            fontSize: 20,
                            textcolor: textColor1),
                        sizeH(20),
                        TextFW500(
                            text: 'Brand Name :- ${list['brandname']}',
                            fontSize: 18,
                            textcolor: textColor2),
                        sizeH(20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextFW500(
                                text: 'Available Stock :- ${list['stock']}',
                                fontSize: 18,
                                textcolor: textColor2),
                            TextFW500(
                                text: '${list['price']}₹',
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
                                  text: list['description'],
                                  fontSize: 16,
                                  textcolor: textColor2),
                            ),
                          ],
                        ),
                        sizeH25(),
                        TextFW500(
                            text: 'Status',
                            fontSize: 20,
                            textcolor: textColor1),
                        TextFW500(
                            text: list['status'] ? 'Visible' : 'Not Visible',
                            fontSize: 18,
                            textcolor: list['status'] ? themeColor : red),
                      ],
                    ),
                  ),
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
