// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:nobschat/core/theme.dart';

class AuthTextfield extends StatelessWidget {

  String hintText;
  IconData icon;
  TextEditingController controller;
  bool isPassword;
  AuthTextfield({super.key, required this.hintText, required this.icon, required this.controller, this.isPassword = false});

  

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      margin: EdgeInsets.all(5),
      
      decoration: BoxDecoration(
        color: DefaultColors.sentMessageInput,
        borderRadius: BorderRadius.circular(30)
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey,),
          SizedBox(width: 10,),
          Expanded(
            child: TextField(
              controller: controller,
              obscureText: isPassword,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none,
              ),
              style: TextStyle(color: Colors.white),
            ),
          ),
          
        ],
      ),
    );
  }
}