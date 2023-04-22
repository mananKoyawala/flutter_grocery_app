import 'package:flutter/material.dart';
import 'package:grocery_plus/Logic/Controller/HomeController.dart';
import 'package:grocery_plus/Package/CustomeTexts.dart';
import 'package:grocery_plus/Presentation/Screens/AddGroceryScreen.dart';
import 'package:grocery_plus/Presentation/Utils/Constants.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../Package/CustomePadding.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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

  Future<void> loadOnceAgain() async {
    setState(() {
      lastDocument = null;
      isMoreData = true;
      isLoaingData = false;
      list.clear();
    });
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
      backgroundColor: white,
      appBar: AppBar(
        title: const TextFW500(text: 'Home Screen', fontSize: 20),
        centerTitle: true,
        backgroundColor: white,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => AddGroceryScreen()));
            },
            icon: const Icon(Icons.add),
            padding: const EdgeInsets.symmetric(horizontal: 10),
          )
        ],
      ),
      body: list.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: loadOnceAgain,
                    child: ListView.builder(
                      controller: controller,
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        return CP(
                          h: 16,
                          v: 16,
                          child: ListTile(
                            title: Text(list[index]['title']),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                isLoaingData
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : SizedBox()
              ],
            ),
    );
  }
}
