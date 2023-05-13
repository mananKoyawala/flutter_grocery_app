import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_plus/Presentation/Screens/MainScreen.dart';
import 'package:grocery_plus/Presentation/Screens/MoreScreen.dart';
import 'package:grocery_plus/Presentation/Screens/MyBagScreen.dart';

import '../../Logic/Controller/BottomNavigationController.dart';
import '../Utils/Constants.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  List pages = [
    MainScreen(),
    MainScreen(),
    MyBagScreen(),
    MoreScreen(),
  ];

  void onTap(int index) {
    controller.changeIndex(index);
  }

  BottomNavController controller = BottomNavController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Obx(() => pages[controller.index.value]),
      bottomNavigationBar: Obx(
        () => Container(
          padding: const EdgeInsets.symmetric(vertical: 15),
          decoration: BoxDecoration(
              color: white,
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, -2),
                    color: Colors.grey.shade300,
                    spreadRadius: 1,
                    blurRadius: 10)
              ],
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          child: ClipRRect(
            clipBehavior: Clip.hardEdge,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              onTap: onTap,
              backgroundColor: Colors.white,
              currentIndex: controller.index.value,
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.red,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              unselectedFontSize: 0,
              selectedFontSize: 0,
              selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w800),
              unselectedLabelStyle:
                  const TextStyle(fontWeight: FontWeight.w700),
              items: [
                BottomNavigationBarItem(
                  activeIcon: Container(
                      margin: const EdgeInsets.only(bottom: 5),
                      child: CircleAvatar(
                          backgroundColor: themeColor,
                          radius: 25,
                          child: Icon(
                            Icons.home,
                            color: white,
                          ))),
                  icon: Container(
                      margin: const EdgeInsets.only(bottom: 5),
                      child: Icon(
                        Icons.home_outlined,
                        color: textColor1,
                      )),
                  label: "",
                ),
                BottomNavigationBarItem(
                  activeIcon: Container(
                      margin: const EdgeInsets.only(bottom: 5),
                      child: CircleAvatar(
                          backgroundColor: themeColor,
                          radius: 25,
                          child: Icon(
                            Icons.category,
                            color: white,
                          ))),
                  icon: Container(
                      margin: const EdgeInsets.only(bottom: 5),
                      child: Icon(
                        Icons.category_outlined,
                        color: textColor1,
                      )),
                  label: "",
                ),
                BottomNavigationBarItem(
                  activeIcon: Container(
                      margin: const EdgeInsets.only(bottom: 5),
                      child: CircleAvatar(
                          backgroundColor: themeColor,
                          radius: 25,
                          child: Icon(
                            Icons.badge,
                            color: white,
                          ))),
                  icon: Container(
                      margin: const EdgeInsets.only(bottom: 5),
                      child: Icon(
                        Icons.badge_outlined,
                        color: textColor1,
                      )),
                  label: "",
                ),
                BottomNavigationBarItem(
                  activeIcon: Container(
                      margin: const EdgeInsets.only(bottom: 5),
                      child: CircleAvatar(
                          backgroundColor: themeColor,
                          radius: 25,
                          child: Icon(
                            Icons.menu,
                            color: white,
                          ))),
                  icon: Container(
                      margin: const EdgeInsets.only(bottom: 5),
                      child: Icon(
                        Icons.menu,
                        color: textColor1,
                      )),
                  label: "",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
