import 'package:flutter/material.dart';
import 'package:grocery_plus/Package/CustomeTexts.dart';
import 'package:grocery_plus/Package/RippleEffectContainer.dart';
import 'package:grocery_plus/Package/ScrollColorRemove.dart';
import 'package:get/get.dart';
import 'package:grocery_plus/Presentation/Screens/EditProfileScreen.dart';
import 'package:grocery_plus/Presentation/Screens/MyAddressScreen.dart';
import 'package:grocery_plus/Presentation/Screens/MyBagScreen.dart';
import 'package:grocery_plus/Presentation/Screens/WishListScreen.dart';
import '../../Package/Constants.dart';
import '../../Package/CustomePadding.dart';
import '../Utils/Constants.dart';

class MoreScreen extends StatelessWidget {
  MoreScreen({super.key});

  List<Data> listItems = [
    Data(
        img: 'assets/images/navIcon1.png',
        title: 'Edit Profile',
        height: 20,
        onTap: () => Nav.pushMaterial(Get.context!, EditProfileScreen())),
    Data(
        img: 'assets/images/navIcon2.png',
        title: 'My Address',
        height: 20,
        onTap: () => Nav.pushMaterial(Get.context!, MyAddressScreen())),
    Data(
        img: 'assets/images/navIcon3.png',
        title: 'My Orders',
        height: 20,
        onTap: () => Nav.pushMaterial(Get.context!, MyBagScreen())),
    Data(
        img: 'assets/images/navIcon4.png',
        title: 'My Wishlist',
        height: 20,
        onTap: () => Nav.pushMaterial(Get.context!, WishListScreen())),
    Data(
        img: 'assets/images/navIcon5.png',
        title: 'Chat with us',
        height: 20,
        onTap: () => Nav.pushMaterial(Get.context!, EditProfileScreen())),
    Data(
        img: 'assets/images/navIcon6.png',
        title: 'Talk to our Support',
        height: 20,
        onTap: () => Nav.pushMaterial(Get.context!, EditProfileScreen())),
    Data(
        img: 'assets/images/navIcon7.png',
        title: 'Mail to us',
        height: 20,
        onTap: () => Nav.pushMaterial(Get.context!, EditProfileScreen())),
    Data(
        img: 'assets/images/navIcon8.png',
        title: 'Message to facebook page',
        height: 20,
        onTap: () => Nav.pushMaterial(Get.context!, EditProfileScreen())),
    Data(
        img: 'assets/images/navIcon9.png',
        title: 'Log out',
        height: 20,
        onTap: () => Nav.pushMaterial(Get.context!, EditProfileScreen())),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sizeH(45),
          CP(
            h: 16,
            child: TextFW500(
              text: 'More',
              fontSize: 20,
              textcolor: textColor1,
            ),
          ),
          sizeH(40),
          CP(
            h: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      color: textColor1, borderRadius: radius(80)),
                  child: Image.asset('assets/images/profile.png'),
                ),
                sizeW10(),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextFW500(
                      text: 'Manan Koyawala',
                      fontSize: 18,
                      textcolor: textColor1,
                    ),
                    sizeH10(),
                    FittedBox(
                      child: TextFW400(
                        text: 'manankoyawala5565@gmail.com',
                        fontSize: 16,
                        fontFamily: 'poppins',
                        textcolor: textColor1,
                      ),
                    )
                  ],
                ))
              ],
            ),
          ),
          sizeH(20),
          Expanded(
            child: ScrollColorRemove(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: listItems.length,
                itemBuilder: (context, index) {
                  return Items(
                      img: listItems[index].img,
                      title: listItems[index].title,
                      height: listItems[index].height,
                      onTap: listItems[index].onTap);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Items extends StatelessWidget {
  const Items({
    super.key,
    required this.img,
    required this.title,
    required this.height,
    required this.onTap,
  });
  final String img;
  final String title;
  final double height;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return ClickEffect(
      onTap: onTap,
      borderRadius: radius(0),
      child: Container(
        padding: const EdgeInsets.only(bottom: 20, top: 20),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
          color: border,
        ))),
        child: CP(
          h: 16,
          child: Row(
            children: [
              Container(
                alignment: Alignment.center,
                height: height,
                width: 40,
                child: Image.asset(
                  img,
                  // height: imageHeight,
                ),
              ),
              sizeW10(),
              TextFW500(
                text: title,
                fontSize: 16,
                textcolor: textColor1,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Data {
  final String img;
  final String title;
  final double height;
  final VoidCallback onTap;
  Data({
    required this.img,
    required this.title,
    required this.height,
    required this.onTap,
  });
}
