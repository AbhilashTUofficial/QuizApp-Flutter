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

  String quiz="";
  void getHttp() async {
    try {
      var response = await Dio().get('https://opentdb.com/api.php?amount=2&type=multiple');
      separateQuestions(response.data["results"].toString());
      // getQuestion(response.data["results"].toString());
      // getCorrectAnswer(response.data["results"].toString());
      // getIncorrectAnswer(response.data["results"].toString());

      setState(() {
        quiz=response.toString();
      });
    } catch (e) {
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    double widgetMaxWidth = MediaQuery.of(context).size.width * 0.86;
    double widgetMaxHeight = MediaQuery.of(context).size.height * 0.86;
   if(quiz=="") getHttp();

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: backgroundDecoration(),
          ),
          Center(
            child: Container(
              alignment: Alignment.center,
              width: widgetMaxWidth,
              height: widgetMaxHeight,
              decoration: contDecoration(),
              child:Text(quiz,style: TextStyle(color: Colors.redAccent),)
            ),
          )
        ],
      ),
    );
  }

  void separateQuestions(String input){
    print(input);
    for(int i=1;i<3;i++){
      int startPoint=input.indexOf("category")-2;
      int endPoint=input.substring(startPoint).indexOf("}")+startPoint;
      String Q=input.substring(startPoint,endPoint);
      print(i.toString()+Q);
      // getQuestion(input);
      // getCorrectAnswer(input);
      // getIncorrectAnswer(input);
      input=input.substring(endPoint-2);

    }
  }
  void getQuestion(String input) {
    int startPoint=input.indexOf("question")+10;
    int endPoint=input.substring(startPoint).indexOf("correct_answer")+startPoint-2;
    print(input.substring(startPoint,endPoint));
  }
  void getCorrectAnswer(String input) {
    int startPoint=input.indexOf("correct_answer")+14;
    int endPoint=input.substring(startPoint).indexOf(",")+startPoint;
    print(input.substring(startPoint,endPoint));
  }
  void getIncorrectAnswer(String input) {
    int startPoint=input.indexOf("incorrect_answer")+14;
    int endPoint=input.length-2;
    print(input.substring(startPoint,endPoint));
  }
}
