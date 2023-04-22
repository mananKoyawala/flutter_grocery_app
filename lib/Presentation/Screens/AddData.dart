import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grocery_plus/Logic/Controller/FormController.dart';

class AddData extends StatelessWidget {
  AddData({super.key, required this.referance});

  FormController controller = FormController();
  upload() async {
    await referance.add({
      "title": controller.title.text,
      "description": controller.desc.text,
      "price": controller.price.text
    });
  }

  final CollectionReference referance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Data'),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: controller.title,
          ),
          TextFormField(
            controller: controller.price,
          ),
          TextFormField(
            controller: controller.desc,
          ),
          ElevatedButton(
              onPressed: () {
                upload();
              },
              child: Text('Upload'))
        ],
      ),
    );
  }
}
