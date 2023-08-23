import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mieny/Auth/forgetPassword/codeInput/codeInput.dart';
import 'package:mieny/Constans.dart';


class ResetScreen extends StatefulWidget {
  @override
  _ResetScreenState createState() => _ResetScreenState();
}

class _ResetScreenState extends State<ResetScreen> {
  TextEditingController emailTextEditingController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      Get.snackbar("oops!","Please Enter Your Email");
    } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([a-z\d-]+\.)+[a-z]{2,}$')
        .hasMatch(email)) {
      Get.snackbar("oops!","Please Enter Valid Email");
    } else {
      Get.to(
        () => CodeInput(
          email: emailTextEditingController.text,
        ),
      );
    }
    return null;
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Padding(
            padding: EdgeInsets.all(10.0),
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 19,
            ),
          ),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: context.heightTransformer(dividedBy: 4),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 25.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Forget Password?",
                    style: TextStyle(
                        fontSize: 35.0,
                        fontWeight: FontWeight.w900,
                        fontFamily: "Inter",
                        color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: context.heightTransformer(dividedBy: 25),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 25.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Please enter your email address\nto reset your password",
                    style: TextStyle(
                        fontSize: 18.0,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w600,
                        height: 1.4,
                        color: Colors.black),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
              SizedBox(
                height: context.heightTransformer(dividedBy: 24),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 26.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Enter your Email',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Inter",
                        fontSize: 11,
                        fontWeight: FontWeight.w900),
                  ),
                ),
              ),
              SizedBox(
                height: context.heightTransformer(dividedBy: 60),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.06,
                width: double.infinity,
                margin: const EdgeInsets.only(left: 23, right: 25),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextFormField(
                  controller: emailTextEditingController,
                  keyboardType: TextInputType.emailAddress,
                  validator: validateEmail,
                  onChanged: (value) {
                    setState(() {
                    });
                  },
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
                      hintText: 'Enter your Email ',
                      hintStyle:
                          const TextStyle(color: Colors.grey, fontSize: 12)),
                  style: const TextStyle(
                      fontSize: 17.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: context.heightTransformer(dividedBy: 25),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(left: 25, right: 25),
                height: MediaQuery.of(context).size.height * 0.06,
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
                        "Forget Password",
                        style: TextStyle(
                            fontSize: 18.0,
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
      ),
    );
  }
}
