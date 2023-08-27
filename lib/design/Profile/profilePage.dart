import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mieny/Auth/Login/login.dart';
import 'package:mieny/widgets/profileWidget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: const Text(
          "Settings",
          style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.w700,
              fontFamily: "Inter",
              color: Colors.black),
          textAlign: TextAlign.center,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: context.heightTransformer(dividedBy: 10),
          ),
          const SizedBox(
              height: 45,
              child: ProfileWidget(text: "Profile", Icon: (Icons.account_circle_outlined))),
          SizedBox(
            height: context.heightTransformer(dividedBy: 30),
          ),
          const SizedBox(
              height: 45,
              child: ProfileWidget(text: "Vehicles", Icon: (Icons.pedal_bike))),
          SizedBox(
            height: context.heightTransformer(dividedBy: 30),
          ),
          const SizedBox(
              height: 45,
              child: ProfileWidget(text: "Version", Icon: (Icons.phone_android))),
          SizedBox(
            height: context.heightTransformer(dividedBy: 30),
          ),
          const SizedBox(
              height: 45,
              child: ProfileWidget(text: "Terms of Service", Icon: (Icons.privacy_tip))),
          SizedBox(
            height: context.heightTransformer(dividedBy: 30),
          ),
          GestureDetector(
            onTap: (){
              Get.off(() => const Login());
            },
            child: const SizedBox(
                height: 45,
                child: ProfileWidget(text: "Logout", Icon: (Icons.logout))),
          ),
        ],
      ),
    );
  }
}
