import 'package:flutter/material.dart';

import 'package:DevQuiz/core/core.dart';
import 'package:DevQuiz/shared/models/answer_model.dart';

class AnswerWidget extends StatelessWidget {
  final bool isSelected;
  final bool disabled;
  final AnswerModel answer;
  final VoidCallback onTap;

  AnswerWidget({
    Key? key,
    this.isSelected = false,
    required this.answer,
    required this.onTap,
    this.disabled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: disabled,
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: isSelected ? AppColors.lightGreen : Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              border: Border.fromBorderSide(
                BorderSide(
                  color: isSelected ? AppColors.green : AppColors.border,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Text(
                    answer.title,
                    style: isSelected
                        ? AppTextStyles.bodyDarkGreen
                        : AppTextStyles.body,
                  ),
                ),
                Container(
                    decoration: BoxDecoration(
                      color: isSelected ? AppColors.green : AppColors.white,
                      borderRadius: BorderRadius.circular(500),
                      border: Border.fromBorderSide(
                        BorderSide(
                          color: isSelected
                              ? AppColors.lightGreen
                              : AppColors.border,
                        ),
                      ),
                    ),
                    height: 24,
                    width: 24,
                    child: Icon(
                      Icons.check,
                      size: 16,
                      color: AppColors.white,
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
