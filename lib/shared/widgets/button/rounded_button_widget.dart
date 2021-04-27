import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:DevQuiz/core/core.dart';

class RoundedButtonWidget extends StatelessWidget {
  final String label;
  final Color fontColor;
  final Color backgroundColor;
  final Color borderColor;
  final Color overlayColor;
  final VoidCallback onTap;

  RoundedButtonWidget({
    Key? key,
    required this.label,
    required this.fontColor,
    required this.backgroundColor,
    required this.borderColor,
    required this.overlayColor,
    required this.onTap,
  }) : super(key: key);

  RoundedButtonWidget.white(
      {required String label, required VoidCallback onTap})
      : label = label,
        fontColor = AppColors.grey,
        backgroundColor = AppColors.white,
        borderColor = AppColors.border,
        overlayColor = AppColors.border,
        onTap = onTap;

  RoundedButtonWidget.purple(
      {required String label, required VoidCallback onTap})
      : label = label,
        fontColor = AppColors.white,
        backgroundColor = AppColors.purple,
        borderColor = AppColors.purple,
        overlayColor = Colors.purpleAccent,
        onTap = onTap;

  RoundedButtonWidget.green(
      {required String label, required VoidCallback onTap})
      : label = label,
        fontColor = AppColors.white,
        backgroundColor = AppColors.darkGreen,
        borderColor = AppColors.green,
        overlayColor = AppColors.darkerGreen,
        onTap = onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 48,
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(backgroundColor),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            overlayColor: MaterialStateProperty.all(overlayColor),
            side: MaterialStateProperty.all(
              BorderSide(
                color: borderColor,
              ),
            ),
          ),
          onPressed: onTap,
          child: Text(
            label,
            style: GoogleFonts.notoSans(
              fontWeight: FontWeight.w600,
              fontSize: 15,
              color: fontColor,
            ),
          ),
        ));
  }
}
