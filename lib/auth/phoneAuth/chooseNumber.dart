import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mieny/Design/mainMap.dart';
import 'package:mieny/auth/phoneAuth/phoneInput/phoneCode.dart';

import '../../Constans.dart';

class ChooseNumber extends StatefulWidget {
  const ChooseNumber({super.key});

  @override
  State<ChooseNumber> createState() => _ChooseNumberState();
}

class _ChooseNumberState extends State<ChooseNumber> {
  TextEditingController phone = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? validatePhoneNumber(String? phoneNumber) {
    if (phoneNumber == null || phoneNumber.isEmpty) {
      Get.snackbar("oops", "Phone number is required");
    } else if (!RegExp(
      r'^(?:\+?)(?:[0-9]\s?){6,14}[0-9]$',
    ).hasMatch(phoneNumber)) {
      Get.snackbar("oops", "Invalid phone number format");
    } else {
      Get.to(() => phonePIN(numer: phone.text));
    }
    return null;
  }

  void _submitForm() {
    if (formKey.currentState!.validate()) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: context.heightTransformer(dividedBy: 4),
              ),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  "Register",
                  style: TextStyle(
                      fontSize: 35,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w900,
                      color: Colors.black),
                ),
              ),
              SizedBox(
                height: context.heightTransformer(dividedBy: 18),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 26.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Enter your Number',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Inter",
                        fontSize: 14,
                        fontWeight: FontWeight.w900),
                  ),
                ),
              ),
              SizedBox(
                height: context.heightTransformer(dividedBy: 30),
              ),
              SizedBox(
                height: 170,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0, right: 30),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: phone,
                        cursorColor: primaryColor,
                        validator: validatePhoneNumber,
                        maxLines: 1,
                        onSaved: (value) {},
                        minLines: 1,
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: CountryCodePicker(
                            showFlagMain: true,
                            onChanged: (value) {
                              if (kDebugMode) {
                                print(value);
                              }
                            },
                            initialSelection: '+1',
                            textStyle: const TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                            favorite: const ['+44', 'UK'],
                            showFlag: true,
                            alignLeft: false,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 1, vertical: 1),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: const BorderSide(
                                color: Colors.grey, width: 0.8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide(color: primaryColor),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(left: 25, right: 25),
                      height: 60,
                      child: MaterialButton(
                        color: primaryColor,
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        onPressed: () {
                          _submitForm();
                        },
                        child: const SizedBox(
                          height: 50.0,
                          child: Center(
                            child: Text(
                              "Next",
                              style: TextStyle(
                                  fontSize: 18.0,
                                  fontFamily: "Inter",
                                  letterSpacing: 2,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              InkWell(
                onTap: () {
                  Get.to(() => const MapScreen());
                },
                child: const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "SKIP FOR NOW",
                    style: TextStyle(
                        fontFamily: "Inter",
                        letterSpacing: 2,
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff666666)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
