import 'dart:io';

import 'package:flutter/material.dart';
import 'package:grocery_plus/Logic/Controller/Admin/Controller.dart';
import 'package:grocery_plus/Logic/Controller/GroceryItemController.dart';
import 'package:grocery_plus/Package/Constants.dart';
import 'package:grocery_plus/Package/CustomeTexts.dart';
import 'package:grocery_plus/Package/ElevatedButton.dart';
import 'package:grocery_plus/Package/RadioButton.dart';
import 'package:grocery_plus/Package/ScrollColorRemove.dart';
import 'package:grocery_plus/Presentation/Utils/Constants.dart';
import 'package:get/get.dart';
import 'package:dotted_border/dotted_border.dart';
import '../../../Package/CustomePadding.dart';
import '../../../Package/RippleEffectContainer.dart';
import '../../../Package/TextFormFeilds.dart';
import 'package:image_picker/image_picker.dart';

class AddProductScreen extends StatelessWidget {
  AddProductScreen({super.key});
  // GroceryItemController controller = GroceryItemController();
  Controller controller = Controller();

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

          dialogSuccess(Get.context!).then((value) => Nav.pop(Get.context!));
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
                      child: SingleChildScrollView(
                    child: Column(
                      children: [
                        sizeH(15),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                          text:
                                              controller.isImagePicked == false
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
                            labelText: "Offer Price",
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
                            labelText: "Actual Price",
                            textInputAction: TextInputAction.next,
                            textInputType: TextInputType.number,
                            obsecureText: false,
                            borderRadius: 8,
                            controller: controller.actualPriceController,
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
                            textInputAction: TextInputAction.next,
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFW500(
                              text: 'Status',
                              fontSize: 18,
                              textcolor: textColor1,
                            ),
                            sizeH10(),
                            Obx(
                              () => Row(
                                children: [
                                  CustomeRadioButton(
                                      onTap: () => controller.changeStatus(),
                                      isEnabled: controller.isActive.value,
                                      title: 'Active'),
                                  CustomeRadioButton(
                                      onTap: () => controller.changeStatus(),
                                      isEnabled: controller.isDeactive.value,
                                      title: 'Deactive'),
                                ],
                              ),
                            ),
                            sizeH25(),
                            TextFW500(
                                text: 'Category',
                                fontSize: 16,
                                textcolor: textColor1),
                            sizeH10(),
                            Obx(
                              () => InputDecorator(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: radius(10),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 5),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    value: controller.categoryValue.value,
                                    icon: const Icon(Icons.keyboard_arrow_down),
                                    items:
                                        controller.category.map((String items) {
                                      return DropdownMenuItem(
                                        value: items,
                                        child: Text(items),
                                      );
                                    }).toList(),
                                    onChanged: (newValue) {
                                      controller.chnageValue(newValue!);
                                    },
                                  ),
                                ),
                              ),
                            ),
                            sizeH25(),
                            TextFW500(
                                text: 'Brand Name',
                                fontSize: 16,
                                textcolor: textColor1),
                            sizeH10(),
                            TextFFeild(
                                border: true,
                                hintStyle: const TextStyle(),
                                focus: false,
                                mainColor: Colors.grey,
                                textInputAction: TextInputAction.next,
                                textInputType: TextInputType.text,
                                obsecureText: false,
                                borderRadius: 8,
                                controller: controller.brandNameController,
                                funValidate: (val) {
                                  if (val != null && val.isEmpty) {
                                    return "Brand Name required";
                                  }
                                  return null;
                                }),
                            sizeH25(),
                            TextFW500(
                                text: 'Available Stock (in KG)',
                                fontSize: 18,
                                textcolor: textColor1),
                            sizeH10(),
                            TextFFeild(
                                border: true,
                                hintStyle: const TextStyle(),
                                focus: false,
                                mainColor: Colors.grey,
                                hintText: "Stock like 100.50",
                                textInputType: TextInputType.number,
                                textInputAction: TextInputAction.done,
                                obsecureText: false,
                                borderRadius: 8,
                                controller: controller.stockController,
                                funValidate: (val) {
                                  if (val != null && val.isEmpty) {
                                    return "Avialable Stck required";
                                  }
                                  return null;
                                }),
                          ],
                        ),
                        sizeH25(),
                        sizeH25()
                      ],
                    ),
                  )),
                  sizeH(16),
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
