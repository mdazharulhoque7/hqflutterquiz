class QuizQuestion {
  final String question;
  final List<String> answers;

  const QuizQuestion(this.question, this.answers);

  List<String> get shuffledAnswers {
    /* 
    Create a copy of the answers list and shuffle it to avoid modifying the original list.
    This ensures that the original order of answers is preserved for each question, while still providing a randomized order for display. 
    */

    final shuffledAnswers = List<String>.from(answers);
    shuffledAnswers.shuffle();
    return shuffledAnswers;
  }
}