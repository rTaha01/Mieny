import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mieny/Constans.dart';
import 'package:mieny/OnBoarding/starterPages/signUp/authStarter.dart';

class ChooseApp extends StatefulWidget {
  const ChooseApp({super.key});

  @override
  State<ChooseApp> createState() => _ChooseAppState();
}

class _ChooseAppState extends State<ChooseApp> {
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
            child: Image.asset("assets/Images/option.png"),
          ),
          SizedBox(
            height: context.heightTransformer(dividedBy: 5),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text("Choose Your Account",
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 28,
                      color: const Color(0xff0D0D0D),
                      fontFamily: "Inter")),
            ),
          ),
          SizedBox(
            height: context.heightTransformer(dividedBy: 25),
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
              onPressed: () {},
              child: const SizedBox(
                height: 50.0,
                child: Center(
                  child: Text(
                    "Public Boat",
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
              onPressed: () {
                Get.to(()=> AuthStarter(),transition: Transition.fade);
              },
              child: SizedBox(
                height: 50.0,
                child: Center(
                  child: Text(
                    "Private Boat",
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
