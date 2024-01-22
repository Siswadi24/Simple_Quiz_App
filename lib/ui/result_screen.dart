import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app_learning/data/question_data.dart';
import 'package:quiz_app_learning/widget/question_summary_widget.dart';

class ResultScreen extends StatelessWidget {
  final List<String> choosenAnswers;
  final void Function() onResetQuiz;

  const ResultScreen({
    super.key,
    required this.choosenAnswers,
    required this.onResetQuiz,
  });

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summaryData = [];

    for (var i = 0; i < choosenAnswers.length; i++) {
      summaryData.add({
        'question_index': i,
        'question': dataQuestion[i].text,
        'correct_answer': dataQuestion[i].answer[0],
        'choosen_answer': choosenAnswers[i],
      });
    }

    return summaryData;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestion = dataQuestion.length;
    final numCorrectAnswer = summaryData.where((dataSummaryCorrect) {
      return dataSummaryCorrect['correct_answer'] ==
          dataSummaryCorrect['choosen_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Jawaban benar $numCorrectAnswer dari $numTotalQuestion soal',
              style: GoogleFonts.eduSaBeginner(
                color: Colors.white,
                fontSize: 23,
              ),
            ),
            const SizedBox(height: 20),
            QuestionSummaryWidget(
              summaryDataResult: summaryData,
            ),
            const SizedBox(height: 20),
            TextButton.icon(
              onPressed: onResetQuiz,
              label: Text(
                'Ulangi Quiz',
                style: GoogleFonts.eduSaBeginner(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              icon: const Icon(
                Icons.refresh_rounded,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
