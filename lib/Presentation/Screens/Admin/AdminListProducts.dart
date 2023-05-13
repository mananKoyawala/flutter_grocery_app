import 'package:flutter/material.dart';
import 'package:grocery_plus/Logic/Controller/Admin/Controller.dart';
import 'package:grocery_plus/Package/CustomeTexts.dart';
import 'package:grocery_plus/Presentation/Screens/Admin/AddProduct.dart';
import 'package:get/get.dart';
import '../../../Package/Constants.dart';
import '../../../Package/CustomePadding.dart';
import '../../../Package/ScrollColorRemove.dart';
import '../../Utils/Constants.dart';

class AdminListProducts extends StatelessWidget {
  AdminListProducts({super.key});
  Controller controller = Controller();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: white,
          title: TextFW500(
            text: 'Admin Panel',
            fontSize: 20,
            textcolor: textColor1,
          ),
          centerTitle: true,
          actions: [
            PopupMenuButton<int>(
              onSelected: (val) {
                if (val == 1) {
                  Nav.pushMaterial(context, AddProductScreen());
                }
              },
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 1,
                  child: TextFW500(
                    text: 'Add Product',
                    fontSize: 16,
                    textcolor: textColor1,
                  ),
                ),
              ],
            ),
          ]),
      body: ScrollColorRemove(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: CP(
              h: 16,
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(top: 10),
                    padding: const EdgeInsets.only(top: 15),
                    decoration: BoxDecoration(
                        borderRadius: radius(10),
                        border: Border.all(color: textColor1, width: 1)),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                              height: 100,
                              child: Image.asset('assets/images/nido.png')),
                          sizeW(10),
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextFW500(
                                  text:
                                      'Nestle Nido Full Cream Milk Powder Instant',
                                  fontSize: 16,
                                  textcolor: textColor1),
                              sizeH10(),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextFW500(
                                      text: '৳270',
                                      fontSize: 20,
                                      textcolor: textColor4,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: Colors.blue,
                                          child: IconButton(
                                              onPressed: () {},
                                              icon: Icon(
                                                Icons.edit,
                                                color: white,
                                              )),
                                        ),
                                        sizeW10(),
                                        CircleAvatar(
                                          backgroundColor: red,
                                          child: IconButton(
                                              onPressed: () {},
                                              icon: Icon(
                                                Icons.delete,
                                                color: white,
                                              )),
                                        ),
                                        sizeW10()
                                      ],
                                    ),
                                  ]),
                              // sizeH(10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      TextFW400(
                                        text: 'Status',
                                        fontSize: 16,
                                        textcolor: textColor1,
                                        fontFamily: 'poppins',
                                      ),
                                      sizeW(5),
                                      Obx(
                                        () => IconButton(
                                            onPressed: () =>
                                                controller.changestatus(),
                                            icon:
                                                controller.isStatusActive.value
                                                    ? const Icon(
                                                        Icons.visibility,
                                                        color: Colors.green,
                                                      )
                                                    : const Icon(
                                                        Icons.visibility_off,
                                                        color: Colors.red,
                                                      )),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      TextFW400(
                                        text: 'Details',
                                        fontSize: 16,
                                        textcolor: textColor1,
                                        fontFamily: 'poppins',
                                      ),
                                      IconButton(
                                          onPressed: () =>
                                              controller.changestatus(),
                                          icon: Icon(
                                            Icons.arrow_forward,
                                            color: black,
                                          ))
                                    ],
                                  )
                                ],
                              )
                            ],
                          )),
                        ]),
                  );
                },
              ),
            ),
          ),
          sizeH(16)
        ],
      )),
    );
  }
}
