import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mieny/Constans.dart';
import '../../design/navBar/navBar.dart';
import '../admin/register.dart';
import '../forgetPassword/forgetPassword.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

TextEditingController emailTextEditingController = TextEditingController();
TextEditingController passwordTextEditingController = TextEditingController();
bool _passwordVisible = true;

class _LoginState extends State<Login> {

  @override
  void dispose() {
    emailTextEditingController.dispose();
    passwordTextEditingController.dispose();
    super.dispose();
  }

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
                "Log In",
                style: TextStyle(
                    fontSize: 25,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.06,
              width: double.infinity,
              margin: const EdgeInsets.only(left: 30, right: 30),
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
                    hintText: 'hello@company.com',
                    hintStyle:
                        const TextStyle(color: Colors.grey, fontSize: 12,fontFamily: "Inter")),
                style: const TextStyle(fontSize: 14.0),
              ),
            ),
            const SizedBox(
              height: 25.0,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.06,
              margin: const EdgeInsets.only(left: 30, right: 30),
              child: TextFormField(
                controller: passwordTextEditingController,
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
                      borderSide: BorderSide(color: primaryColor, width: 1),
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
                    hintStyle:
                        const TextStyle(color: Colors.grey, fontSize: 12,fontFamily: "Inter")),
                style: const TextStyle(fontSize: 14.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: () {
                      Get.to(() => ResetScreen());
                    },
                    child: Text(
                      'Forget Password',
                      style: TextStyle(
                          color: primaryColor,
                          fontSize: 11,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w500),
                    )),
              ),
            ),
            const SizedBox(
              height: 20.0,
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
                  Get.to(() =>  const NavBar(),
                      duration: 1.seconds,);
                  if (kDebugMode) {
                    print(emailTextEditingController.text.trim());
                  }
                  if (kDebugMode) {
                    print(passwordTextEditingController.text.trim());
                  }
                },
                child: const SizedBox(
                  height: 50.0,
                  child: Center(
                    child: Text(
                      "Login",
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
              height: 20.0,
            ),
            const SizedBox(
              height: 12,
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Text("Login As Admin? "),
            const SizedBox(
              height: 10.0,
            ),
            GestureDetector(
                onTap: () {
                  Get.to(() => const Register(),transition: Transition.fade);
                },
                child: Text("ADMIN",
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
