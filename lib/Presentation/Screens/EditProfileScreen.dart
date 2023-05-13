import 'package:flutter/material.dart';
import 'package:grocery_plus/Package/ElevatedButton.dart';
import 'package:grocery_plus/Package/ScrollColorRemove.dart';
import 'package:grocery_plus/Package/Constants.dart';
import 'package:grocery_plus/Package/CustomePadding.dart';
import 'package:grocery_plus/Package/CustomeTexts.dart';
import 'package:grocery_plus/Package/RippleEffectContainer.dart';
import 'package:grocery_plus/Presentation/Screens/ProductNotFound.dart';
import 'package:grocery_plus/Presentation/Utils/Constants.dart';

import '../../Package/TextFormFeilds.dart';
import '../Utils/Widgets/Buttons/SaveButton.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});
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
                  text: 'Edit Profile',
                  fontSize: 24,
                  textcolor: textColor1,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
          ),
          Expanded(
            child: CP(
              h: 16,
              child: ScrollColorRemove(
                child: ListView(
                  children: [
                    Center(
                      child: Stack(
                        children: [
                          CircleAvatar(
                            radius: 60,
                            backgroundColor: red,
                            child: Image.asset('assets/images/profile.png'),
                          ),
                          Positioned(
                            bottom: 5,
                            left: 85,
                            child: CircleAvatar(
                              backgroundColor: themeColor3,
                              radius: 15,
                              child: Icon(
                                Icons.camera_enhance,
                                size: 18,
                                color: white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    sizeH(35),
                    TextFFeild(
                        border: true,
                        hintStyle: const TextStyle(),
                        focus: false,
                        mainColor: black,
                        hintText: 'Full Name',
                        prifixIcon: Container(
                          padding: const EdgeInsets.all(15),
                          height: 40,
                          child: const Icon(Icons.person),
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
                    sizeH25(),
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
                        hintText: 'Phone Number',
                        prifixIcon: Container(
                          padding: const EdgeInsets.all(15),
                          height: 40,
                          child: const Icon(Icons.phone),
                        ),
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.text,
                        obsecureText: false,
                        borderRadius: 8,
                        funValidate: (val) {
                          if (val != null && val.isEmpty) {
                            return "Phone Number required";
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
                  label: 'Save',
                  isIcon: true,
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
