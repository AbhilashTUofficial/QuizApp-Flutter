import 'package:flutter/material.dart';

class QuizQA {
  String question;
  String correctAnswer;
  String incorrectAnswer;


  QuizQA({
    required this.question,
    required this.correctAnswer,
    required this.incorrectAnswer,
  });

  factory QuizQA.fromJson(Map<String, dynamic> json) {
    return QuizQA(
      question: json["question"],
      correctAnswer: json["correct_answer"],
      incorrectAnswer: json["incorrect_answers"]
    );
  }
}
