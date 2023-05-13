import 'package:flutter/material.dart';
import 'package:grocery_plus/Logic/Controller/Authentication.dart';
import 'package:grocery_plus/Package/Constants.dart';
import 'package:grocery_plus/Package/CustomeTexts.dart';
import 'package:grocery_plus/Package/RippleEffectContainer.dart';
import 'package:grocery_plus/Presentation/Utils/Constants.dart';

import '../../Package/CustomePadding.dart';
import '../../Package/TextFormFeilds.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeColor3,
      body: Column(
        // mainAxisAlignment: ,
        children: [
          sizeH(45),
          Expanded(
            child: Center(
              child: CP(
                h: 16,
                child: ListView(
                  children: [
                    TextFFeild(
                        border: true,
                        hintStyle: const TextStyle(),
                        focus: false,
                        mainColor: black,
                        hintText: 'Email',
                        prifixIcon: Container(
                          padding: const EdgeInsets.all(15),
                          height: 40,
                          child: Image.asset(
                            'assets/images/brand.png',
                            height: 10,
                          ),
                        ),
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.text,
                        obsecureText: false,
                        borderRadius: 8,
                        funValidate: (val) {
                          if (val != null && val.isEmpty) {
                            return "Title required";
                          }
                          return null;
                        }),
                    sizeH25(),
                    TextFFeild(
                        border: true,
                        hintStyle: const TextStyle(),
                        focus: false,
                        mainColor: black,
                        hintText: 'Password',
                        prifixIcon: Container(
                          padding: const EdgeInsets.all(15),
                          height: 40,
                          child: Image.asset(
                            'assets/images/brand.png',
                            height: 10,
                          ),
                        ),
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.text,
                        obsecureText: false,
                        borderRadius: 8,
                        funValidate: (val) {
                          if (val != null && val.isEmpty) {
                            return "Title required";
                          }
                          return null;
                        }),
                  ],
                ),
              ),
            ),
          ),
          sizeH25(),
          CP(
            h: 16,
            child: Column(
              children: [
                LoginButton(
                  img: 'assets/images/google.png',
                  height: 20,
                  title: 'Sign with Google',
                  onTap: () {
                    Authentication().signInWithGoogle();
                  },
                ),
                sizeH10(),
                LoginButton(
                  img: 'assets/images/apple.png',
                  height: 23,
                  title: 'Sign with Apple',
                  onTap: () {},
                ),
                sizeH10(),
                LoginButton(
                  img: 'assets/images/facebook.png',
                  height: 23,
                  title: 'Sign with Facebook',
                  onTap: () {},
                ),
                sizeH10(),
                LoginButton(
                  img: 'assets/images/twitter.png',
                  height: 20,
                  title: 'Sign with Twitter',
                  onTap: () {},
                ),
              ],
            ),
          ),
          SizedBox(
            height: DP.dHeight(context, 7),
          )
        ],
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.img,
    required this.height,
    required this.title,
    required this.onTap,
  });
  final String img;
  final double height;
  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return ClickEffect(
      onTap: onTap,
      borderRadius: radius(10),
      child: Container(
        height: 48,
        width: DP.infinity(context),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: white,
          borderRadius: radius(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              img,
              height: height,
            ),
            sizeW25(),
            TextFW500(
              text: title,
              fontSize: 16,
              textcolor: textColor1,
            )
          ],
        ),
      ),
    );
  }
}
//https://fluttergroceryapp-16d41.firebaseapp.com/__/auth/handler