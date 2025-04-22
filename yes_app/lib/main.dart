import 'package:flutter/material.dart';
import 'package:yes_app/screens/intro_screen.dart';

void main() {
  runApp(const YesApp());
}

class YesApp extends StatelessWidget {
  const YesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yes App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'YourCustomFont', // update later
        brightness: Brightness.light,
      ),
      home: const IntroScreen(), // 👈 new change
    );
  }
}