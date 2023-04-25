import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:grocery_plus/Presentation/Screens/AddGroceryScreen.dart';
import 'Presentation/Screens/HomeScreen2.dart';
import 'Presentation/Screens/WishListDetailScreen.dart';
import 'Presentation/Utils/Constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // useInheritedMediaQuery: true,
      theme: ThemeData(
        fontFamily: 'poppinsSemi',
        appBarTheme: AppBarTheme(iconTheme: IconThemeData(color: black)),
      ),
      debugShowCheckedModeBanner: false,
      home: AddGroceryScreen(),
    );
  }
}
