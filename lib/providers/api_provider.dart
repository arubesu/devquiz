import 'dart:convert';

import 'package:DevQuiz/shared/models/quiz_model.dart';
import 'package:DevQuiz/shared/models/user_model.dart';
import 'package:http/http.dart' show Client;

class ApiProvider {
  Client client = Client();
  final String _baseUrl = "http://10.0.2.2:3000";

  Future<UserModel> getUser() async {
    final response = await client.get(Uri.parse("$_baseUrl/users/1"));
    return UserModel.fromJson(response.body);
  }

  Future<List<QuizModel>> getQuizzes() async {
    final response = await client.get(Uri.parse("$_baseUrl/quizzes"));
    return List<QuizModel>.from(
        json.decode(response.body).map((e) => QuizModel.fromMap(e)));
  }
}
