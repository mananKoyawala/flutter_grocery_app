import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery_plus/Package/CustomeTexts.dart';
import 'package:grocery_plus/Presentation/Utils/Constants.dart';

class ProductNotFound extends StatelessWidget {
  const ProductNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(30),
          child: SvgPicture.asset(
            'assets/images/productNotFound.svg',
            height: 350,
            width: 20,
          ),
        ),
        // sizeH25(),
        TextFW500(
          text:
              'Opps! We can’t find your product! But you can add it to wishlist',
          fontSize: 16,
          textcolor: textColor1,
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
