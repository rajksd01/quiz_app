import 'package:flutter/material.dart';
import 'package:quiz_app/home.dart';
import 'package:quiz_app/questions.dart';
import 'package:quiz_app/models/quiz_questions_list.dart';
import 'package:quiz_app/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  // we can also move with next solution that is using tenrary solution where
  //we can do the following whch wont require a init function.

  //1 . Widget activeScreen = 'home-screen';
  // 2. OR we can use a local variable inside the build method  as var and then we can use if's to modify the  data

  Widget? activeScreen;

  @override
  void initState() {
    super.initState();
    activeScreen = Home(changeScreen);
  }

  // to lift the state for having the selected answers
  List<String> selectedAnswers = [];
  //  to add the answers
  void addSelectedAnswers(String chosenAnswer) {
    selectedAnswers.add(chosenAnswer);
    // to change the screen once all questions are answered
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = ResultsScreen(
          chosenAnswers: selectedAnswers,
        );
      });
    }
  }

// to change screen between home and questions
  void changeScreen() {
    setState(() {
      activeScreen = Questions(onSelectAnswer: addSelectedAnswers);
      //  activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [Colors.cyan, Colors.indigo])),
          child: Center(
            child: activeScreen,
            // child: activeScreen = 'homescreen ? changeScreen(Home()) : Questions())
          ),
        ),
      ),
    );
  }
}
