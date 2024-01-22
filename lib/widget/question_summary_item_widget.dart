import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app_learning/widget/question_identifikasi_widget.dart';

class QuestionSummaryItemWidget extends StatelessWidget {
  final Map<String, Object> itemData;
  const QuestionSummaryItemWidget({
    super.key,
    required this.itemData,
  });

  @override
  Widget build(BuildContext context) {
    final isCorrectAnswerItem =
        itemData['choosen_answer'] == itemData['correct_answer'];

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuestionIdentifikasiWidget(
            questionIndex: itemData['question_index'] as int,
            isAnsweredCorrect: isCorrectAnswerItem,
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  itemData['question'] as String,
                  style: GoogleFonts.eduSaBeginner(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'Jawaban benar: ${itemData['correct_answer']}',
                  style: GoogleFonts.eduSaBeginner(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'Jawaban dipilih: ${itemData['choosen_answer']}',
                  style: isCorrectAnswerItem
                      ? GoogleFonts.eduSaBeginner(
                          color: Colors.white,
                          fontSize: 15,
                        )
                      : const TextStyle(
                          color: Colors.red,
                        ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
