
import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:danozone/classes/main_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'auth/login_screen.dart';
import 'classes/colors.dart';
import 'classes/fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);
  static const routeName = '/splash';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  static SystemUiOverlayStyle overlayStyle = const SystemUiOverlayStyle(
      systemNavigationBarColor: AppColor.colorApp,
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarColor: AppColor.colorApp,
      statusBarBrightness: Brightness.dark);

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SystemChrome.setSystemUIOverlayStyle(overlayStyle);
    });
    Timer(const Duration(seconds: 7), () async{
      // authStore.onboarded ? navigateReplace(context, LoginScreen()):
      // navigateReplace(context, const Onboard());
      Navigator.pushNamed(context, LoginScreen.routeName);

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.colorApp,
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Center(child: Image.asset('assets/images/app_logo2.png', )),
          MainClass.bH(20),
          AnimatedTextKit(
            animatedTexts: [
              WavyAnimatedText(
                'Danozone Digital',
                textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    fontFamily: AppFonts.manrope
                ),
              ),
            ],
            isRepeatingAnimation: false,
          ),
      ],) ,
    );
  }
}
