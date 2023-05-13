import 'dart:io';

import 'package:flutter/material.dart';
import 'package:grocery_plus/Logic/Controller/GroceryItemController.dart';
import 'package:grocery_plus/Package/Constants.dart';
import 'package:grocery_plus/Package/CustomeTexts.dart';
import 'package:grocery_plus/Package/ElevatedButton.dart';
import 'package:grocery_plus/Package/ScrollColorRemove.dart';
import 'package:grocery_plus/Presentation/Utils/Constants.dart';
import 'package:get/get.dart';
import 'package:dotted_border/dotted_border.dart';
import '../../Package/CustomePadding.dart';
import '../../Package/RippleEffectContainer.dart';
import '../../Package/TextFormFeilds.dart';
import 'package:image_picker/image_picker.dart';

class AddGroceryScreen extends StatelessWidget {
  AddGroceryScreen({super.key});
  GroceryItemController controller = GroceryItemController();

  validate() {
    if (controller.formKey.currentState!.validate()) {
      if (controller.isImagePicked == false) {
        ScaffoldMessenger.of(Get.context!).showSnackBar(
            const SnackBar(content: Text('Please Select Product Image')));
      } else {
        controller.imageUpload(controller.imgUrl);

        if (controller.image != '') {
          controller.addData();
          controller.resetAll();
          FocusManager.instance.primaryFocus?.unfocus();

          dialogSuccess(Get.context!);
        } else {
          ScaffoldMessenger.of(Get.context!).showSnackBar(const SnackBar(
              content: Text('Please Select Product Image Once again')));
        }
      }
    }
  }

  void pickImageUpload() async {
    controller.imgUrl = (await ImagePicker().pickImage(
        source: ImageSource.gallery,
        maxWidth: 512,
        maxHeight: 512,
        imageQuality: 75));
    controller.changeBool();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: ScrollColorRemove(
          child: CP(
        h: 16,
        child: SizedBox(
          height: DP.infinity(context),
          child: Form(
              key: controller.formKey,
              child: Column(
                children: [
                  sizeH(30),
                  Icon(
                    Icons.playlist_add_check_sharp,
                    color: textColor1,
                    size: 80,
                  ),
                  TextFW500(
                    textAlign: TextAlign.center,
                    text: 'Add Grocery Product',
                    fontSize: 30,
                    textcolor: textColor1,
                  ),
                  Expanded(
                      child: ListView(
                    children: [
                      sizeH25(),
                      sizeH25(),
                      Center(
                        child: Obx(
                          () => ClickEffect(
                            onTap: () {
                              pickImageUpload();
                            },
                            borderRadius: radius(10),
                            child: Container(
                              height: 180,
                              width: DP.dWidth(context, 2),
                              decoration: BoxDecoration(
                                borderRadius: radius(10),
                                color: white,
                              ),
                              child: DottedBorder(
                                color: black,
                                dashPattern: const [10, 15],
                                strokeWidth: 2,
                                child: SizedBox(
                                  height: 180,
                                  width: DP.dWidth(context, 2),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      // ignore: unrelated_type_equality_checks
                                      controller.isImagePicked == false
                                          ? Image.asset(
                                              'assets/images/camera.png',
                                              height: 60,
                                            )
                                          : Icon(
                                              Icons.playlist_add_check_circle,
                                              color: themeColor,
                                              size: 40,
                                            ),
                                      sizeH25(),
                                      TextFW500(
                                        // ignore: unrelated_type_equality_checks
                                        text: controller.isImagePicked == false
                                            ? 'Upload Image Here'
                                            : 'Image is Picked',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        textcolor: textColor5,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      sizeH25(),
                      TextFFeild(
                          border: true,
                          hintStyle: const TextStyle(),
                          focus: false,
                          mainColor: Colors.grey,
                          labelText: "Title",
                          textInputAction: TextInputAction.next,
                          textInputType: TextInputType.text,
                          obsecureText: false,
                          borderRadius: 8,
                          controller: controller.titleController,
                          funValidate: (val) {
                            if (val != null && val.isEmpty) {
                              return "Title required";
                            }
                            return null;
                          }),
                      sizeH25(),
                      TextFFeild(
                          border: true,
                          hintStyle: const TextStyle(),
                          focus: false,
                          mainColor: Colors.grey,
                          labelText: "Price",
                          textInputAction: TextInputAction.next,
                          textInputType: TextInputType.number,
                          obsecureText: false,
                          borderRadius: 8,
                          controller: controller.priceController,
                          funValidate: (val) {
                            if (val != null && val.isEmpty) {
                              return "Price required";
                            }
                            return null;
                          }),
                      sizeH25(),
                      TextFFeild(
                          border: true,
                          hintStyle: const TextStyle(),
                          focus: false,
                          mainColor: Colors.grey,
                          labelText: "Description",
                          textInputType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                          obsecureText: false,
                          borderRadius: 8,
                          maxLines: 3,
                          length: 120,
                          controller: controller.descriptionController,
                          funValidate: (val) {
                            if (val != null && val.isEmpty) {
                              return "Description required";
                            }
                            return null;
                          }),
                      sizeH25(),
                    ],
                  )),
                  Visibility(
                    visible: visible(context),
                    child: CustomButton(
                        radius: 10,
                        onPress: validate,
                        height: 45,
                        txtcolor: white,
                        bgcolor: themeColor,
                        width: DP.infinity(context),
                        label: 'Upload Product'),
                  ),
                  sizeH(16)
                ],
              )),
        ),
      )),
    );
  }
}
