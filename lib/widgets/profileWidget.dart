import 'package:flutter/material.dart';

class ProfileWidget extends StatefulWidget {
  final text;
  final Icon;
  const ProfileWidget({super.key, required this.text, required this.Icon});

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Padding(
            padding: const EdgeInsets.only(left: 50.0),
            child: Text(widget.text,
              style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Inter",
                  color: Colors.black),
              textAlign: TextAlign.center,),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 40.0),
            child: Icon(widget.Icon,size: 30,),
          )
        ],
      ),
    );
  }
}
