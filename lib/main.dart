import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grocery_plus/Presentation/Screens/AddData.dart';
import 'package:grocery_plus/Presentation/Screens/BottomSheet.dart';
import 'package:grocery_plus/Presentation/Screens/HomeScreen2.dart';
import 'package:grocery_plus/Presentation/Screens/SplashScreen.dart';

import 'Presentation/Screens/HomeScreen.dart';
import 'Presentation/Screens/ListScreen.dart';
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
        appBarTheme: AppBarTheme(iconTheme: IconThemeData(color: black)),
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
