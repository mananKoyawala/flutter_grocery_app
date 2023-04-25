import 'package:flutter/material.dart';
import 'package:grocery_plus/Package/ElevatedButton.dart';
import 'package:grocery_plus/Package/ScrollColorRemove.dart';
import 'package:grocery_plus/Package/Constants.dart';
import 'package:grocery_plus/Package/CustomePadding.dart';
import 'package:grocery_plus/Package/CustomeTexts.dart';
import 'package:grocery_plus/Package/RippleEffectContainer.dart';
import 'package:grocery_plus/Presentation/Utils/Constants.dart';

class SnacksScreen extends StatelessWidget {
  SnacksScreen({super.key});
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
                  text: 'Snacks',
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
            child: GridView.builder(
              itemCount: 10,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.height * .81),
                  crossAxisCount: 2,
                  crossAxisSpacing: 11.0,
                  mainAxisSpacing: 11),
              itemBuilder: (context, index) {
                return ProductContainer(
                    price: '৳60',
                    addToBag: () {},
                    //! 20 charatcter limit of title
                    title:
                        'Radhuni Shemai - 200 gm - 4-2-15-VD-SQ sjjsjsjsj jsjsjsj',
                    img: 'assets/images/snack1.png',
                    onTap: () {});
              },
            ),
          )),
          sizeH(16)
        ],
      )),
    );
  }
}

class ProductContainer extends StatelessWidget {
  const ProductContainer({
    super.key,
    required this.title,
    required this.img,
    required this.onTap,
    required this.price,
    required this.addToBag,
  });
  final String title;
  final String img;
  final VoidCallback onTap;
  final String price;
  final VoidCallback addToBag;

  @override
  Widget build(BuildContext context) {
    return ClickEffect(
      onTap: onTap,
      borderRadius: radius(10),
      child: Container(
        height: 520,
        width: DP.width(context, 5),
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(color: white, borderRadius: radius(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(alignment: Alignment.center, child: Image.asset(img)),
            CP(
              h: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFW500(
                    text: title,
                    fontSize: 13,
                    textcolor: textColor1,
                  ),
                  sizeH(20),
                  TextFW500(
                    text: price,
                    fontSize: 16,
                    textcolor: textColor4,
                  ),
                  sizeH10(),
                  CustomButton(
                      radius: 10,
                      bgcolor: themeColor,
                      txtcolor: white,
                      onPress: () {},
                      size: 12,
                      icon: SizedBox(
                        height: 15,
                        child: Image.asset('assets/images/cart.png'),
                      ),
                      height: 35,
                      width: 150,
                      label: 'Add To Bag'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
