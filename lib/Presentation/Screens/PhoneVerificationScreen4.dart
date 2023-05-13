import 'package:flutter/material.dart';
import 'package:grocery_plus/Package/ElevatedButton.dart';
import 'package:grocery_plus/Package/ScrollColorRemove.dart';
import 'package:grocery_plus/Package/Constants.dart';
import 'package:grocery_plus/Package/CustomePadding.dart';
import 'package:grocery_plus/Package/CustomeTexts.dart';
import 'package:grocery_plus/Package/RippleEffectContainer.dart';
import 'package:grocery_plus/Presentation/Screens/ProductNotFound.dart';
import 'package:grocery_plus/Presentation/Utils/Constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../Package/TextFormFeilds.dart';
import '../Utils/Widgets/Buttons/SaveButton.dart';
import 'PhoneVerificationScreen5.dart';

class PhoneVerificationScreen4 extends StatelessWidget {
  PhoneVerificationScreen4({super.key});
  ScrollController controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: ScrollColorRemove(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
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
                  text: 'Your Information',
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
              text:
                  'It looks like you don’t have account in this number. Please let us know some information for a scure service',
              fontSize: 14,
              textcolor: Colors.grey.shade500,
              fontFamily: 'poppins',
            ),
          ),
          sizeH(30),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 70,
                backgroundColor: Colors.grey.shade300,
                child: Image.asset(
                  'assets/images/camera.png',
                  height: 55,
                ),
              ),
              sizeH25(),
              CP(
                h: 16,
                child: Container(
                  height: 48,
                  alignment: Alignment.center,
                  decoration:
                      BoxDecoration(color: button2, borderRadius: radius(5)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextFW500(
                        text: 'Sync From Facebook',
                        fontSize: 16,
                        textcolor: white,
                        fontFamily: 'poppins',
                      ),
                    ],
                  ),
                ),
              ),
              sizeH25(),
              CP(
                h: 16,
                child: TextFFeild(
                    border: true,
                    hintStyle: const TextStyle(),
                    focus: false,
                    mainColor: black,
                    hintText: 'Fall Name',
                    prifixIcon: Container(
                      padding: const EdgeInsets.all(15),
                      height: 40,
                      child: const Icon(Icons.person_outline_outlined),
                    ),
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.text,
                    obsecureText: false,
                    borderRadius: 8,
                    funValidate: (val) {
                      if (val != null && val.isEmpty) {
                        return "Full Name required";
                      }
                      return null;
                    }),
              ),
            ],
          )),
          CP(
            h: 16,
            child: Visibility(
              visible: visible(context),
              child: SaveButton(
                  height: 48,
                  width: DP.infinity(context),
                  label: 'Save',
                  isIcon: true,
                  icon: Icons.arrow_forward,
                  backgroundColor: themeColor,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => PhoneVerificationScreen5()));
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
