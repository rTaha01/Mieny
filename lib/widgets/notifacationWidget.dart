import 'package:flutter/material.dart';

class Notication extends StatefulWidget {
  final Image;
  final String name;
  final String time;
  const Notication({
    Key? key,
    required this.Image,
    required this.name,
    required this.time,
  }) : super(key: key);

  @override
  State<Notication> createState() => _NoticationState();
}

class _NoticationState extends State<Notication> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 15),
        color: Colors.white,
        height: 100,
        width: double.infinity,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Container(
                  height: 75,
                  width: 75,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey.shade300,
                  ),

                  child: Center(child: Image.asset(widget.Image,height: 35,width: 35,))),
            ),
            const SizedBox(
              width: 15,
            ),
            SizedBox(
              width: 250,
              child: Text(
                widget.name,
                textAlign: TextAlign.start,
                style: TextStyle(
                  height: 1.2,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Inter",
                  fontSize: 17,
                  color: Colors.grey.shade800,
                ),
              ),
            ),
            const SizedBox(
              width: 6,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 0.0),
              child: Text(
                widget.time,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontFamily: "Inter",
                  fontSize: 13,
                  color: Colors.grey.shade400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
