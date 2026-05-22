import 'package:flutter/material.dart';
import 'package:hqflutterquiz/data/questions.dart';
import 'package:hqflutterquiz/models/quiz_questions.dart';
import 'package:hqflutterquiz/widgets/answer_button.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  final QuizQuestion currentQuestion = questions[0];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(currentQuestion.question,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(
                answerText: answer,
                onTap: () {},
              );
            }),
          ],
        ),
      ),
    );
  }
}