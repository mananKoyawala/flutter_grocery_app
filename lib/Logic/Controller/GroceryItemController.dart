import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class GroceryItemController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final priceController = TextEditingController();
  final descriptionController = TextEditingController();
  String image = '';
  var isImagePicked = false.obs;
  var imgUrl;

  Reference ref = FirebaseStorage.instance.ref().child('profilePicture.png');

  final CollectionReference reference =
      FirebaseFirestore.instance.collection('groceryplus');

  addData() async {
    await reference.add({
      'title': titleController.text,
      'price': priceController.text,
      'description': descriptionController.text,
      'imgurl': image,
      'time': DateTime.now(),
    }).then((value) => print('Data Uploaded'));
  }

  void resetAll() {
    titleController.clear();
    priceController.clear();
    descriptionController.clear();
    image = '';
    isImagePicked.value = false;
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
    ref.getDownloadURL().then((value) {
      print('uppload Success');
      image = value;

      print('Url' + image);
    });
  }
}
