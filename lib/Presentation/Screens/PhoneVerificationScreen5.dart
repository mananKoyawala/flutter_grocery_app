import 'package:flutter/material.dart';
import 'package:grocery_plus/Package/ElevatedButton.dart';
import 'package:grocery_plus/Package/ScrollColorRemove.dart';
import 'package:grocery_plus/Package/Constants.dart';
import 'package:grocery_plus/Package/CustomePadding.dart';
import 'package:grocery_plus/Package/CustomeTexts.dart';
import 'package:grocery_plus/Package/RippleEffectContainer.dart';
import 'package:grocery_plus/Presentation/Screens/MainScreen.dart';
import 'package:grocery_plus/Presentation/Screens/ProductNotFound.dart';
import 'package:grocery_plus/Presentation/Utils/Constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../Package/TextFormFeilds.dart';
import '../Utils/Widgets/Buttons/SaveButton.dart';

class PhoneVerificationScreen5 extends StatelessWidget {
  PhoneVerificationScreen5({super.key});
  ScrollController controller = ScrollController();
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
                  text: 'Choose a Password',
                  fontSize: 24,
                  textcolor: textColor1,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
          ),
          sizeH25(),
          CP(
            h: 16,
            child: TextFW400(
              text: 'For the security & safety please choose a password',
              fontSize: 14,
              textcolor: Colors.grey.shade500,
              fontFamily: 'poppins',
            ),
          ),
          CP(
            h: 25,
            child: Center(
              child: SvgPicture.asset(
                'assets/images/loginIcon4.svg',
                height: DP.dHeight(context, 3),
              ),
            ),
          ),
          Expanded(
            child: CP(
              h: 16,
              child: ScrollColorRemove(
                child: ListView(
                  children: [
                    sizeH(35),
                    TextFFeild(
                        border: true,
                        hintStyle: const TextStyle(),
                        focus: false,
                        mainColor: black,
                        hintText: 'Password',
                        prifixIcon: Container(
                          padding: const EdgeInsets.all(15),
                          height: 40,
                          child: const Icon(Icons.lock),
                        ),
                        suffixIconData: Container(
                          padding: const EdgeInsets.all(15),
                          height: 40,
                          child: const Icon(Icons.visibility),
                        ),
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.text,
                        obsecureText: false,
                        borderRadius: 8,
                        funValidate: (val) {
                          if (val != null && val.isEmpty) {
                            return "Password required";
                          }
                          return null;
                        }),
                    sizeH25(),
                    TextFFeild(
                        border: true,
                        hintStyle: const TextStyle(),
                        focus: false,
                        mainColor: black,
                        hintText: 'Confirm Password',
                        prifixIcon: Container(
                          padding: const EdgeInsets.all(15),
                          height: 40,
                          child: const Icon(Icons.lock),
                        ),
                        suffixIconData: Container(
                          padding: const EdgeInsets.all(15),
                          height: 40,
                          child: const Icon(Icons.visibility),
                        ),
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.text,
                        obsecureText: false,
                        borderRadius: 8,
                        funValidate: (val) {
                          if (val != null && val.isEmpty) {
                            return "Confirm required";
                          }
                          return null;
                        }),
                  ],
                ),
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
                  label: 'Finish, Good to go',
                  isIcon: true,
                  icon: Icons.arrow_forward,
                  backgroundColor: themeColor,
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (_) => MainScreen(),
                      maintainState: true,
                    ));
                  }),
            ),
          ),
          sizeH(16)
        ],
      )),
    );
  }
}

class AddressItem extends StatelessWidget {
  const AddressItem(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.onEdit,
      required this.onDelete});
  final String title;
  final String subtitle;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: textColor3, width: 1))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFW500(
                  fontFamily: 'poppins',
                  text: title,
                  fontSize: 16,
                  textcolor: textColor1,
                  fontWeight: FontWeight.w600,
                ),
                TextFW500(
                  fontFamily: 'poppins',
                  text: subtitle,
                  fontSize: 16,
                  textcolor: textColor1,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
          ),
          sizeW10(),
          Row(
            children: [
              CircleAvatar(
                backgroundColor: themeColor3,
                radius: 22,
                child: IconButton(
                  onPressed: onEdit,
                  icon: Icon(
                    Icons.edit_outlined,
                    color: white,
                    size: 25,
                  ),
                ),
              ),
              sizeW10(),
              CircleAvatar(
                radius: 22,
                backgroundColor: themeColor2,
                child: IconButton(
                  onPressed: onDelete,
                  icon: Icon(
                    Icons.delete_outline_outlined,
                    color: white,
                    size: 25,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
