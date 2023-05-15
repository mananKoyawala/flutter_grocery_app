import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Controller extends GetxController {
  var isActive = true.obs; //For add
  var isDeactive = false.obs; //For add

  var category = [
    'Breakfast',
    'Snacks',
    'Dairy',
    'Beverages',
    'Fruits',
    'Vegitables',
    'Meat&Fish'
  ];

  var categoryValue = 'Breakfast'.obs;
  var isStatusActive = true.obs;

  //Firebase
  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final priceController = TextEditingController();
  final actualPriceController = TextEditingController();
  final descriptionController = TextEditingController();
  final brandNameController = TextEditingController();
  final stockController = TextEditingController();
  String image = '';
  var isImagePicked = false.obs;
  var imgUrl;

  //* For data update
  String title = '';
  String price = '';
  String actualprice = '';
  String description = '';
  String stock = '';
  String brandname = '';

  chnageTitl(String val) {
    title = val;
  }

  chnagePrice(String val) {
    price = val;
  }

  chnageActualPrice(String val) {
    actualprice = val;
  }

  chnageDesc(String val) {
    description = val;
  }

  chnageStock(String val) {
    stock = val;
  }

  chnageBrand(String val) {
    brandname = val;
  }

  Reference ref = FirebaseStorage.instance.ref().child('profilePicture.png');

  final CollectionReference reference =
      FirebaseFirestore.instance.collection('groceryplus');
  changeStatus() {
    isActive.toggle();
    isDeactive.toggle();
  }

  resetStatus() {
    isActive.value = true;
    isDeactive.value = false;
  }

  changestatus() {
    isStatusActive.toggle();
  }

  chnageValue(String value) {
    categoryValue.value = value;
  }

  //Main firebase add data Fn
  addData() async {
    await reference.add({
      'title': titleController.text,
      'offerprice': priceController.text,
      'actualprice': actualPriceController.text,
      'description': descriptionController.text,
      'imgurl': image,
      'time': DateTime.now(),
      'category': categoryValue.value,
      'status': isActive.value ? true : false,
      'brandname': brandNameController.text,
      'stock': stockController.text
    }).then((value) => print('Data Uploaded'));
  }

  void resetAll() {
    titleController.clear();
    priceController.clear();
    actualPriceController.clear();
    descriptionController.clear();
    brandNameController.clear();
    stockController.clear();
    image = '';
    isImagePicked.value = false;
    resetStatus();
    categoryValue.value = 'Breakfast';
  }

  void changeBool() {
    isImagePicked.value = true;
  }

  changeUrl(String value) {
    image = value;
  }

  imageUpload(var imgUrl) async {
    Reference ref = FirebaseStorage.instance
        .ref()
        .child('grocery_product/')
        .child(imgUrl!.name);
    //! Here if we upload product image than we have to upload original name of image file
    //! But when we have to upload image for profile than we have to ref().child() is static name like username+email+gender
    await ref.putFile(File(imgUrl.path));
    await Future.delayed(
      const Duration(milliseconds: 1700),
    );
    ref.getDownloadURL().then((value) {
      print('uppload Success');
      image = value;

      print('Url' + image);
    });
  }

  chnageTitle(String title) {
    titleController.text = title;
  }

  Future<void> updateProduct(String id) async {
    // if (image.isNotEmpty) {
    //   updateImage();
    // }
    return reference.doc(id).update({
      'title': title,
      'offerprice': price,
      'priceactual': actualprice,
      'description': description,
      // 'imgurl': image,
      'time': DateTime.now(),
      'category': categoryValue.value,
      'brandname': brandname,
      'stock': stock
    }).then((value) => print('Data Updated Successfully'));
  }

  updateImage() {}
}
