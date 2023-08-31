import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mieny/Auth/phoneAuth/chooseNumber.dart';

import '../../../Constans.dart';

class add_staf extends StatefulWidget {
  const add_staf({Key? key}) : super(key: key);

  @override
  State<add_staf> createState() => _add_stafState();
}

class _add_stafState extends State<add_staf> {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController desiginationTextEditingController =
      TextEditingController();
  TextEditingController salaryTextEditingController = TextEditingController();
  TextEditingController ContactTextEditingController = TextEditingController();
  @override
  void dispose() {
    emailTextEditingController.dispose();
    desiginationTextEditingController.dispose();
    salaryTextEditingController.dispose();
    ContactTextEditingController.dispose();
    super.dispose();
  }

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
            fontWeight: FontWeight.w700,
            color: Colors.black,
            fontFamily: "Inter",
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SizedBox(
        height: 900,
        width: 400,
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              height: 120,
              width: 400,
              child: Row(
                children: [
                  const SizedBox(
                    width: 30,
                  ),
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.grey[200]),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          child: Text(
                            'Full Name',
                            style: TextStyle(
                                fontFamily: "Inter",
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        SizedBox(
                          child: Text(
                            'Employee Number',
                            style: TextStyle(
                              fontFamily: "Inter",
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.06,
              width: double.infinity,
              margin: const EdgeInsets.only(
                left: 30,
              ),
              child: TextFormField(
                controller: emailTextEditingController,
                keyboardType: TextInputType.emailAddress,
                cursorColor: primaryColor,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                          const BorderSide(color: Colors.black12, width: 0.8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: primaryColor, width: 1),
                    ),
                    hintText: 'Email',
                    hintStyle: const TextStyle(
                        color: Colors.grey, fontSize: 12, fontFamily: "Inter")),
                style: const TextStyle(fontSize: 14.0),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.06,
              width: double.infinity,
              margin: const EdgeInsets.only(
                left: 30,
              ),
              child: TextFormField(
                controller: salaryTextEditingController,
                keyboardType: TextInputType.emailAddress,
                cursorColor: primaryColor,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                          const BorderSide(color: Colors.black12, width: 0.8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: primaryColor, width: 1),
                    ),
                    hintText: 'Salary',
                    hintStyle: const TextStyle(
                        color: Colors.grey, fontSize: 12, fontFamily: "Inter")),
                style: const TextStyle(fontSize: 14.0),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.06,
              width: double.infinity,
              margin: const EdgeInsets.only(
                left: 30,
              ),
              child: TextFormField(
                controller: ContactTextEditingController,
                keyboardType: TextInputType.emailAddress,
                cursorColor: primaryColor,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                          const BorderSide(color: Colors.black12, width: 0.8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: primaryColor, width: 1),
                    ),
                    hintText: 'Contact Number',
                    hintStyle: const TextStyle(
                        color: Colors.grey, fontSize: 12, fontFamily: "Inter")),
                style: const TextStyle(fontSize: 14.0),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.06,
              width: double.infinity,
              margin: const EdgeInsets.only(
                left: 30,
              ),
              child: TextFormField(
                controller: desiginationTextEditingController,
                keyboardType: TextInputType.emailAddress,
                cursorColor: primaryColor,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                          const BorderSide(color: Colors.black12, width: 0.8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: primaryColor, width: 1),
                    ),
                    hintText: 'Designation',
                    hintStyle: const TextStyle(
                        color: Colors.grey, fontSize: 12, fontFamily: "Inter")),
                style: const TextStyle(fontSize: 14.0),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: () {
                Get.to(() => const ChooseNumber());
              },
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.only(
                  left: 30,
                ),
                height: MediaQuery.of(context).size.height * 0.06,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: primaryColor),
                child: const SizedBox(
                  height: 50.0,
                  child: Center(
                    child: Text(
                      "Add Vehicle",
                      style: TextStyle(
                          fontSize: 18.0,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
