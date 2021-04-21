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
  final int questionsAnsered;
  final String imageSrc;
  final Level level;

  QuizModel({
    required this.title,
    required this.questions,
    this.questionsAnsered = 0,
    required this.imageSrc,
    required this.level,
  });
}
