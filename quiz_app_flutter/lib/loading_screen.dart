import 'dart:async';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:quiz_app_flutter/constants.dart';

// ignore: must_be_immutable
class QuizScreen extends StatefulWidget {
  var category;

  QuizScreen(this.category);

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {

  String quiz = "";
  int score = 0;
  bool opt1 = false;
  bool opt2 = false;
  bool opt3 = false;
  bool opt4 = false;
  late int questionNum = 0;
  late List<String> questionArray = [];
  late List<String> correctAnswerArray = [];
  late List<List> optionArray = List.generate(
      10, (i) => List.filled(10, null, growable: false),
      growable: false);

  void getHttp() async {
    try {
      var response = await Dio().get(
          'https://opentdb.com/api.php?amount=10&type=multiple&category=' +
              widget.category.toString());
      separateQuestions(response.data["results"].toString());
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
            child: questionArray.isNotEmpty
                ? questionNum < 10
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              height: 160,
                              child: Text(
                                questionArray[questionNum],
                                style: TextStyle(
                                    fontSize: 28, color: Colors.black87),
                              )),
                          Container(
                            width: widgetMaxWidth,
                            height: 360,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  child: Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    alignment: Alignment.centerLeft,
                                    height: 42,
                                    width: 500,
                                    child: Text(
                                      optionArray[questionNum][0],
                                      style: TextStyle(
                                          color: opt1
                                              ? optionArray[questionNum][0] ==
                                                      correctAnswerArray[
                                                          questionNum]
                                                  ? Colors.green
                                                  : Colors.redAccent
                                              : Colors.grey),
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                            color: opt1
                                                ? optionArray[questionNum][0] ==
                                                        correctAnswerArray[
                                                            questionNum]
                                                    ? Colors.green
                                                    : Colors.redAccent
                                                : Colors.grey,
                                            width: 2)),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      if (opt1) {
                                        opt1 = false;
                                      } else {
                                        opt1 = true;
                                        opt2 = opt3 = opt4 = false;
                                      }
                                      if (optionArray[questionNum][0] ==
                                          correctAnswerArray[questionNum]) {
                                        score++;
                                      }
                                      nextCall();
                                    });
                                  },
                                ),
                                GestureDetector(
                                  child: Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    alignment: Alignment.centerLeft,
                                    height: 42,
                                    width: 500,
                                    child: Text(
                                      optionArray[questionNum][1],
                                      style: TextStyle(
                                          color: opt2
                                              ? optionArray[questionNum][1] ==
                                                      correctAnswerArray[
                                                          questionNum]
                                                  ? Colors.green
                                                  : Colors.redAccent
                                              : Colors.grey),
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                            color: opt2
                                                ? optionArray[questionNum][1] ==
                                                        correctAnswerArray[
                                                            questionNum]
                                                    ? Colors.green
                                                    : Colors.redAccent
                                                : Colors.grey,
                                            width: 2)),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      if (opt2) {
                                        opt2 = false;
                                      } else {
                                        opt2 = true;
                                        opt1 = opt3 = opt4 = false;
                                      }
                                      if (optionArray[questionNum][1] ==
                                          correctAnswerArray[questionNum]) {
                                        score++;
                                      }
                                      nextCall();
                                    });
                                  },
                                ),
                                GestureDetector(
                                  child: Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    alignment: Alignment.centerLeft,
                                    height: 42,
                                    width: 500,
                                    child: Text(
                                      optionArray[questionNum][2],
                                      style: TextStyle(
                                          color: opt3
                                              ? optionArray[questionNum][2] ==
                                                      correctAnswerArray[
                                                          questionNum]
                                                  ? Colors.green
                                                  : Colors.redAccent
                                              : Colors.grey),
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                            color: opt3
                                                ? optionArray[questionNum][2] ==
                                                        correctAnswerArray[
                                                            questionNum]
                                                    ? Colors.green
                                                    : Colors.redAccent
                                                : Colors.grey,
                                            width: 2)),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      if (opt3) {
                                        opt3 = false;
                                      } else {
                                        opt3 = true;
                                        opt2 = opt1 = opt4 = false;
                                      }
                                      if (optionArray[questionNum][2] ==
                                          correctAnswerArray[questionNum]) {
                                        score++;
                                      }
                                      nextCall();
                                    });
                                  },
                                ),
                                GestureDetector(
                                  child: Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    alignment: Alignment.centerLeft,
                                    height: 42,
                                    width: 500,
                                    child: Text(
                                      optionArray[questionNum][3],
                                      style: TextStyle(
                                          color: opt4
                                              ? optionArray[questionNum][3] ==
                                                      correctAnswerArray[
                                                          questionNum]
                                                  ? Colors.green
                                                  : Colors.redAccent
                                              : Colors.grey),
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                            color: opt4
                                                ? optionArray[questionNum][3] ==
                                                        correctAnswerArray[
                                                            questionNum]
                                                    ? Colors.green
                                                    : Colors.redAccent
                                                : Colors.grey,
                                            width: 2)),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      if (opt4) {
                                        opt4 = false;
                                      } else {
                                        opt4 = true;
                                        opt2 = opt3 = opt1 = false;
                                      }
                                      if (optionArray[questionNum][3] ==
                                          correctAnswerArray[questionNum]) {
                                        score++;
                                      }
                                      nextCall();
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            child: Container(
                              alignment: Alignment.center,
                              height: 38,
                              width: widgetMaxWidth,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(2),
                                border: Border.all(color: Colors.grey),
                              ),
                              child: Text(
                                "SKIP",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    letterSpacing: 2),
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                nextCall();
                              });
                            },
                          )
                        ],
                      )
                    : Container(
                        child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            child: Column(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  width: 80,
                                  height: 80,
                                  child: Text(
                                    score.toString(),
                                    style: TextStyle(
                                        color: Colors.deepPurple,
                                        fontSize: 32,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(100),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black12,
                                            offset: Offset(0, 0),
                                            blurRadius: 12)
                                      ]),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.all(5),
                                      child: Icon(
                                        Icons.star,
                                        size: 32,
                                        color: score >= 3
                                            ? Colors.amber
                                            : Colors.grey,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.all(5),
                                      child: Icon(
                                        Icons.star,
                                        size: 32,
                                        color: score >= 6
                                            ? Colors.amber
                                            : Colors.grey,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.all(5),
                                      child: Icon(
                                        Icons.star,
                                        size: 32,
                                        color: score >= 9
                                            ? Colors.amber
                                            : Colors.grey,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          GestureDetector(
                            child: Container(
                              alignment: Alignment.center,
                              height: 38,
                              width: widgetMaxWidth,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(2),
                                border: Border.all(color: Colors.grey),
                              ),
                              child: Text(
                                "FINISH",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    letterSpacing: 2),
                              ),
                            ),
                            onTap: () => Navigator.pop(context),
                          )
                        ],
                      ))
                : Container(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.grey,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.deepPurpleAccent,
                      ),
                    ),
                  ),
          )),
        ],
      ),
    );
  }

  void separateQuestions(String input) {
    input = input.substring(1, input.length - 1);

    for (int i = 0; i < 10; i++) {
      int endPoint = input.indexOf("}");
      int startPoint = input.indexOf("{") + 1;
      getQuestion(input);
      getCorrectAnswer(input, i);
      getIncorrectAnswer(input, i);
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

  void getCorrectAnswer(String input, int i) {
    int startPoint = input.indexOf("correct_answer") + 16;
    int endPoint = input.substring(startPoint).indexOf(",") + startPoint;
    setState(() {
      correctAnswerArray.add(input.substring(startPoint, endPoint));
      Random rand = new Random();
      var num = rand.nextInt(4);
      optionArray[i][num] = input.substring(startPoint, endPoint);
    });
  }

  void getIncorrectAnswer(String input, int i) {
    int startPoint = input.indexOf("incorrect_answer") + 20;
    int endPoint = input.indexOf("]");
    input = input.substring(startPoint, endPoint);
    print(input);

    String option1 = input.substring(0, input.indexOf(','));
    input = input.substring(input.indexOf(",") + 1, input.length);
    print(option1);

    String option2 = input.substring(0, input.indexOf(','));
    input = input.substring(input.indexOf(",") + 1, input.length);
    print(option2);

    String option3 = input;
    print(option3);
    List<String> temp = [option1, option2, option3];
    int k = 0;
    setState(() {
      for (int j = 0; j < 4; j++) {
        if (optionArray[i][j] == null) {
          optionArray[i][j] = temp[k];
          k++;
        }
      }
    });
  }

  void nextCall() {
    opt1 = opt2 = opt3 = opt4 = false;
    questionNum++;
  }
}
