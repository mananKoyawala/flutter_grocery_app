import 'package:flutter/material.dart';
import 'package:grocery_plus/Logic/Controller/Authentication.dart';
import 'package:grocery_plus/Package/CustomeTexts.dart';
import 'package:grocery_plus/Package/ElevatedButton.dart';
import 'package:grocery_plus/Package/RippleEffectContainer.dart';
import 'package:grocery_plus/Package/ScrollColorRemove.dart';
import 'package:grocery_plus/Presentation/Screens/Admin/AdminListProducts.dart';
import 'package:grocery_plus/Presentation/Utils/Constants.dart';

import '../../Package/Constants.dart';
import '../../Package/CustomePadding.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  ScrollController sController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: ScrollColorRemove(
          child: CP(
        h: 16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sizeH(45),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextFW700(
                  text: 'Category',
                  fontSize: 25,
                  textcolor: textColor1,
                  fontWeight: FontWeight.w600,
                ),
                CustomTextButton(
                    onPressed: () {
                      Nav.pushMaterial(context, AdminListProducts());
                    },
                    textStyle: TextStyle(color: textColor1, fontSize: 18),
                    title: 'Admin')
              ],
            ),
            Expanded(
              child: GridView.count(
                controller: sController,
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                children: [
                  CategoryContainer(
                    img: 'assets/images/img1.png',
                    title: 'Fruits & Vegetables',
                    onTap: () {},
                  ),
                  CategoryContainer(
                    img: 'assets/images/img2.png',
                    title: 'Breakfast',
                    onTap: () {},
                  ),
                  CategoryContainer(
                    img: 'assets/images/img3.png',
                    title: 'Beverages',
                    onTap: () {},
                  ),
                  CategoryContainer(
                    img: 'assets/images/img4.png',
                    title: 'Meat & Fish',
                    onTap: () {},
                  ),
                  CategoryContainer(
                    img: 'assets/images/img5.png',
                    title: 'Snacks',
                    onTap: () {
                      Nav.push(context, '/snacks');
                    },
                  ),
                  CategoryContainer(
                    img: 'assets/images/img6.png',
                    title: 'Dairy',
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}

class CategoryContainer extends StatelessWidget {
  const CategoryContainer({
    super.key,
    required this.title,
    required this.img,
    required this.onTap,
  });
  final String title;
  final String img;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return ClickEffect(
      onTap: onTap,
      borderRadius: radius(10),
      child: Container(
        height: 160,
        width: DP.width(context, 5),
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(color: white, borderRadius: radius(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(img),
            TextFW500(
              text: title,
              fontSize: 13,
              textcolor: textColor1,
            ),
          ],
        ),
      ),
    );
  }
}
