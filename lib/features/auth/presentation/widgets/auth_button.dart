// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:nobschat/core/theme.dart';

class AuthButton extends StatelessWidget {
  String text;
  void Function()? onPressed;
  AuthButton({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed, 
      style: ElevatedButton.styleFrom(
        backgroundColor: DefaultColors.buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        padding: EdgeInsets.symmetric(vertical: 15),
        
      ),
      child: Text(text, style: TextStyle(color: Colors.white),),
    );
  }
}