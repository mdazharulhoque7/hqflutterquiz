import 'package:flutter/material.dart';
import 'package:hqflutterquiz/screens/questions.dart';
import 'package:hqflutterquiz/screens/welcome.dart';

class HQFlutterQuizApp extends StatefulWidget {
  const HQFlutterQuizApp({super.key});
  @override
  State<HQFlutterQuizApp> createState() => _HQFlutterQuizAppState();
}

class _HQFlutterQuizAppState extends State<HQFlutterQuizApp> {

  Widget ? activeScreen;

  @override
  void initState() {
    // TODO: implement initState
    activeScreen = WelcomeScreen(switchScreen);
    super.initState();
  }

  void switchScreen() {
    setState(() {
      activeScreen = const QuestionsScreen();
    });
  }

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
        child: activeScreen
        ),
      ),
    );
  }
}

