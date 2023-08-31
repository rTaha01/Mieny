import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mieny/Auth/Login/login.dart';
import 'package:mieny/design/Profile/profileDetail/profileDetail.dart';
import 'package:mieny/design/Profile/profileDetail/vehical.dart';
import 'package:mieny/widgets/profileWidget.dart';

import '../../Constans.dart';

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
          InkWell(
            onTap: () {
              Get.to(() => const ProfileDetails());
            },
            child: const SizedBox(
                height: 45,
                child: ProfileWidget(
                    text: "Profile", Icon: (Icons.account_circle_outlined))),
          ),
          SizedBox(
            height: context.heightTransformer(dividedBy: 30),
          ),
          InkWell(
            onTap: () {
              Get.to(() => const Vehicle());
            },
            child: const SizedBox(
                height: 45,
                child: ProfileWidget(text: "Vehicles", Icon: (Icons.pedal_bike))),
          ),
          SizedBox(
            height: context.heightTransformer(dividedBy: 30),
          ),
          const SizedBox(
              height: 45,
              child:
                  ProfileWidget(text: "Version", Icon: (Icons.phone_android))),
          SizedBox(
            height: context.heightTransformer(dividedBy: 30),
          ),
          const SizedBox(
              height: 45,
              child: ProfileWidget(
                  text: "Terms of Service", Icon: (Icons.privacy_tip))),
          SizedBox(
            height: context.heightTransformer(dividedBy: 30),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 55.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Information",
                style: TextStyle(
                    fontSize: 11.0,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Inter",
                    color: Colors.grey.shade400),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(
            height: context.heightTransformer(dividedBy: 30),
          ),
          const SizedBox(
              height: 45,
              child: ProfileWidget(text: "Language", Icon: (Icons.language))),
          SizedBox(
            height: context.heightTransformer(dividedBy: 30),
          ),
          const SizedBox(
              height: 45,
              child: ProfileWidget(text: "Setting", Icon: (Icons.settings))),
          SizedBox(
            height: context.heightTransformer(dividedBy: 8),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: () {
                showAlertDialog(context);
              },
              child: const SizedBox(
                  height: 45,
                  child: ProfileWidget(text: "Logout", Icon: (Icons.logout))),
            ),
          ),
        ],
      ),
    );
  }
}

void showAlertDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (ctx) => Align(
      //alignment: Alignment.bottomCenter,
      child: Material(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: SizedBox(
          height: 170,
          width: 250,
          child: Column(
            children: [
              const SizedBox(
                height: 8,
              ),
              Icon(
                Icons.login_outlined,
                color: primaryColor,
                size: 40,
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Are You Sure That You Want\nto Logout?',
                textAlign: TextAlign.center,
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
              ),
              const Divider(
                height: 35,
                thickness: 0.5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        'Not Now',
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      )),
                  InkWell(
                      onTap: () {
                        Get.off(() => const Login());
                      },
                      child: Text(
                        'Yes',
                        style: TextStyle(color: primaryColor, fontSize: 15),
                      )),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ),
  );
}
