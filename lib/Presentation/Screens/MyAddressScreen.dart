import 'package:flutter/material.dart';
import 'package:grocery_plus/Package/ElevatedButton.dart';
import 'package:grocery_plus/Package/ScrollColorRemove.dart';
import 'package:grocery_plus/Package/Constants.dart';
import 'package:grocery_plus/Package/CustomePadding.dart';
import 'package:grocery_plus/Package/CustomeTexts.dart';
import 'package:grocery_plus/Package/RippleEffectContainer.dart';
import 'package:grocery_plus/Presentation/Utils/Constants.dart';

import '../Utils/Widgets/Buttons/SaveButton.dart';

class MyAddressScreen extends StatelessWidget {
  MyAddressScreen({super.key});
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
                  onTap: () {},
                  borderRadius: radius(10),
                  child: const Icon(
                    Icons.arrow_back,
                    size: 24,
                  ),
                ),
                sizeW(10),
                TextFW700(
                  text: 'My Addresses',
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
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return AddressItem(
                    title: 'Home',
                    subtitle: '51/5A, Road: 7, Pallabi, Dhaka ddd ddd',
                    onEdit: () {},
                    onDelete: () {},
                  );
                },
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
                  label: 'Add New Address',
                  icon: Icons.add,
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
