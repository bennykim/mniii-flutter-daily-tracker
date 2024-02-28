import 'package:flutter/material.dart';
import 'package:mniii_flutter_daily_tracker/widgets/quiz/summary_item.dart';

class QuestionsSummary extends StatelessWidget {
  final List<Map<String, Object>> summaryData;

  const QuestionsSummary(
    this.summaryData, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Expanded(
          child: Column(
            children: summaryData.map(
              (data) {
                return SummaryItem(data);
              },
            ).toList(),
          ),
        ),
      ),
    );
  }
}
