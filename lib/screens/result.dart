import 'package:flutter/material.dart';
import 'package:hqflutterquiz/data/questions.dart';
import 'package:hqflutterquiz/screens/result_summary/result_summary.dart';

class ResultScreen extends StatelessWidget {
  final void Function() startQuiz;
  final List<String> selectedAnswers;
  const ResultScreen({super.key, required this.startQuiz, required this.selectedAnswers});


  
  List<Map<String, Object>> get getSummaryData {
    List<Map<String, Object>> summary = [];
    for (var i = 0; i < selectedAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'no': i+1,
        'question': questions[i].question, // Replace with actual question text
        'selectedAnswer': selectedAnswers[i],
        'correctAnswer': questions[i].answers[0], // Replace with actual correct answer
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData;
    final numCorrectAnswers = summaryData.where((data) => data['selectedAnswer'] == data['correctAnswer']).length;
    final totalQuestions = questions.length;
    
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'You answered $numCorrectAnswers out of $totalQuestions questions correctly!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 191, 202, 213),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ResultSummary(summaryData: summaryData),
            const SizedBox(height: 30),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              side: BorderSide(color: const Color.fromARGB(226, 197, 197, 231)),
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            
            ),
            icon: Icon(Icons.arrow_forward),
            label: const Text('Restart Quiz'),
          ),
          ],
        ),
      ),
    );
  }
}