import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:DevQuiz/shared/widgets/progress_indicator/progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class QuestionIndicatorWidget extends StatelessWidget {
  final int questionNumber;
  final int questionCount;

  const QuestionIndicatorWidget({
    Key? key,
    required this.questionNumber,
    required this.questionCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(children: [
        SizedBox(
          height: 22,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "Question $questionNumber",
              style: AppTextStyles.body,
            ),
            Text(
              "of $questionCount",
              style: AppTextStyles.body,
            ),
          ],
        ),
        SizedBox(
          height: 16,
        ),
        ProgressIndicatorWidget(value: questionNumber / questionCount),
      ]),
    );
  }
}
