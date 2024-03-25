class QuizQuestions {
  const QuizQuestions(this.question, this.answers);

  final String question;
  final List<String> answers;
  List<String> shuffledAnswers() {
    final shuffledItems = List.of(answers);
    shuffledItems.shuffle();
    return shuffledItems;
  }
}
