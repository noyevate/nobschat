// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class AuthPrompt extends StatelessWidget {
  String text1;
  String text2;
  void Function()? onTap;


  AuthPrompt({super.key, required this.text1, required this.text2, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: RichText(text: TextSpan(
          text: text1, style: TextStyle(color: Colors.white, fontSize: 10),
          children: [
            TextSpan(
              text: text2,
              style: TextStyle(color: Colors.blue,fontSize: 10),
            )
          ]
        )),
      ),
        );
  }
}