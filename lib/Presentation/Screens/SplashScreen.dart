import 'package:flutter/material.dart';
import 'package:grocery_plus/Package/CustomeTexts.dart';
import 'package:grocery_plus/Presentation/Screens/HomeScreen2.dart';
import 'package:grocery_plus/Presentation/Screens/PhoneVerificationScreen1.dart';
import 'package:grocery_plus/Presentation/Utils/Constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../Package/Constants.dart';
import 'MainScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    watch();
  }

  watch() async {
    await Future.delayed(const Duration(milliseconds: 3500));
    moveToNext();
  }

  moveToNext() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => PhoneVerificationScreen1()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: DP.infinity(context),
        width: DP.infinity(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/images/grocery_plus.svg',
                height: DP.dHeight(context, 5)),
            sizeH25(),
            TextFW500(text: 'Grocery Plus', fontSize: 25, textcolor: textColor1)
          ],
        ),
      ),
    );
  }
}
