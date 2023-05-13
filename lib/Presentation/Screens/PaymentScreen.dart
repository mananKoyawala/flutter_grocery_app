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
import 'MoreScreen.dart';

class PaymentScreen extends StatelessWidget {
  PaymentScreen({super.key});
  ScrollController controller = ScrollController();
  List<Data> item = [
    Data(
        img: 'assets/images/payIcon1.png',
        title: 'Credit/Debit Card',
        height: 20,
        onTap: () {}),
    Data(
        img: 'assets/images/payIcon2.png',
        title: 'Net Banking',
        height: 35,
        onTap: () {}),
    Data(
        img: 'assets/images/payIcon4.png',
        title: 'Make payment with UPI',
        height: 40,
        onTap: () {}),
    Data(
        img: 'assets/images/payIcon3.png',
        title: 'Cash on Delivery',
        height: 20,
        onTap: () {}),
  ];
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
                  text: 'Payment Method',
                  fontSize: 24,
                  textcolor: textColor1,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
          ),
          Expanded(
            child: ScrollColorRemove(
              child: ListView.builder(
                itemCount: item.length,
                itemBuilder: (context, index) {
                  return Items(
                      img: item[index].img,
                      title: item[index].title,
                      height: item[index].height,
                      onTap: () {
                        // Navigator.of(context).push(MaterialPageRoute(builder: (_) => ))
                      });
                },
              ),
            ),
          )
        ],
      )),
    );
  }
}
