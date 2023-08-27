import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

import '../../widgets/notifacationWidget.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: const Text(
          "Notifications",
          style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.w700,
              fontFamily: "Inter",
              color: Colors.black),
          textAlign: TextAlign.center,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: context.heightTransformer(dividedBy: 45),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 25),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Today",
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w900,
                      color: Colors.black),
                ),
              ),
            ),
            const SizedBox(
              height: 100,

              child: Notication(
                Image: "assets/Icons/alert.png",
                name: 'A2075 Car has arrived to male ',
                time: 'Now',
              ),
            ),
            const SizedBox(
              height: 100,
              child: Notication(
                Image: "assets/Icons/car_alert.png",
                name: 'CA-03 Car stopped - (Fuvahmulah/ 5 min)',
                time: '5 min',
              ),
            ),
            SizedBox(
              height: context.heightTransformer(dividedBy: 20),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 25),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Yesterday",
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w900,
                      color: Colors.black),
                ),
              ),
            ),
            const SizedBox(
              height: 100,

              child: Notication(
                Image: "assets/Icons/alert.png",
                name: 'CA-03 Car continuing trip',
                time: '20 May',
              ),
            ),
            const SizedBox(
              height: 100,

              child: Notication(
                Image: "assets/Icons/cart.png",
                name: 'Trip Started',
                time: '20 May',
              ),
            ),
            const SizedBox(
              height: 100,

              child: Notication(
                Image: "assets/Icons/profile_alert.png",
                name: 'You have Jhon  assigned as a crew to Alma boat',
                time: '20 May',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
