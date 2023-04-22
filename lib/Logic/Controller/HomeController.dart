import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeController extends GetxController {
  final scrollController = ScrollController();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  DocumentSnapshot? lastDocument;
  bool isMoreData = true;
  bool isLoaingData = false;
  List<Map<String, dynamic>> list = [];
  @override
  void onInit() {
    paginateData();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        paginateData();
      }
    });
    super.onInit();
  }

  load() {
    list.clear();
    isMoreData = true;
    isLoaingData = false;
    lastDocument = null;
    paginateData();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        paginateData();
      }
    });
  }

  void paginateData() async {
    if (isMoreData) {
      isLoaingData = true;

      final collectionReferance = firestore.collection('groceryplus');
      late QuerySnapshot<Map<String, dynamic>> querySnapshot;
      if (lastDocument == null) {
        //First time get data
        querySnapshot = await collectionReferance.limit(10).get();
      } else {
        querySnapshot = await collectionReferance
            .limit(10)
            .startAfterDocument(lastDocument!)
            .get();
      }

      lastDocument = querySnapshot.docs.last; //get last document of list

      list.addAll(querySnapshot.docs.map((e) => e.data()));
      isLoaingData = false;

      if (querySnapshot.docs.length < 10) {
        isMoreData = false;
      }
    } else {
      print('No More data');
    }
  }
}
