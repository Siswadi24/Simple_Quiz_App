import 'package:flutter/material.dart';
import 'package:quiz_app_learning/data/question_data.dart';
import 'package:quiz_app_learning/ui/quiz_screen.dart';
import 'package:quiz_app_learning/ui/result_screen.dart';
import 'package:quiz_app_learning/ui/welcome_screen.dart';

class QuizWidget extends StatefulWidget {
  const QuizWidget({super.key});

  @override
  State<QuizWidget> createState() => _QuizState();
}

class _QuizState extends State<QuizWidget> {
  // Widget? activeScreen;

  // @override
  // void initState() {
  //   activeScreen = WelcomeScreen(switchScreen);
  //   super.initState();
  // }

  // --- second way atau cara(using ternary operator) --- //
  var activeScreen = 'welcome-screen';
  List<String> selectedAnswers = [];

  void resetQuiz() {
    setState(() {
      activeScreen = 'welcome-screen';
      selectedAnswers = [];
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == dataQuestion.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  void switchScreen() {
    setState(() {
      // activeScreen = const QuizScreen();
      activeScreen = 'quiz-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    // ---Menggunakan logika Ternary operation untuk menampilkan screen atau mengarahkan ke screen yang lain --- //
    // final screenWidget = activeScreen == 'welcome-screen'
    //     ? WelcomeScreen(switchScreen)
    //     : const QuizScreen();

    // --- Menggunakan logika if else untuk menampilkan screen atau mengarahkan ke screen yang lain dan menyimpan data --- //
    Widget screenWidget = WelcomeScreen(switchScreen);
    if (activeScreen == 'quiz-screen') {
      screenWidget = QuizScreen(
        onSelectedAnswer: chooseAnswer,
      );
    }

    if (activeScreen == 'result-screen') {
      screenWidget = ResultScreen(
        choosenAnswers: selectedAnswers,
        onResetQuiz: resetQuiz,
      );
    }

    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 52, 8, 129),
                Color.fromARGB(255, 81, 79, 170),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget
          //activeScreen
          // activeScreen == 'welcome-screen'
          //     ? WelcomeScreen(switchScreen)
          //     : const QuizScreen(),
          ),
    );
  }
}
