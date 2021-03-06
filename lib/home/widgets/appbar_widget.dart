import 'package:DevQuiz/core/app_gradients.dart';
import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:DevQuiz/home/widgets/scorecard/scorecard_widget.dart';
import 'package:DevQuiz/shared/models/user_model.dart';
import 'package:flutter/widgets.dart';

class AppBarWidget extends PreferredSize {
  AppBarWidget({
    required UserModel user,
  }) : super(
          preferredSize: Size.fromHeight(250),
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 250,
              decoration: BoxDecoration(
                gradient: AppGradients.linear,
              ),
              child: Container(
                child: Stack(children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    height: 161,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      gradient: AppGradients.linear,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text.rich(TextSpan(
                            text: "Hello, ",
                            style: AppTextStyles.title,
                            children: [
                              TextSpan(
                                text: user.name,
                                style: AppTextStyles.titleBold,
                              ),
                            ])),
                        Container(
                            width: 58,
                            height: 58,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    user.photoUrl,
                                  ),
                                ))),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment(0, 1),
                    child: ScoreCard(),
                  )
                ]),
              )),
        );
}
