import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mieny/Constans.dart';

class ProfileDetails extends StatefulWidget {
  const ProfileDetails({super.key});

  @override
  State<ProfileDetails> createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 20,
              color: primaryColor,
            )),
        title: const Text(
          "Profile",
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w700,
              fontFamily: "Inter",
              color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 50.0, top: 30),
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey.shade200),
                  child: Center(
                    child: Icon(
                      Icons.account_circle_outlined,
                      color: Colors.grey.shade300,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 25,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  const Text("Jhon",
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700,
                          fontFamily: "Inter",
                          color: Colors.black)),
                  const SizedBox(
                    height: 3,
                  ),
                  const Text("Jhon1212@gmail.com",
                      style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Inter",
                          color: Colors.black)),
                  const SizedBox(
                    height: 3,
                  ),
                  const Text("Member No. 1239475605",
                      style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Inter",
                          color: Colors.black)),
                  const SizedBox(
                    height: 3,
                  ),
                  Text("Edit Profile",
                      style: TextStyle(
                          fontSize: 11.0,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Inter",
                          color: Colors.grey.shade400)),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 30.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Profile Details",
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Inter",
                    color: Colors.black),
              ),
            ),
          )
        ],
      ),
    );
  }
}
