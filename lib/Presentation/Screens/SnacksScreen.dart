import 'package:flutter/material.dart';
import 'package:grocery_plus/Presentation/Screens/ProductDetailScreen.dart';
import '/Package/ElevatedButton.dart';
import '/Package/ScrollColorRemove.dart';
import '/Package/Constants.dart';
import '/Package/CustomePadding.dart';
import '/Package/CustomeTexts.dart';
import '/Package/RippleEffectContainer.dart';
import '/Presentation/Utils/Constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SnacksScreen extends StatefulWidget {
  SnacksScreen({super.key});

  @override
  State<SnacksScreen> createState() => _SnacksScreenState();
}

class _SnacksScreenState extends State<SnacksScreen> {
  @override
  void initState() {
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
  // ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScrollColorRemove(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sizeH(45),
          CP(
            h: 16,
            child: Row(
              children: [
                ClickEffect(
                  onTap: () {
                    Nav.pop(context);
                  },
                  borderRadius: radius(10),
                  child: const Icon(
                    Icons.arrow_back,
                    size: 24,
                  ),
                ),
                sizeW(10),
                TextFW700(
                  text: 'Snacks',
                  fontSize: 25,
                  textcolor: textColor1,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
          ),
          Expanded(
              child: CP(
            h: 16,
            child: GridView.builder(
              itemCount: list.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.height * .81),
                  crossAxisCount: 2,
                  crossAxisSpacing: 11.0,
                  mainAxisSpacing: 11),
              itemBuilder: (context, index) {
                return ProductContainer(
                    price: '₹ ${list[index]['price']}/-',
                    addToBag: () {},
                    //! 20 charatcter limit of title
                    title: list[index]['title'],
                    img: list[index]['imgurl'],
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) =>
                                  ProductDetailScreen(list: list[index])));
                    });
              },
            ),
          )),
          isLoaingData
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : const SizedBox(),
          sizeH(16)
        ],
      )),
    );
  }
}

class ProductContainer extends StatelessWidget {
  const ProductContainer({
    super.key,
    required this.title,
    required this.img,
    required this.onTap,
    required this.price,
    required this.addToBag,
  });
  final String title;
  final String img;
  final VoidCallback onTap;
  final String price;
  final VoidCallback addToBag;

  @override
  Widget build(BuildContext context) {
    return ClickEffect(
      onTap: onTap,
      borderRadius: radius(10),
      child: Container(
        height: 520,
        width: DP.width(context, 5),
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(color: white, borderRadius: radius(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              alignment: Alignment.center,
              height: 150,
              child: img == ""
                  ? Image.network(
                      'https://t4.ftcdn.net/jpg/04/00/24/31/360_F_400243185_BOxON3h9avMUX10RsDkt3pJ8iQx72kS3.jpg')
                  : Image.network(img),
            ),
            CP(
              h: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFW500(
                    text: title,
                    fontSize: 13,
                    textcolor: textColor1,
                  ),
                  sizeH(20),
                  TextFW500(
                    text: price,
                    fontSize: 16,
                    textcolor: textColor4,
                  ),
                  sizeH10(),
                  CustomButton(
                      radius: 10,
                      bgcolor: themeColor,
                      txtcolor: white,
                      onPress: () {},
                      size: 12,
                      icon: SizedBox(
                        height: 15,
                        child: Image.asset('assets/images/cart.png'),
                      ),
                      height: 35,
                      width: 150,
                      label: 'Add To Bag'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
