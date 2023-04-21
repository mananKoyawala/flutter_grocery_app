import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddData extends StatelessWidget {
  AddData({super.key, required this.referance});
  upload() async {
    await referance.add(
        {"title": title.text, "description": desc.text, "price": price.text});
  }

  final CollectionReference referance;
  final title = TextEditingController();
  final price = TextEditingController();
  final desc = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Data'),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: title,
          ),
          TextFormField(
            controller: price,
          ),
          TextFormField(
            controller: desc,
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
