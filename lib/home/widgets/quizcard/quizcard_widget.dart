import 'package:DevQuiz/core/app_colors.dart';
import 'package:DevQuiz/core/core.dart';
import 'package:flutter/material.dart';

class QuizCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.fromBorderSide(
              BorderSide(
                color: AppColors.border,
              ),
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                height: 40,
                width: 40,
                child: Image.asset(
                  AppImages.blocks,
                )),
            SizedBox(
              height: 24,
            ),
            Text(
              "Gerenciamento de Estado",
              style: AppTextStyles.heading15,
            ),
            SizedBox(
              height: 24,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Text(
                    "1 de 3",
                    style: AppTextStyles.body11,
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: LinearProgressIndicator(
                    backgroundColor: AppColors.chartSecondary,
                    value: 0.3,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      AppColors.chartPrimary,
                    ),
                  ),
                )
              ],
            )
          ],
        ));
  }
}
