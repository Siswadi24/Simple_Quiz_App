import 'package:flutter/material.dart';

class AnswerButtonWidget extends StatelessWidget {
  final String answerText;
  final void Function() onPressedAnswer;
  const AnswerButtonWidget({
    super.key,
    required this.answerText,
    required this.onPressedAnswer,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressedAnswer,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 15,
        ),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.grey[300],
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(
            15,
          ),
          side: BorderSide(
            color: Colors.grey[500]!,
          ),
        ),
      ),
      child: Text(
        answerText,
        textAlign: TextAlign.center,
      ),
    );
  }
}
