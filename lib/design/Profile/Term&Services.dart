import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Constans.dart';

class TermsAndServicesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Term & Services',style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontFamily: "Inter"
        ),),
        centerTitle: true,automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: InkWell(
            onTap: (){
              Get.back();
            },
            child: Icon(Icons.arrow_back_ios_new_rounded,color: primaryColor,size: 30,)),
      ),
        body: const Padding(
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Terms and Services',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                // Add your terms and services content here
                Text(
                  '1. Introduction',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ...',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),
                Text(
                  '2. User Responsibilities',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Nulla facilisi. Integer a cursus purus, ut vulputate mi. ...',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),
                // Add more sections and content as needed
              ],
            ),
          ),
        ),
    );
  }
}
