import 'package:DevQuiz/home/widgets/appbar_widget.dart';
import 'package:DevQuiz/home/widgets/level_button_widget/level_button_widget.dart';
import 'package:DevQuiz/home/widgets/quizcard/quizcard_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(children: [
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
          QuizCardWidget(),
        ]),
      ),
    );
  }
}
