import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({super.key, required this.answerText, required this.onTap});
  
  final String answerText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 7, 60, 185),
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        textStyle: const TextStyle(fontSize: 18),
      ),
      onPressed: onTap, 
      child: Text(answerText),
    );
  }
}