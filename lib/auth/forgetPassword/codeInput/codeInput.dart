import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:mieny/Auth/forgetPassword/newPassword/NewPassword.dart';
import 'package:mieny/Constans.dart';
import 'package:pinput/pinput.dart';
import '../forgetPassword.dart';

class CodeInput extends StatefulWidget {
  final String email;
  const CodeInput({Key? key, required this.email}) : super(key: key);

  @override
  State<CodeInput> createState() => _CodeInputState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
String pin = '';
void _submitForm() {
  if (_formKey.currentState!.validate()) {}
}

String? validatePin(String? pin) {
  if (pin == null || pin.isEmpty) {
Get.snackbar("oops!","Please Enter the Code");
  } else {
    Get.to(() => const NewPassword(), transition: Transition.leftToRight);
  }
  return null;
}

final defaultPinTheme = PinTheme(
  width: 56,
  height: 56,
  textStyle:
      TextStyle(fontSize: 20, color: primaryColor, fontWeight: FontWeight.w600),
  decoration: BoxDecoration(
    border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
    borderRadius: BorderRadius.circular(8),
  ),
);

final focusedPinTheme = defaultPinTheme.copyDecorationWith(
  border: Border.all(color: primaryColor),
  borderRadius: BorderRadius.circular(8),
);

final submittedPinTheme = defaultPinTheme.copyWith(
  decoration: defaultPinTheme.decoration?.copyWith(
    color: const Color.fromRGBO(234, 239, 243, 1),
  ),
);

class _CodeInputState extends State<CodeInput> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 19,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: context.heightTransformer(dividedBy: 4),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 25.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Verify Code",
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
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: RichText(
                    text: TextSpan(
                      text: "We have sent a verification code\nto your given ",
                      style: const TextStyle(
                          fontSize: 18.0,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w600,
                          height: 1.4,
                          color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                            text: widget.email,
                            style: TextStyle(
                                fontSize: 18.0,
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w500,
                                height: 1.4,
                                color: primaryColor)),
                      ],
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Pinput(
                obscureText: true,
                length: 6,
                validator: validatePin,
                onChanged: (value) {
                  setState(() {
                    pin = value;
                  });
                },
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: focusedPinTheme,
                submittedPinTheme: submittedPinTheme,
                showCursor: true,
                onCompleted: (pin) => print(pin),
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 15.0,
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
                    _submitForm();
                  },
                  child: const SizedBox(
                    height: 50.0,
                    child: Center(
                      child: Text(
                        "Continue",
                        style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 18.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ResetScreen()));
                        },
                        child: const Text(
                          "Edit Email ?",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w600),
                        )),
                  ),
                  SizedBox(
                    width: context.widthTransformer(dividedBy: 3.3),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: TextButton(
                        onPressed: () {
                       Get.snackbar("DOne!", "Code Has Sent to your Given Email");
                        },
                        child: Text(
                          "Resend code!",
                          style: TextStyle(
                              color: primaryColor,
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w600),
                        )),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
