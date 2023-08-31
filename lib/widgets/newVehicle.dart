import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../design/Profile/profileDetail/add_staf.dart';

class NewVehicle extends StatefulWidget {
  String Image;
  String Car;
  String Number;
  NewVehicle(
      {super.key,
      required this.Image,
      required this.Car,
      required this.Number});

  @override
  State<NewVehicle> createState() => _NewVehicleState();
}

class _NewVehicleState extends State<NewVehicle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              Get.to(() => const add_staf());
            },
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 100,
                width: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey.shade200,
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Image.asset(
                              widget.Image,
                              height: 100,
                            )),
                      ),
                      Text(
                        widget.Car,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 19,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        width: 100,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            widget.Number,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
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
