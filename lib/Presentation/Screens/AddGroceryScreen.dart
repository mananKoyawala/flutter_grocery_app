import 'package:flutter/material.dart';
import 'package:grocery_plus/Logic/Controller/GroceryItemController.dart';
import 'package:grocery_plus/Package/Constants.dart';
import 'package:grocery_plus/Package/CustomeTexts.dart';
import 'package:grocery_plus/Package/ElevatedButton.dart';
import 'package:grocery_plus/Package/ScrollColorRemove.dart';
import 'package:grocery_plus/Presentation/Utils/Constants.dart';

import '../../Package/CustomePadding.dart';
import '../../Package/TextFormFeilds.dart';

class AddGroceryScreen extends StatelessWidget {
  AddGroceryScreen({super.key});
  GroceryItemController controller = GroceryItemController();

  validate() {
    if (controller.formKey.currentState!.validate()) {
      print('Validate');
      controller.addData();
      controller.resetAll();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScrollColorRemove(
          child: CP(
        h: 16,
        child: SizedBox(
          height: DP.infinity(context),
          child: Form(
              key: controller.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFW500(
                    textAlign: TextAlign.center,
                    text: 'Add Grocery Product',
                    fontSize: 35,
                    textcolor: textColor1,
                  ),
                  sizeH25(),
                  sizeH25(),
                  sizeH25(),
                  TextFFeild(
                      border: true,
                      hintStyle: TextStyle(),
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
                      hintStyle: TextStyle(),
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
                      hintStyle: TextStyle(),
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
                  CustomButton(
                      radius: 10,
                      onPress: validate,
                      height: 45,
                      txtcolor: white,
                      bgcolor: themeColor,
                      width: DP.infinity(context),
                      label: 'Upload Product')
                ],
              )),
        ),
      )),
    );
  }
}
