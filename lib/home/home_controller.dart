import 'package:DevQuiz/providers/api_provider.dart';
import 'package:DevQuiz/shared/models/quiz_model.dart';
import 'package:DevQuiz/shared/models/user_model.dart';
import 'package:flutter/foundation.dart';

enum HomeState {
  none,
  loading,
  success,
  error,
}

class HomeController {
  final stateNotifier = ValueNotifier<HomeState>(HomeState.none);
  UserModel? user;
  List<QuizModel>? quizzes;
  final api = ApiProvider();

  void _changeState(HomeState state) => stateNotifier.value = state;

  Future loadUser() async {
    _changeState(HomeState.loading);

    user = await api.getUser();

    _changeState(HomeState.success);
  }

  Future loadQuizzes() async {
    _changeState(HomeState.loading);

    quizzes = await api.getQuizzes();

    _changeState(HomeState.success);
  }
}
