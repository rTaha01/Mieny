import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:mieny/Constans.dart';

import '../../Auth/Login/login.dart';

class AuthStarter extends StatefulWidget {
  const AuthStarter({super.key});

  @override
  State<AuthStarter> createState() => _AuthStarterState();
}

class _AuthStarterState extends State<AuthStarter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: context.heightTransformer(dividedBy: 5),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Image.asset("assets/Images/login_card.png"),
          ),
          SizedBox(
            height: context.heightTransformer(dividedBy: 4),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(left: 30, right: 30),
            height: MediaQuery.of(context).size.height * 0.06,
            child: MaterialButton(
              color: primaryColor,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              onPressed: () {
                Get.to(() => const Login(),transition: Transition.fade);
              },
              child: const SizedBox(
                height: 50.0,
                child: Center(
                  child: Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: context.heightTransformer(dividedBy: 45),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(left: 30, right: 30),
            height: MediaQuery.of(context).size.height * 0.06,
            decoration: BoxDecoration(
              border: Border.all(color: primaryColor, width: 0.5),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: MaterialButton(
              textColor: primaryColor,
              onPressed: () {},
              child: SizedBox(
                height: 50.0,
                child: Center(
                  child: Text(
                    "Register Now",
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        color: primaryColor),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
