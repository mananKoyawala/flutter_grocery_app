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
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../Package/CustomePadding.dart';
import '../../../Package/RippleEffectContainer.dart';
import '../../../Package/TextFormFeilds.dart';
import 'package:image_picker/image_picker.dart';

class EditProduct extends StatefulWidget {
  EditProduct({super.key, required this.id});
  final String id;

  @override
  State<EditProduct> createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  // GroceryItemController controller = GroceryItemController();
  Controller controller = Controller();

  TextEditingController nameC = TextEditingController();

  validate() {
    if (controller.formKey.currentState!.validate()) {
      unfocus();
      // print("Data " +
      //     controller.title +
      //     " " +
      //     controller.price +
      //     " " +
      //     controller.description +
      //     " " +
      //     controller.stock +
      //     " " +
      //     controller.brandname +
      //     " " +
      //     controller.categoryValue.value);
      // if (controller.isImagePicked == true) {
      //   controller.imageUpload(controller.imgUrl);
      //   if (controller.image != '') {
      controller.updateProduct(widget.id);
      controller.resetAll();
      unfocus();
      //     FocusManager.instance.primaryFocus?.unfocus();

      dialogEdit(Get.context!).then((value) => Nav.pop(context));

      //   } else {
      //     ScaffoldMessenger.of(Get.context!).showSnackBar(const SnackBar(
      //         content: Text('Please Select Product Image Once again')));
      //   }
      // }
      // if (controller.isImagePicked == false) {
      //   ScaffoldMessenger.of(Get.context!).showSnackBar(
      //       const SnackBar(content: Text('Please Select Product Image')));
      // } else {
      //   controller.imageUpload(controller.imgUrl);

      //   if (controller.image != '') {
      //     controller.addData();
      //     controller.resetAll();
      //     FocusManager.instance.primaryFocus?.unfocus();

      //     dialogSuccess(Get.context!);
      //   } else {
      //     ScaffoldMessenger.of(Get.context!).showSnackBar(const SnackBar(
      //         content: Text('Please Select Product Image Once again')));
      //   }
      // }
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
          child: RawScrollbar(
            padding: const EdgeInsets.only(right: 6),
            radius: const Radius.circular(50),
            thumbColor: Colors.grey.shade400,
            child: CP(
              h: 16,
              child: SizedBox(
                height: DP.infinity(context),
                child: Form(
                  key: controller.formKey,
                  child: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                      future: FirebaseFirestore.instance
                          .collection('groceryplus')
                          .doc(widget.id)
                          .get(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          print("Error");
                        }
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        var data = snapshot.data!.data();
                        var title = data!['title'];
                        var offerprice = data['offerprice'];
                        var actualprice = data['actualprice'];
                        var description = data['description'];
                        var stock = data['stock'];
                        var brandname = data['brandname'];
                        var category = data['category'];
                        //!change category
                        controller.chnageValue(category);
                        controller.chnageTitl(title);
                        controller.chnagePrice(offerprice);
                        controller.chnageActualPrice(actualprice);
                        controller.chnageDesc(description);
                        controller.chnageStock(stock);
                        controller.chnageBrand(brandname);
                        var imgurl = data['imgurl'];
                        return Column(
                          children: [
                            Expanded(
                                child: SingleChildScrollView(
                              physics: const BouncingScrollPhysics(),
                              child: Column(
                                children: [
                                  sizeH(45),
                                  Center(
                                    child: TextFW500(
                                      text: 'Update Product Details',
                                      fontSize: 25,
                                      textcolor: textColor1,
                                    ),
                                  ),
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
                                                  controller.isImagePicked ==
                                                          false
                                                      ? Image.network(
                                                          imgurl,
                                                          height: 120,
                                                        )
                                                      : Icon(
                                                          Icons
                                                              .playlist_add_check_circle,
                                                          color: themeColor,
                                                          size: 40,
                                                        ),
                                                  sizeH(10),
                                                  TextFW500(
                                                    // ignore: unrelated_type_equality_checks
                                                    text: controller
                                                                .isImagePicked ==
                                                            false
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
                                  InitialTextFFeild(
                                      border: true,
                                      hintStyle: const TextStyle(),
                                      focus: false,
                                      mainColor: Colors.grey,
                                      labelText: "Title",
                                      textInputAction: TextInputAction.next,
                                      textInputType: TextInputType.text,
                                      obsecureText: false,
                                      borderRadius: 8,
                                      initialValue: title,
                                      onChanged: (val) {
                                        controller.chnageTitl(val);
                                      },
                                      // controller: controller.titleController,
                                      funValidate: (val) {
                                        if (val != null && val.isEmpty) {
                                          return "Title required";
                                        }
                                        return null;
                                      }),
                                  sizeH25(),
                                  InitialTextFFeild(
                                      border: true,
                                      hintStyle: const TextStyle(),
                                      focus: false,
                                      mainColor: Colors.grey,
                                      labelText: "Price",
                                      textInputAction: TextInputAction.next,
                                      textInputType: TextInputType.number,
                                      obsecureText: false,
                                      borderRadius: 8,
                                      initialValue: offerprice,
                                      onChanged: (val) {
                                        controller.chnagePrice(val);
                                      },
                                      // controller: controller.priceController,
                                      funValidate: (val) {
                                        if (val != null && val.isEmpty) {
                                          return "Price required";
                                        }
                                        return null;
                                      }),
                                  sizeH25(),
                                  InitialTextFFeild(
                                      border: true,
                                      hintStyle: const TextStyle(),
                                      focus: false,
                                      mainColor: Colors.grey,
                                      labelText: "Price",
                                      textInputAction: TextInputAction.next,
                                      textInputType: TextInputType.number,
                                      obsecureText: false,
                                      borderRadius: 8,
                                      initialValue: actualprice,
                                      onChanged: (val) {
                                        controller.chnageActualPrice(val);
                                      },
                                      // controller: controller.priceController,
                                      funValidate: (val) {
                                        if (val != null && val.isEmpty) {
                                          return "Price required";
                                        }
                                        return null;
                                      }),
                                  sizeH25(),
                                  InitialTextFFeild(
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
                                      initialValue: description,
                                      onChanged: (val) {
                                        controller.chnageDesc(val);
                                      },
                                      // controller: controller.descriptionController,
                                      funValidate: (val) {
                                        if (val != null && val.isEmpty) {
                                          return "Description required";
                                        }
                                        return null;
                                      }),
                                  sizeH25(),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
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
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 15,
                                                    vertical: 5),
                                          ),
                                          child: DropdownButtonHideUnderline(
                                            child: DropdownButton<String>(
                                              value: controller
                                                  .categoryValue.value,
                                              icon: const Icon(
                                                  Icons.keyboard_arrow_down),
                                              items: controller.category
                                                  .map((String items) {
                                                return DropdownMenuItem(
                                                  value: items,
                                                  child: Text(items),
                                                );
                                              }).toList(),
                                              onChanged: (newValue) {
                                                controller
                                                    .chnageValue(newValue!);
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
                                      InitialTextFFeild(
                                          border: true,
                                          hintStyle: const TextStyle(),
                                          focus: false,
                                          mainColor: Colors.grey,
                                          textInputAction: TextInputAction.next,
                                          textInputType: TextInputType.text,
                                          obsecureText: false,
                                          borderRadius: 8,
                                          initialValue: brandname,
                                          onChanged: (val) {
                                            controller.chnageBrand(val);
                                          },
                                          // controller: controller.brandNameController,
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
                                      InitialTextFFeild(
                                          border: true,
                                          hintStyle: const TextStyle(),
                                          focus: false,
                                          mainColor: Colors.grey,
                                          hintText: "Stock like 100.50",
                                          textInputType: TextInputType.number,
                                          textInputAction: TextInputAction.done,
                                          obsecureText: false,
                                          borderRadius: 8,
                                          initialValue: stock,
                                          onChanged: (val) {
                                            controller.chnageStock(val);
                                          },
                                          // controller: controller.stockController,
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
                        );
                      }),
                ),
              ),
            ),
          ),
        ));
  }
}
