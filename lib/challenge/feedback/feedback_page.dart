import 'package:DevQuiz/core/app_colors.dart';
import 'package:DevQuiz/shared/widgets/button/rounded_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FeedbackPage extends StatelessWidget {
  final bool isRight;
  final String rightDescription;
  final VoidCallback onConfirm;

  const FeedbackPage(
      {Key? key,
      required this.isRight,
      required this.rightDescription,
      required this.onConfirm})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: SafeArea(
        top: true,
        bottom: true,
        child: Container(
          color: AppColors.white,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(500),
                  border: Border.fromBorderSide(
                    BorderSide(
                      width: 5,
                      color: isRight ? AppColors.darkGreen : AppColors.darkRed,
                    ),
                  ),
                ),
                child: Icon(
                  isRight ? Icons.check : Icons.close,
                  size: 65,
                  color: isRight ? AppColors.darkGreen : AppColors.darkRed,
                )),
            SizedBox(
              height: 85,
            ),
            Text(
              isRight ? "You're right!" : "You're wrong =/",
              style: GoogleFonts.notoSans(
                color: AppColors.black,
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 59),
              child: Text(
                rightDescription,
                style: GoogleFonts.notoSans(
                  color: AppColors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: 59,
            ),
            SizedBox(
                width: 180,
                child: RoundedButtonWidget.purple(
                    label: "Next Question",
                    onTap: () {
                      Navigator.pop(context);
                      onConfirm();
                    })),
          ]),
        ),
      ),
    );
  }
}
