import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Constans.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  String selectedLanguage = '';

  List<String> languages = [
    'English',
    'Spanish',
    'French',
    'German',
    'Italian',
    'Japanese',
    'Chinese',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Choose Your Language',style: TextStyle(
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
        body: Column(
          children: [
            // Container to display selected language
            Container(
              padding: const EdgeInsets.all(16),
              alignment: Alignment.centerLeft,
              child: Text(
                'Selected Language: $selectedLanguage'
                  ,style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w700,
              fontFamily: "Inter",
                  color: Colors.black),),
              ),
            // Language selection list
            Expanded(
              child: ListView.builder(
                itemCount: languages.length,
                itemBuilder: (context, index) {
                  final language = languages[index];
                  return ListTile(
                    title: Text(language,style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Inter",
                        color: Colors.black),),
                    onTap: () {
                      setState(() {
                        selectedLanguage = language;
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
    );
  }
}