import 'package:flutter/material.dart';
import 'package:grocery_plus/Logic/Controller/Admin/Controller.dart';
import 'package:grocery_plus/Package/CustomeTexts.dart';
import 'package:grocery_plus/Presentation/Screens/Admin/AddProduct.dart';
import 'package:get/get.dart';
import 'package:grocery_plus/Presentation/Screens/Admin/EditProduct.dart';
import 'package:grocery_plus/Presentation/Screens/Admin/ProductDetails.dart';
import '../../../Package/Constants.dart';
import '../../../Package/CustomePadding.dart';
import '../../../Package/ScrollColorRemove.dart';
import '../../Utils/Constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdminListProducts extends StatelessWidget {
  Controller controller = Controller();

  final CollectionReference _reference =
      FirebaseFirestore.instance.collection('groceryplus');
  final fromKeyEdit = GlobalKey<FormState>();

  Future<void> delete(String id) async {
    await _reference.doc(id).delete();
  }

  Future<void> update(String id, bool status) async {
    var statu = status ? false : true;
    await _reference.doc(id).update({'status': statu});
  }

  push(BuildContext context, id) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => EditProduct(
                  id: id,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: white,
          title: TextFW500(
            text: 'Admin Panel',
            fontSize: 20,
            textcolor: textColor1,
          ),
          centerTitle: true,
          actions: [
            PopupMenuButton<int>(
              onSelected: (val) {
                if (val == 1) {
                  Nav.pushMaterial(context, AddProductScreen());
                }
              },
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 1,
                  child: TextFW500(
                    text: 'Add Product',
                    fontSize: 16,
                    textcolor: textColor1,
                  ),
                ),
              ],
            ),
          ]),
      body: ScrollColorRemove(
        child: StreamBuilder(
          stream: _reference.snapshots(),
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              if (snapshot.data!.docs.isEmpty) {
                return Center(
                  child: FittedBox(
                    child: TextFW400(
                      text: 'No Products are Available to Shown',
                      fontSize: 18,
                      textcolor: textColor1,
                    ),
                  ),
                );
              }
            }
            if (snapshot.hasData) {
              return CP(
                  h: 16,
                  child: ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        final DocumentSnapshot list =
                            snapshot.data!.docs[index];

                        return ProductListItem(
                          controller: controller,
                          onDetail: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) =>
                                        ProductDetails(list: list)));
                          },
                          onEdit: () async {
                            controller.chnageTitle(list['title']);
                            await Future.delayed(
                                const Duration(milliseconds: 1500));
                            push(context, list.id);
                          },
                          onDelete: () => delete(list.id),
                          // onDelete: () {},
                          onStatusChange: () => update(list.id, list['status']),
                          price: list['offerprice'],
                          title: list['title'],
                          imgurl: list['imgurl'], status: list['status'],
                        );
                      }));
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}

class ProductListItem extends StatelessWidget {
  const ProductListItem({
    super.key,
    required this.controller,
    required this.onDetail,
    required this.onEdit,
    required this.onDelete,
    required this.price,
    required this.title,
    required this.imgurl,
    required this.onStatusChange,
    required this.status,
  });

  final Controller controller;
  final VoidCallback onDetail;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final VoidCallback onStatusChange;
  final String price;
  final String title;
  final String imgurl;
  final bool status;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
          borderRadius: radius(10),
          border: Border.all(color: textColor1, width: 1)),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                alignment: Alignment.center,
                height: 100,
                width: 100,
                child: Image.network(
                  imgurl,
                  height: 100,
                )),
            sizeW(10),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFW500(text: title, fontSize: 16, textcolor: textColor1),
                sizeH10(),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextFW500(
                        text: '৳$price',
                        fontSize: 20,
                        textcolor: textColor4,
                        fontWeight: FontWeight.w400,
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.blue,
                            child: IconButton(
                                onPressed: onEdit,
                                icon: Icon(
                                  Icons.edit,
                                  color: white,
                                )),
                          ),
                          sizeW10(),
                          CircleAvatar(
                            backgroundColor: red,
                            child: IconButton(
                                onPressed: onDelete,
                                icon: Icon(
                                  Icons.delete,
                                  color: white,
                                )),
                          ),
                          sizeW10()
                        ],
                      ),
                    ]),
                // sizeH(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        TextFW400(
                          text: 'Status',
                          fontSize: 16,
                          textcolor: textColor1,
                          fontFamily: 'poppins',
                        ),
                        sizeW(5),
                        IconButton(
                            onPressed: onStatusChange,
                            icon: status
                                ? const Icon(
                                    Icons.visibility,
                                    color: Colors.green,
                                  )
                                : const Icon(
                                    Icons.visibility_off,
                                    color: Colors.red,
                                  )),
                      ],
                    ),
                    Row(
                      children: [
                        TextFW400(
                          text: 'Details',
                          fontSize: 16,
                          textcolor: textColor1,
                          fontFamily: 'poppins',
                        ),
                        IconButton(
                            onPressed: onDetail,
                            icon: Icon(
                              Icons.arrow_forward,
                              color: black,
                            ))
                      ],
                    )
                  ],
                )
              ],
            )),
          ]),
    );
  }
}
