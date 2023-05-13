import 'package:flutter/material.dart';
import 'package:grocery_plus/Presentation/Screens/HomeScreen2.dart';
import 'package:grocery_plus/Presentation/Screens/ListScreen.dart';
import 'package:grocery_plus/Presentation/Screens/MainScreen.dart';
import 'package:grocery_plus/Presentation/Screens/PhoneVerificationScreen2.dart';
import 'package:grocery_plus/Presentation/Screens/ProductDetailScreen.dart';
import 'package:grocery_plus/Presentation/Screens/SnacksScreen.dart';
import 'package:grocery_plus/Presentation/Screens/SplashScreen.dart';

import '../Screens/PhoneVerificationScreen1.dart';

class AppRoute {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case "/category":
        return MaterialPageRoute(builder: (_) => MainScreen());
      case "/snacks":
        return MaterialPageRoute(builder: (_) => SnacksScreen());

      default:
        return null;
    }
  }
}
