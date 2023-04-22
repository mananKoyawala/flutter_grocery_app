import 'package:flutter/material.dart';
import 'package:grocery_plus/Logic/Controller/FormController.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:grocery_plus/Package/Constants.dart';
import 'package:grocery_plus/Package/ElevatedButton.dart';

import '../../Package/CustomePadding.dart';
import '../../Package/CustomeTexts.dart';
import '../../Package/RippleEffect.dart';
import '../../Package/TextFormFeilds.dart';
import '../Utils/Constants.dart';

class MyBottomSheet extends StatelessWidget {
  MyBottomSheet(
      {super.key,
      required this.referance,
      required this.docSnap,
      required this.formKey});
  final CollectionReference referance;
  final DocumentSnapshot docSnap;
  final GlobalKey<FormState> formKey;
  String title = '';
  String price = '';
  String desc = '';

  UpdateController controller = UpdateController();
  edit() {
    validate();
  }

  validate() {
    if (formKey.currentState!.validate()) {
      update();
    }
  }

  update() async {
    await referance.doc(docSnap.id).update({
      'title': controller.title.text,
      'price': controller.price.text,
      'description': controller.desc.text,
    });
    Navigator.of(Get.context!).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overScroll) {
          overScroll.disallowIndicator();
          return true;
        },
        child: SingleChildScrollView(
          child: Ink(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
            child: Form(
              key: formKey,
              child: CP(
                h: 16,
                v: 16,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 30),
                    TextFFeild(
                        border: true,
                        hintStyle: TextStyle(),
                        focus: false,
                        mainColor: Colors.grey,
                        labelText: "Title",
                        textInputType: TextInputType.text,
                        obsecureText: false,
                        controller: controller.title,
                        borderRadius: 8,
                        funValidate: (val) {
                          if (val != null && val.isEmpty) {
                            return "Title required";
                          }
                          controller.changeTitle(val!);
                          return null;
                        }),
                    const SizedBox(height: 20),

                    TextFFeild(
                        border: true,
                        hintStyle: TextStyle(),
                        focus: false,
                        mainColor: Colors.grey,
                        labelText: "Price",
                        textInputType: TextInputType.text,
                        obsecureText: false,
                        controller: controller.price,
                        borderRadius: 8,
                        funValidate: (val) {
                          if (val != null && val.isEmpty) {
                            return "Price required";
                          }
                          controller.changePrice(val!);

                          return null;
                        }),
                    const SizedBox(height: 20),

                    TextFFeild(
                        border: true,
                        hintStyle: TextStyle(),
                        focus: false,
                        mainColor: Colors.grey,
                        labelText: "Description",
                        textInputType: TextInputType.text,
                        obsecureText: false,
                        controller: controller.desc,
                        borderRadius: 8,
                        // onChanged: (val) {
                        //   controller.changeDesc(val);
                        //   print(controller.desc.text);
                        // },
                        funValidate: (val) {
                          if (val != null && val.isEmpty) {
                            return "Description required";
                          }
                          controller.changeDesc(val!);

                          return null;
                        }),
                    const SizedBox(height: 30),

                    CustomTextButton(
                        onPressed: edit,
                        textStyle: TextStyle(
                          fontSize: 15,
                          color: black,
                        ),
                        title: 'Edit Data'),
                    // const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
