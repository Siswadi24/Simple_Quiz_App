import 'package:flutter/material.dart';
import 'package:quiz_app_learning/widget/question_summary_item_widget.dart';

class QuestionSummaryWidget extends StatelessWidget {
  final List<Map<String, Object>> summaryDataResult;
  const QuestionSummaryWidget({
    super.key,
    required this.summaryDataResult,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
          child: Column(
        children: summaryDataResult.map((data) {
          return QuestionSummaryItemWidget(itemData: data);
        }).toList(),
      )),
    );
  }
}
