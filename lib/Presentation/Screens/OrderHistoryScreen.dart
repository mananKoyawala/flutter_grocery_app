import 'package:flutter/material.dart';
import 'package:grocery_plus/Package/ElevatedButton.dart';
import 'package:grocery_plus/Package/ScrollColorRemove.dart';
import 'package:grocery_plus/Package/Constants.dart';
import 'package:grocery_plus/Package/CustomePadding.dart';
import 'package:grocery_plus/Package/CustomeTexts.dart';
import 'package:grocery_plus/Package/RippleEffectContainer.dart';
import 'package:grocery_plus/Presentation/Utils/Constants.dart';

class OrderHistoryScreen extends StatelessWidget {
  OrderHistoryScreen({super.key});
  ScrollController controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
                    text: 'Orders',
                    fontSize: 25,
                    textcolor: textColor1,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            ),
            TabBar(
                indicatorColor: themeColor,
                indicatorWeight: 3,
                labelColor: themeColor,
                unselectedLabelColor: textColor3,
                indicatorPadding: const EdgeInsets.symmetric(horizontal: 30),
                tabs: const [
                  Tab(
                    child: Text(
                      "Ongoing",
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "History",
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                    ),
                  )
                ]),
            Expanded(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * .5,
                child: TabBarView(
                  children: [
                    const CP(h: 16, child: Ongoing()),
                    Container(
                      child: Text('History'),
                    ),
                  ],
                ),
              ),
            ),
            sizeH(16)
          ],
        )),
      ),
    );
  }
}

class Ongoing extends StatelessWidget {
  const Ongoing({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
              border: Border(
            bottom: BorderSide(color: textColor3, width: 1),
          )),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                    height: 40, child: Image.asset('assets/images/bag.png')),
                sizeW(20),
                Expanded(
                    child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFW500(
                            text: 'Order #345',
                            fontSize: 16,
                            textcolor: textColor1),
                        // sizeH(1),
                        TextFW500(
                          text: 'Deliverd',
                          fontSize: 14,
                          textcolor: themeColor,
                          fontWeight: FontWeight.w300,
                        ),
                        // sizeH(1),
                        TextFW500(
                          text: 'October 26, 2019',
                          fontSize: 12,
                          textcolor: textColor5,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                    TextFW500(
                        text: '৳700', fontSize: 20, textcolor: textColor4),
                  ],
                )),
              ]),
        );
      },
    );
  }
}
