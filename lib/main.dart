import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:grocery_plus/Presentation/Screens/HomeScreen.dart';
import 'package:grocery_plus/Presentation/Screens/ListScreen.dart';
import 'package:grocery_plus/Presentation/Screens/SplashScreen.dart';
import 'Presentation/Routes/AppRoutes.dart';
import 'Presentation/Screens/Admin/AdminListProducts.dart';
import 'Presentation/Screens/PhoneVerificationScreen1.dart';
import 'Presentation/Utils/Constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  AppRoute _appRoute = AppRoute();
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // ),
      theme: ThemeData(
        fontFamily: 'poppinsSemi',
        appBarTheme: AppBarTheme(iconTheme: IconThemeData(color: black)),
      ),
      onGenerateRoute: _appRoute.onGenerateRoute,
      debugShowCheckedModeBanner: false,
      // home: Authentication().handleAuthState(),
      home: SplashScreen(),
    );
  }
}
