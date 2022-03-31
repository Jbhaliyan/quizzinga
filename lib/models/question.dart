import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Quiz {
  late int responseCode;
  late List<Question> questions;

  Quiz(
    this.responseCode,
    this.questions,
  );

  //Serialization
  Quiz.fromJson(Map<String, dynamic> json) {
    responseCode = json['response_code'];
    if (json['results'] != null) {
      questions = <Question>[];
      json['results'].forEach((v) {
        questions.add(Question.fromJson(v));
      });
    }
  }
}

class Question with ChangeNotifier {
  late String category;
  late String type;
  late String difficulty;
  late String question;
  late String correctAnswer;
  late List<String> allAnswers;

  Question(
    this.category,
    this.type,
    this.difficulty,
    this.question,
    this.correctAnswer,
  );

  Question.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    type = json['type'];
    difficulty = json['difficulty'];
    question = json['question'];
    correctAnswer = json['correct_answer'];
    allAnswers = json['incorrect_answers'].cast<String>();
    allAnswers.add(correctAnswer);
    allAnswers.shuffle();
  }

  @override
  String toString() {
    // TODO: implement toString
    return '{category: ${category},type:${type},difficulty:${difficulty},question:${question},correctAnswer:${correctAnswer},  allAnswers:${allAnswers}}';
  }
}
