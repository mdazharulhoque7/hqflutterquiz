import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hqflutterquiz/data/questions.dart';
import 'package:hqflutterquiz/models/quiz_questions.dart';
import 'package:hqflutterquiz/widgets/answer_button.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer,});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    // Handle the selected answer (e.g., check if it's correct, update score, etc.)
    // For now, we'll just print the selected answer to the console.
    print('Selected answer: $selectedAnswer');
    widget.onSelectAnswer(selectedAnswer);
    // Move to the next question
    setState(() {
      if (currentQuestionIndex < questions.length) {
        currentQuestionIndex++;
      } else {
        // Handle the end of the quiz (e.g., show results, reset quiz, etc.)
        print('Quiz completed!');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    late QuizQuestion currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.question,
              // style: const TextStyle(
              //   color: Colors.white,
              //   fontSize: 18,
              //   fontWeight: FontWeight.bold,
              // ),
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 191, 202, 213),
                fontSize: 24,
                fontWeight: FontWeight.bold,
                textStyle: const TextStyle(
                  shadows: [
                    Shadow(
                      color: Color.fromARGB(255, 6, 34, 98),
                      offset: Offset(2, 2),
                      blurRadius: 3,
                    ),
                  ],
                ),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currentQuestion.shuffledAnswers.map((answer) {
              return AnswerButton(
                answerText: answer,
                onTap: () => answerQuestion(answer),
              );
            }),
          ],
        ),
      ),
    );
  }
}
