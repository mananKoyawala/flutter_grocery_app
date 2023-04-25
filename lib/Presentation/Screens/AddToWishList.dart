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

class AddToWishListScreen extends StatelessWidget {
  AddToWishListScreen({super.key});
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
                  text: 'Add to Wishlist',
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
              child: ListView(
                children: [
                  sizeH(30),
                  TextFFeild(
                      border: true,
                      hintStyle: const TextStyle(),
                      focus: false,
                      mainColor: Colors.grey,
                      hintText: 'Product Name',
                      prifixIcon: Container(
                        padding: const EdgeInsets.all(12),
                        height: 40,
                        child: Image.asset(
                          'assets/images/productName.png',
                          height: 10,
                        ),
                      ),
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.text,
                      obsecureText: false,
                      borderRadius: 8,
                      funValidate: (val) {
                        if (val != null && val.isEmpty) {
                          return "Product Name required";
                        }
                        return null;
                      }),
                  sizeH25(),
                  TextFFeild(
                      border: true,
                      hintStyle: const TextStyle(),
                      focus: false,
                      mainColor: Colors.grey,
                      hintText: 'Amount',
                      prifixIcon: Container(
                        padding: const EdgeInsets.all(16),
                        height: 40,
                        child: Image.asset(
                          'assets/images/range.png',
                          height: 10,
                        ),
                      ),
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.text,
                      obsecureText: false,
                      borderRadius: 8,
                      funValidate: (val) {
                        if (val != null && val.isEmpty) {
                          return "Amount required";
                        }
                        return null;
                      }),
                  sizeH25(),
                  TextFFeild(
                      border: true,
                      hintStyle: const TextStyle(),
                      focus: false,
                      mainColor: Colors.grey,
                      hintText: 'Brand (Optional)',
                      prifixIcon: Container(
                        padding: const EdgeInsets.all(15),
                        height: 40,
                        child: Image.asset(
                          'assets/images/brand.png',
                          height: 10,
                        ),
                      ),
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.text,
                      obsecureText: false,
                      borderRadius: 8,
                      funValidate: (val) {
                        if (val != null && val.isEmpty) {
                          return "Title required";
                        }
                        return null;
                      }),
                  sizeH25(),
                  ClickEffect(
                    onTap: () {},
                    borderRadius: radius(10),
                    child: Container(
                      height: 180,
                      width: DP.infinity(context),
                      decoration: BoxDecoration(
                        borderRadius: radius(10),
                        color: textColor3,
                      ),
                      child: DottedBorder(
                        color: black,
                        dashPattern: const [10, 15],
                        child: SizedBox(
                          height: 180,
                          width: DP.infinity(context),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/camera.png',
                                height: 60,
                              ),
                              sizeH25(),
                              TextFW500(
                                text: 'Upload Image Here',
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                textcolor: textColor5,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          CP(
            h: 16,
            child: Visibility(
              visible: visible(context),
              child: SaveButton(
                  height: 48,
                  width: DP.infinity(context),
                  label: 'Save to Wishlist',
                  icon: Icons.save_outlined,
                  backgroundColor: themeColor,
                  onTap: () {}),
            ),
          ),
          sizeH(16)
        ],
      )),
    );
  }
}
