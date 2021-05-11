
import 'package:quiz_app_flutter/enums/difficulty.dart';
import 'package:quiz_app_flutter/models/question_model.dart';

abstract class BaseQuizRepository{
  Future<List<Question>> getQuestions({
  int numQuestions,
    int categoryId,
    Difficulty difficulty,
});
}