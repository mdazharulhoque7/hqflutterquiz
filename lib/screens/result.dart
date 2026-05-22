import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final void Function() startQuiz;
  const ResultScreen({super.key, required this.startQuiz,});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'You answered 5 out of 10 questions correctly!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 191, 202, 213),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            const Text('List of answered questions and correct answers will be shown here.'),
            const SizedBox(height: 30),
            TextButton(
              onPressed: startQuiz,
              child: const Text('Restart Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}