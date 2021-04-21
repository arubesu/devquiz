import 'package:DevQuiz/challenge/widgets/answer/answer_widget.dart';
import 'package:DevQuiz/core/core.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatelessWidget {
  final String title;

  const QuizWidget({
    Key? key,
    required this.title,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        Text(
          title,
          style: AppTextStyles.heading,
        ),
        SizedBox(
          height: 24,
        ),
        AnswerWidget(
          isRight: false,
          isSelected: true,
          title:
              "Vero modi repudiandae aut quia quaerat hic qui hic.Vero modi repudiandae aut quia quaerat hic qui hic.",
        ),
        AnswerWidget(
          title:
              "Vero modi repudiandae Vero modi repudiandae aut quia quaerat hic qui hic.aut quia quaerat hic qui hic.",
        ),
        AnswerWidget(
          title:
              "Vero modi repudiandae aut quVero modi repudiandae aut quia quaerat hic qui hic.ia quaerat hic qui hic.",
        ),
        AnswerWidget(
          title:
              "Vero modi repudiandae aut quVero modi repudiandae aut quia quaerat hic qui hic.ia quaerat hic qui hic.",
        ),
      ],
    ));
  }
}
