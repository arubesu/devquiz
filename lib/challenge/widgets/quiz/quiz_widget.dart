import 'package:DevQuiz/challenge/widgets/answer/answer_widget.dart';
import 'package:DevQuiz/challenge/widgets/quiz/quiz_controller.dart';
import 'package:DevQuiz/core/core.dart';
import 'package:DevQuiz/shared/models/question_model.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatefulWidget {
  final QuestionModel question;
  final QuizController controller;

  const QuizWidget({
    Key? key,
    required this.question,
    required this.controller,
  }) : super(key: key);

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int _selectedIndex = -1;

  @override
  void initState() {
    widget.controller.selectedAnswer = null;
    widget.controller.question = widget.question;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        SizedBox(height: 64),
        Text(
          widget.question.title,
          style: AppTextStyles.heading,
        ),
        SizedBox(
          height: 24,
        ),
        for (int i = 0; i < widget.question.answers.length; i++)
          AnswerWidget(
              isSelected: _selectedIndex == i,
              answer: widget.question.answers[i],
              onTap: () {
                setState(() {
                  _selectedIndex = i;
                  widget.controller.selectedAnswer = widget.question.answers[i];
                });
              }),
      ],
    ));
  }
}
