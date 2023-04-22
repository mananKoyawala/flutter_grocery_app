import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../Package/CustomePadding.dart';

class HomeScreen2 extends StatefulWidget {
  const HomeScreen2({super.key});

  @override
  State<HomeScreen2> createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    paginateData();
    controller.addListener(() {
      if (controller.position.pixels == controller.position.maxScrollExtent) {
        paginateData();
      }
    });
  }

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  DocumentSnapshot? lastDocument;
  bool isMoreData = true;
  bool isLoaingData = false;
  List<Map<String, dynamic>> list = [];
  final ScrollController controller = ScrollController();
  void paginateData() async {
    if (isMoreData) {
      setState(() {
        isLoaingData = true;
      });
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
      setState(() {});
      if (querySnapshot.docs.length < 10) {
        isMoreData = false;
      }
    } else {
      print('No More data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              controller: controller,
              itemCount: list.length,
              itemBuilder: (context, index) {
                return CP(v: 50, h: 16, child: Text(list[index]['id']));
              },
            )),
            isLoaingData
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : SizedBox()
          ],
        ),
      ),
    );
  }
}
