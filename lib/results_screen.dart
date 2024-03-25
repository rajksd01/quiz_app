import 'package:flutter/material.dart';
import 'package:quiz_app/models/quiz_questions_list.dart';
import 'package:quiz_app/question_summary.dart';


class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.chosenAnswers});
  final List<String> chosenAnswers;
// creating map to store the summary
  List<Map<String, Object>> dataSummary() {
    final List<Map<String, Object>> summary = [];

    for (int i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        "question_index": i,
        "question_data": questions[i].question,
        "correct_answer": questions[i].answers[0],
        "user_answer": chosenAnswers[i]
      });
    }
    return summary;
  }

  @override
  Widget build(context) {
    final summary = dataSummary();
    final totalQuestions = summary.length;
    final correctQuestions = summary.where((data) {
      return data["correct_answer"] == data["user_answer"];
    }).length;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
            "You  gave $correctQuestions out of $totalQuestions correct answers"),
        QuestionsSummary(dataSummary()),
        const Text("You did well"),
        TextButton(
          onPressed: () {},
          child: const Text("Restart Quiz"),
        ),
      ],
    );
  }
}
