import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mieny/Constans.dart';

import '../../../widgets/newVehicle.dart';
import 'add_staf.dart';

class Vehicle extends StatefulWidget {
  const Vehicle({Key? key}) : super(key: key);

  @override
  State<Vehicle> createState() => _VehicleState();
}

class _VehicleState extends State<Vehicle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.keyboard_arrow_left,
              color: primaryColor,
              size: 30,
            )),
        title: const Text(
          'Vehicle',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontFamily: "Inter",
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              height: 150,
              child: NewVehicle(
                Image: "assets/Icons/icon_car.png",
                Car: "Cars",
                Number: '50',
              )),
          SizedBox(
              height: 150,
              child: NewVehicle(
                Image: "assets/Icons/icon_bike.png",
                Car: "Bike",
                Number: '20',
              )),
          SizedBox(
              height: 150,
              child: NewVehicle(
                Image: "assets/Icons/icon_ship.png",
                Car: "Ships",
                Number: '5',
              )),
        ],
      ),
    );
  }
}
