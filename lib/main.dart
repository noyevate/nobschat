import 'package:flutter/material.dart';
import 'package:nobschat/chat_page.dart';
import 'package:nobschat/core/theme.dart';
import 'package:nobschat/message_page.dart';
import 'package:nobschat/resgister_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'nobschat',
      theme: AppTheme.darkTheme,
      // home: MessagePage(),

      home: ResgisterPage(),
    );
  }
}

