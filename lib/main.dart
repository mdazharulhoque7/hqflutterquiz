import 'package:flutter/material.dart';
import 'package:hqflutterquiz/screens/welcome.dart';

void main() {
  runApp(const HQFlutterQuizApp());
}

class HQFlutterQuizApp extends StatelessWidget {
  const HQFlutterQuizApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HQFlutterQuiz Demo',
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [ Color.fromARGB(166, 61, 117, 201), Color.fromARGB(255, 7, 60, 185)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        child: const WelcomeScreen()
        ),
      ),
    );
  }
}