import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.questionsSummary, {super.key});
  final List<Map<String, Object>> questionsSummary;
  @override
  Widget build(context) {
    return SizedBox(
      height: 350,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ...questionsSummary.map(
              (question) {
                return Row(
                  children: [
                    Text(((question["question_index"] as int) + 1).toString()),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            (question["question_data"] as String),
                          ),
                          const SizedBox(height: 10),
                          Text(question["user_answer"] as String),
                          const SizedBox(height: 10),
                          Text(question['correct_answer'] as String),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
