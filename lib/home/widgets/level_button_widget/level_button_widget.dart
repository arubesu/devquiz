import 'package:DevQuiz/core/core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LevelButtonWidget extends StatelessWidget {
  final String label;
  final LevelButtonStyle style;

  LevelButtonWidget({
    Key? key,
    required this.label,
    required this.style,
  }) : super(key: key);

  final config = {
    LevelButtonStyle.blue: {
      "color": AppColors.levelButtonMedium,
      "borderColor": AppColors.levelButtonBorderEasy,
      "fontColor": AppColors.levelButtonTextEasy,
    },
    LevelButtonStyle.green: {
      "color": AppColors.levelButtonMedium,
      "borderColor": AppColors.levelButtonBorderMedium,
      "fontColor": AppColors.levelButtonTextMedium,
    },
    LevelButtonStyle.orange: {
      "color": AppColors.levelButtonHard,
      "borderColor": AppColors.levelButtonBorderHard,
      "fontColor": AppColors.levelButtonTextHard,
    },
    LevelButtonStyle.red: {
      "color": AppColors.levelButtonHero,
      "borderColor": AppColors.levelButtonBorderHero,
      "fontColor": AppColors.levelButtonTextHero,
    },
  };

  Color get buttonColor => config[style]!['color']!;
  Color get borderColor => config[style]!['borderColor']!;
  Color get fontColor => config[style]!['fontColor']!;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(28),
            border: Border.fromBorderSide(BorderSide(
              color: borderColor,
            ))),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 6,
          ),
          child: Text(
            label,
            style: GoogleFonts.notoSans(
              color: fontColor,
            ),
          ),
        ));
  }
}

enum LevelButtonStyle { blue, green, orange, red }
