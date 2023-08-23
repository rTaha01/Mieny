import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mieny/Constans.dart';
import '../congratsPass/passChange.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({Key? key}) : super(key: key);

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

TextEditingController passwordTextEditingController = TextEditingController();
TextEditingController ConfirmpasswordTextEditingController =
    TextEditingController();
bool _passwordVisible = true;
bool _confirmpasswordVisible = true;

class _NewPasswordState extends State<NewPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: context.heightTransformer(dividedBy: 5),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Reset password",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 30,
                    fontFamily: "Inter",
                    color: Colors.black,
                  ),
                ),
              ),
            ),
             SizedBox(
              height: context.heightTransformer(dividedBy: 45),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 26.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Please type something you’ll remember.",
                  style: TextStyle(
                      fontSize: 15.0,
                      letterSpacing: 1,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                  margin: const EdgeInsets.only(left: 30),
                  child: const Text(
                    'Password',
                    style: TextStyle(color: Colors.white),
                  )),
            ),
            const SizedBox(
              height: 4,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.06,
              margin: const EdgeInsets.only(left: 30, right: 30),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextFormField(
                controller: passwordTextEditingController,
                obscureText: _passwordVisible,
                cursorColor: primaryColor,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                          const BorderSide(color: Colors.black12, width: 0.5),
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
            const SizedBox(
              height: 25.0,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                  margin: const EdgeInsets.only(left: 30),
                  child: const Text(
                    'Confirm Password',
                    style: TextStyle(color: Colors.white),
                  )),
            ),
            const SizedBox(
              height: 4,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.06,
              margin: const EdgeInsets.only(left: 30, right: 30),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextFormField(
                controller: ConfirmpasswordTextEditingController,
                obscureText: _confirmpasswordVisible,
                cursorColor: primaryColor,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                          const BorderSide(color: Colors.black12, width: 0.5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                          BorderSide(color: primaryColor, width: 1),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        // Based on passwordVisible state choose the icon
                        _confirmpasswordVisible
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: primaryColor,
                      ),
                      onPressed: () {
                        // Update the state i.e. toggle the state of passwordVisible variable
                        setState(() {
                          _confirmpasswordVisible = !_confirmpasswordVisible;
                        });
                      },
                    ),
                    hintText: 'Confirm Password',
                    hintStyle: const TextStyle(color: Colors.grey, fontSize: 12)),
                style: const TextStyle(fontSize: 14.0),
              ),
            ),
            const SizedBox(
              height: 54,
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(left: 30, right: 30),
              height: MediaQuery.of(context).size.height * 0.06,
              child: MaterialButton(
                color: primaryColor,
                textColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                onPressed: () {
                  // Navigator.of(context).push(
                  Get.to(() => const VerifySuccess(),
                      transition: Transition.fade);
                  // MaterialPageRoute(builder: (ctx) => const VerifySuccess()));
                },
                child: const SizedBox(
                  height: 50.0,
                  child: Center(
                    child: Text(
                      "Reset password",
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w400,
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
