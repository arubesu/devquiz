import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart'
    show BuildContext, VoidCallback;

import 'package:DevQuiz/challenge/feedback/feedback_page.dart';
import 'package:DevQuiz/shared/models/answer_model.dart';
import 'package:DevQuiz/shared/models/question_model.dart';

class QuizController {
  QuestionModel? question;
  AnswerModel? selectedAnswer;
  bool selectedRightAnswer = false;
  AnswerModel? rightAnswer;
  VoidCallback? onConfirm;

  set action(VoidCallback action) => onConfirm = action;

  onConfirmedAnswer(BuildContext context) {
    if (selectedAnswer != null && question != null) {
      selectedRightAnswer = selectedAnswer!.isRight;
      rightAnswer = question!.answers.firstWhere((a) => a.isRight);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => FeedbackPage(
                    isRight: selectedRightAnswer,
                    rightDescription: rightAnswer!.title,
                    onConfirm: onConfirm!,
                  )));
    }
  }
}
