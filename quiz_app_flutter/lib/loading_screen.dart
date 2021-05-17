import 'dart:convert';
import 'dart:io';
import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app_flutter/constants.dart';
import 'package:quiz_app_flutter/quizQuestionAndAnswers.dart';
//import 'package:http/http.dart' as http;

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  late Future<QuizQA> futureQuizQA;

  String quiz = "";
  late int questionNum = 0;
  late List<String> questionArray = [];
  late List<String> correctAnswerArray = [];
  late List<List> optionArray = List.generate(
      10, (i) => List.filled(10, null, growable: false),
      growable: false);

  void getHttp() async {
    try {
      var response =
          await Dio().get('https://opentdb.com/api.php?amount=10&type=multiple');
      separateQuestions(response.data["results"].toString());

      // getQuestion(response.data["results"].toString());
      // getCorrectAnswer(response.data["results"].toString());
      // getIncorrectAnswer(response.data["results"].toString());

      setState(() {
        quiz = response.toString();
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    double widgetMaxWidth = MediaQuery.of(context).size.width * 0.86;
    double widgetMaxHeight = MediaQuery.of(context).size.height * 0.86;
    if (quiz == "") getHttp();

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: backgroundDecoration(),
          ),
          Center(
              child: Container(
            padding: EdgeInsets.only(left: 20, right: 20, top: 20),
            alignment: Alignment.center,
            width: widgetMaxWidth,
            height: widgetMaxHeight,
            decoration: contDecoration(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 160,
                  child:
                  questionArray.isNotEmpty
                      ? questionNum<10?Text(
                          questionArray[questionNum],
                          style: TextStyle(fontSize: 28, color: Colors.black87),
                        ):SizedBox.shrink()
                      : Container(
                          width: 160,
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.grey,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.deepPurpleAccent,
                            ),
                          ),
                        ),
                ),
                Container(
                  width: widgetMaxWidth,
                  height: 360,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey),
                  ),
                ),
                GestureDetector(
                  child: Container(
                    alignment: Alignment.center,
                    height: 38,
                    width: widgetMaxWidth,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(2),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Text(
                      "SKIP",
                      style: TextStyle(
                          color: Colors.white, fontSize: 18, letterSpacing: 2),
                    ),
                  ),
                  onTap: (){
                    setState(() {
                      questionNum++;
                      print(questionNum);
                    });
                  },
                )
              ],
            ),
          )),
        ],
      ),
    );
  }

  void separateQuestions(String input) {
    input = input.substring(1, input.length - 1);

    for (int i = 1; i <=10; i++) {
      int endPoint = input.indexOf("}");
      int startPoint = input.indexOf("{") + 1;
      print(i);
      getQuestion(input);
      getCorrectAnswer(input);
      getIncorrectAnswer(input);
      input = input.substring(endPoint + 1, input.length);
    }
  }

  void getQuestion(String input) {
    int startPoint = input.indexOf("question") + 10;
    int endPoint =
        input.substring(startPoint).indexOf("correct_answer") + startPoint - 2;
    setState(() {
      questionArray.add(input.substring(startPoint, endPoint));
    });
  }

  void getCorrectAnswer(String input) {
    int startPoint = input.indexOf("correct_answer") + 16;
    int endPoint = input.substring(startPoint).indexOf(",") + startPoint;
    setState(() {
      correctAnswerArray.add(input.substring(startPoint, endPoint));
    });
  }

  void getIncorrectAnswer(String input) {
    int startPoint = input.indexOf("incorrect_answer") + 20;
    int endPoint = input.indexOf("]");
    print(input.substring(startPoint, endPoint));
  }
}
