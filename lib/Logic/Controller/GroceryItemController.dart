import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GroceryItemController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final priceController = TextEditingController();
  final descriptionController = TextEditingController();

  final CollectionReference reference =
      FirebaseFirestore.instance.collection('groceryplus');

  addData() async {
    await reference.add({
      'title': titleController.text,
      'price': priceController.text,
      'description': descriptionController.text,
    }).then((value) => print('Data Uploaded'));
  }

  void resetAll() {
    titleController.clear();
    priceController.clear();
    descriptionController.clear();
  }
}
