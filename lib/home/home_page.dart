import 'package:DevQuiz/core/core.dart';
import 'package:DevQuiz/home/widgets/appbar_widget.dart';
import 'package:DevQuiz/home/widgets/level_button_widget/level_button_widget.dart';
import 'package:DevQuiz/home/widgets/quizcard/quizcard_widget.dart';
import 'package:flutter/material.dart';

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  void initState() {
    super.initState();

    controller.loadUser();
    controller.loadQuizzes();

    controller.stateNotifier.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (controller.stateNotifier.value == HomeState.success) {
      return Scaffold(
        appBar: AppBarWidget(
          user: controller.user!,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(children: [
            SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                LevelButtonWidget(
                  label: 'Easy',
                  style: LevelButtonStyle.blue,
                ),
                LevelButtonWidget(
                  label: 'Medium',
                  style: LevelButtonStyle.green,
                ),
                LevelButtonWidget(
                  label: 'Hard',
                  style: LevelButtonStyle.orange,
                ),
                LevelButtonWidget(
                  label: 'Hero',
                  style: LevelButtonStyle.red,
                ),
              ],
            ),
            SizedBox(
              height: 24,
            ),
            Expanded(
              child: GridView.count(
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                crossAxisCount: 2,
                children: controller.quizzes!
                    .map(
                      (e) => QuizCardWidget(
                        title: e.title,
                        questionsAnswered: e.questionsAnswered,
                        questionsCount: e.questions.length,
                      ),
                    )
                    .toList(),
              ),
            ),
          ]),
        ),
      );
    } else {
      return Container(
        color: AppColors.white,
        width: 50,
        height: 50,
        child: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
          ),
        ),
      );
    }
  }
}
