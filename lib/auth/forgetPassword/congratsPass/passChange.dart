
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mieny/Constans.dart';

import '../../Login/login.dart';

class VerifySuccess extends StatefulWidget {
  const VerifySuccess({Key? key}) : super(key: key);

  @override
  State<VerifySuccess> createState() => _VerifySuccessState();
}

class _VerifySuccessState extends State<VerifySuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
           SizedBox(
            height: context.heightTransformer(dividedBy: 5),
          ),
           Center(
            child: Image.asset(
              "assets/Images/check.gif",
              width: 380,
              height: 250,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
           const Text(
            "Congrats!",
            style: TextStyle(
                fontWeight: FontWeight.w900, fontSize: 35, color: Colors.black),
          ),
          const SizedBox(
            height: 15,
          ),
           const Text(
            "Password reset\n Successfully",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w800, fontSize: 15, color: Colors.black,),
          ),
          const SizedBox(
            height: 40,
          ),
          SizedBox(
            width: 130,
            height: 40,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () {
                  Get.to(()=> const Login(),transition: Transition.fade);

                },
                child: const Center(
                  child: Text(
                    "Continue",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.white),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}