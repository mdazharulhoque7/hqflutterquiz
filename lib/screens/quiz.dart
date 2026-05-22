import 'package:flutter/material.dart';
import 'package:hqflutterquiz/data/questions.dart';
import 'package:hqflutterquiz/screens/questions.dart';
import 'package:hqflutterquiz/screens/result.dart';
import 'package:hqflutterquiz/screens/welcome.dart';

class HQFlutterQuizApp extends StatefulWidget {
  const HQFlutterQuizApp({super.key});
  @override
  State<HQFlutterQuizApp> createState() => _HQFlutterQuizAppState();
}

class _HQFlutterQuizAppState extends State<HQFlutterQuizApp> {
  List<String> _selectedAnswers = [];
  Widget ? activeScreen;

  @override
  void initState() {
    activeScreen = WelcomeScreen(switchScreen);
    super.initState();
  }

  void switchScreen() {
    setState(() {
      activeScreen = QuestionsScreen(onSelectAnswer: chooseAnswer,);
    });
  }

  void chooseAnswer(String answer) {
    _selectedAnswers.add(answer);
    if(_selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen =  ResultScreen(startQuiz: switchScreen, selectedAnswers: _selectedAnswers,);
        _selectedAnswers = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
return MaterialApp(
      title: 'HQFlutterQuiz Demo',
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [ Color.fromARGB(255, 4, 59, 142), Color.fromARGB(190, 76, 121, 225)],
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

