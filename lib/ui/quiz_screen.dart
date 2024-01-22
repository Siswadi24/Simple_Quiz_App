import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:quiz_app_learning/widget/answer_button_widget.dart';
import 'package:quiz_app_learning/data/question_data.dart';

class QuizScreen extends StatefulWidget {
  final void Function(String answer) onSelectedAnswer;

  const QuizScreen({
    super.key,
    required this.onSelectedAnswer,
  });

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  var currentQuestionIndex = 0;

  void answerQuestionNext(String selectedAnswer) {
    widget.onSelectedAnswer(selectedAnswer);
    // currentQuestionIndex += 1;
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final dataQuestions = dataQuestion[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              dataQuestions.text,
              style: GoogleFonts.eduSaBeginner(
                fontSize: 26,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            ...dataQuestions.getShuffledAnswers().map((dataAnswer) {
              return AnswerButtonWidget(
                answerText: dataAnswer,
                onPressedAnswer: () {
                  answerQuestionNext(dataAnswer);
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
