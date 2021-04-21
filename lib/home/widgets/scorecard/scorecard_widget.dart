import 'package:DevQuiz/core/core.dart';
import 'package:DevQuiz/home/widgets/chart/chart_widget.dart';
import 'package:flutter/material.dart';

class ScoreCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 136,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Row(
            children: [
              Expanded(flex: 1, child: Chart()),
              Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 24),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Let's start",
                            style: AppTextStyles.heading,
                          ),
                          Text(
                            "Complete the challenges and gain experience",
                            style: AppTextStyles.body,
                          ),
                        ]),
                  )),
            ],
          ),
        ));
  }
}
