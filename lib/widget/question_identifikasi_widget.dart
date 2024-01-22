import 'package:flutter/material.dart';

class QuestionIdentifikasiWidget extends StatelessWidget {
  final int questionIndex;
  final bool isAnsweredCorrect;
  const QuestionIdentifikasiWidget({
    super.key,
    required this.questionIndex,
    required this.isAnsweredCorrect,
  });

  @override
  Widget build(BuildContext context) {
    final questionNumber = questionIndex + 1;

    return Container(
      width: 20,
      height: 20,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isAnsweredCorrect ? Colors.green : Colors.red[800],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        questionNumber.toString(),
      ),
    );
  }
}
