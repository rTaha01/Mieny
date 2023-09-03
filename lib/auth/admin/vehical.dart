import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mieny/Constans.dart';

import '../../../widgets/newVehicle.dart';
import '../../widgets/userNewVehicle.dart';
import 'add_staf.dart';

class NewVehicle extends StatefulWidget {
  const NewVehicle({Key? key}) : super(key: key);

  @override
  State<NewVehicle> createState() => _NewVehicleState();
}

class _NewVehicleState extends State<NewVehicle> {
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
          'Add Vehicle',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontFamily: "Inter",
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: (){
              Get.to(()=> add_staf());
            },
            child: SizedBox(
                height: 150,
                child: UserNewVehicle(
                  Image: "assets/Icons/icon_car.png",
                  Car: "Cars",
                  Number: '50',
                )),
          ),
          InkWell(
            onTap: (){
              Get.to(()=> add_staf());
            },
            child: SizedBox(
                height: 150,
                child: UserNewVehicle(
                  Image: "assets/Icons/icon_bike.png",
                  Car: "Bike",
                  Number: '20',
                )),
          ),
          InkWell(
            onTap: (){
              Get.to(()=> add_staf());
            },
            child: SizedBox(
                height: 150,
                child: UserNewVehicle(
                  Image: "assets/Icons/icon_ship.png",
                  Car: "Ships",
                  Number: '5',
                )),
          ),
        ],
      ),
    );
  }
}
