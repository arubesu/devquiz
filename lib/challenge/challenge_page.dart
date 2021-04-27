import 'package:DevQuiz/challenge/widgets/quiz/quiz_controller.dart';
import 'package:DevQuiz/shared/models/question_model.dart';
import 'package:DevQuiz/shared/widgets/button/rounded_button_widget.dart';
import 'package:flutter/material.dart';

import 'challenge_controller.dart';
import 'widgets/question_indicator/question_indicator_widget.dart';
import 'widgets/quiz/quiz_widget.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;

  const ChallengePage({
    Key? key,
    required this.questions,
  }) : super(key: key);

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final pageViewController = PageController();
  final challengeController = ChallengeController();
  final quizController = QuizController();

  @override
  void initState() {
    pageViewController.addListener(() {
      challengeController.currentPage = pageViewController.page!.toInt() + 1;
    });

    quizController.action = nextPage;

    super.initState();
  }

  void nextPage() {
    pageViewController.nextPage(
        curve: Curves.linear,
        duration: Duration(
          milliseconds: 300,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: SafeArea(
          top: true,
          child: ValueListenableBuilder<int>(
            valueListenable: challengeController.currentPageNotifier,
            builder: (context, value, _) => QuestionIndicatorWidget(
              questionNumber: value,
              questionCount: widget.questions.length,
            ),
          ),
        ),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageViewController,
        children: [
          ...widget.questions.map((e) => QuizWidget(
                controller: quizController,
                question: e,
              ))
        ],
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Expanded(
                child: RoundedButtonWidget.white(
              label: "Skip",
              onTap: nextPage,
            )),
            SizedBox(width: 7),
            Expanded(
                child: RoundedButtonWidget.green(
              label: "Confirm",
              onTap: () => quizController.onConfirmedAnswer(context),
            )),
          ]),
        ),
      ),
    );
  }
}
