import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mieny/OnBoarding/onBoarding.dart';
import 'Constans.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 2),
            () => Get.off(() => const BoardingScreen(),
            duration:
            const Duration(seconds: 1),
            transition: Transition.fade));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Image.asset("assets/Icons/Mieny Logo.png"),
      ),
    );
  }
}
