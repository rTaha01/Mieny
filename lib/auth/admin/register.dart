import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:mieny/auth/admin/vehical.dart';

import '../../Constans.dart';
import '../Login/login.dart';
import '../phoneAuth/chooseNumber.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}
TextEditingController name = TextEditingController();
TextEditingController email = TextEditingController();
TextEditingController password = TextEditingController();
TextEditingController confirmPassword = TextEditingController();
bool _passwordVisible = true;
bool _confirmpasswordVisible = true;
class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: context.heightTransformer(dividedBy: 4),
            ),
            const Align(
              alignment: Alignment.center,
              child: Text(
                "Login As Admin",
                style: TextStyle(
                    fontSize: 35,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w900,
                    color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 120,
            ),
            //  SizedBox(
            //   height: context.heightTransformer(dividedBy: 15),
            // ),
            // Container(
            //   height: MediaQuery.of(context).size.height * 0.06,
            //   width: double.infinity,
            //   margin: const EdgeInsets.only(left: 30, right: 30),
            //   child: TextFormField(
            //     controller: email,
            //     keyboardType: TextInputType.emailAddress,
            //     cursorColor: primaryColor,
            //     decoration: InputDecoration(
            //         enabledBorder: OutlineInputBorder(
            //           borderRadius: BorderRadius.circular(8),
            //           borderSide:
            //           const BorderSide(color: Colors.black12, width: 0.8),
            //         ),
            //         focusedBorder: OutlineInputBorder(
            //           borderRadius: BorderRadius.circular(8),
            //           borderSide: BorderSide(color: primaryColor, width: 1),
            //         ),
            //         hintText: 'Enter Your Name',
            //         hintStyle:
            //         const TextStyle(color: Colors.grey, fontSize: 12,fontFamily: "Inter")),
            //     style: const TextStyle(fontSize: 14.0),
            //   ),
            // ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.06,
              width: double.infinity,
              margin: const EdgeInsets.only(left: 30, right: 30),
              child: TextFormField(
                controller: email,
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
                    hintText: 'hello@company.com',
                    hintStyle:
                    const TextStyle(color: Colors.grey, fontSize: 12,fontFamily: "Inter")),
                style: const TextStyle(fontSize: 14.0),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.06,
              margin: const EdgeInsets.only(left: 30, right: 30),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextFormField(
                controller: password,
                obscureText: _passwordVisible,
                cursorColor: primaryColor,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                      const BorderSide(color: Colors.black12, width: 0.8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                      BorderSide(color: primaryColor, width: 1),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        // Based on passwordVisible state choose the icon
                        _passwordVisible
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: primaryColor,
                      ),
                      onPressed: () {
                        // Update the state i.e. toggle the state of passwordVisible variable
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                    hintText: 'Password',
                    hintStyle: const TextStyle(color: Colors.grey, fontSize: 12)),
                style: const TextStyle(fontSize: 14.0),
              ),
            ),
            // const SizedBox(
            //   height: 20,
            // ),
            // Container(
            //   height: MediaQuery.of(context).size.height * 0.06,
            //   margin: const EdgeInsets.only(left: 30, right: 30),
            //   decoration: BoxDecoration(
            //     color: Colors.white,
            //     borderRadius: BorderRadius.circular(8),
            //   ),
            //   child: TextFormField(
            //     controller: confirmPassword,
            //     obscureText: _confirmpasswordVisible,
            //     cursorColor: primaryColor,
            //     decoration: InputDecoration(
            //         enabledBorder: OutlineInputBorder(
            //           borderRadius: BorderRadius.circular(8),
            //           borderSide:
            //           const BorderSide(color: Colors.black12, width: 0.8),
            //         ),
            //         focusedBorder: OutlineInputBorder(
            //           borderRadius: BorderRadius.circular(8),
            //           borderSide:
            //           BorderSide(color: primaryColor, width: 1),
            //         ),
            //         suffixIcon: IconButton(
            //           icon: Icon(
            //             // Based on passwordVisible state choose the icon
            //             _confirmpasswordVisible
            //                 ? Icons.visibility_off
            //                 : Icons.visibility,
            //             color: primaryColor,
            //           ),
            //           onPressed: () {
            //             // Update the state i.e. toggle the state of passwordVisible variable
            //             setState(() {
            //               _confirmpasswordVisible = !_confirmpasswordVisible;
            //             });
            //           },
            //         ),
            //         hintText: 'Confirm Password',
            //         hintStyle: const TextStyle(color: Colors.grey, fontSize: 12)),
            //     style: const TextStyle(fontSize: 14.0),
            //   ),
            // ),
            const SizedBox(
              height: 40.0,
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(left: 30, right: 30),
              height: MediaQuery.of(context).size.height * 0.06,
              child: MaterialButton(
                color: primaryColor,
                textColor: primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                onPressed: () {
                  Get.to(() => const NewVehicle(),
                    duration: 1.seconds,);
                  if (kDebugMode) {
                    print(email.text.trim());
                    print(name.text.trim());
                    print(confirmPassword.text.trim());
                  }
                  if (kDebugMode) {
                    print(password.text.trim());
                  }
                },
                child: const SizedBox(
                  height: 50.0,
                  child: Center(
                    child: Text(
                      "Login As Admin",
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
            const SizedBox(
              height: 70.0,
            ),
            const Text("Login As USer? "),
            const SizedBox(
              height: 20.0,
            ),
            GestureDetector(
                onTap: () {
                  Get.to(() => const Login(),transition: Transition.fade);
                },
                child: Text("LOGIN",
                    style: TextStyle(
                        letterSpacing: 2,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w600,
                        color: primaryColor))),
            const SizedBox(
              height: 4.0,
            ),
            Container(
              height: 1,
              width: 25,
              color: primaryColor,
            )
          ],
        ),
      ),
    );
  }
}
