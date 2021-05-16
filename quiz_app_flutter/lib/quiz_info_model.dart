import 'package:flutter/cupertino.dart';

class QuizInfo {
  String category;
  int categoryNum;
  String difficult;
  int questionNum;
  QuizInfo({
    required this.category,
    required this.categoryNum,
    required this.difficult,
    required this.questionNum,
  });
}
List<QuizInfo> quizInfo=[
  QuizInfo(category:'Comics', difficult: 'easy', questionNum: 10, categoryNum: 29),
  QuizInfo(category:'Anime', difficult: 'easy', questionNum: 10, categoryNum: 31),
  QuizInfo(category:'General Knowledge', difficult: 'easy', questionNum: 10, categoryNum: 9),
  QuizInfo(category:'Television', difficult: 'easy', questionNum: 10, categoryNum: 14),
  QuizInfo(category:'Video Games', difficult: 'easy', questionNum: 10, categoryNum: 15),
  QuizInfo(category:'Science & Nature', difficult: 'easy', questionNum: 10, categoryNum: 17),
  QuizInfo(category:'Computers', difficult: 'easy', questionNum: 10, categoryNum: 18),
  QuizInfo(category:'Sports', difficult: 'easy', questionNum: 10, categoryNum: 21),
  QuizInfo(category:'Geography', difficult: 'easy', questionNum: 10, categoryNum: 22),
  QuizInfo(category:'History', difficult: 'easy', questionNum: 10, categoryNum: 23),
  QuizInfo(category:'Animals', difficult: 'easy', questionNum: 10, categoryNum: 27),
  QuizInfo(category:'Vehicles', difficult: 'easy', questionNum: 10, categoryNum: 28),];

