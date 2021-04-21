import 'dart:convert';
import 'package:DevQuiz/shared/helpers/helpers.dart';
import 'package:flutter/foundation.dart';

import 'question_model.dart';

enum Level {
  easy,
  medium,
  hard,
  hero,
}

class QuizModel {
  final String title;
  final List<QuestionModel> questions;
  final int questionsAnswered;
  final String image;
  final Level level;

  QuizModel({
    required this.title,
    required this.questions,
    this.questionsAnswered = 0,
    required this.image,
    required this.level,
  });

  QuizModel copyWith({
    String? title,
    List<QuestionModel>? questions,
    int? questionsAnswered,
    String? image,
    Level? level,
  }) {
    return QuizModel(
      title: title ?? this.title,
      questions: questions ?? this.questions,
      questionsAnswered: questionsAnswered ?? this.questionsAnswered,
      image: image ?? this.image,
      level: level ?? this.level,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'questions': questions.map((x) => x.toMap()).toList(),
      'questionsAnswered': questionsAnswered,
      'image': image,
      'level': describeEnum(level),
    };
  }

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return QuizModel(
      title: map['title'],
      questions: List<QuestionModel>.from(
          map['questions']?.map((x) => QuestionModel.fromMap(x))),
      questionsAnswered: map['questionsAnswered'],
      image: map['image'],
      level: enumFromString(Level.values, map['level']),
    );
  }

  String toJson() => json.encode(toMap());

  factory QuizModel.fromJson(String source) =>
      QuizModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'QuizModel(title: $title, questions: $questions, questionsAnswered: $questionsAnswered, image: $image, level: $level)';
  }
}
