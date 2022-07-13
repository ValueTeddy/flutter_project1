import 'package:flutter/material.dart';

class QuestionModel{
  String question;
  String answer1;
  String answer2;

  QuestionModel({required this.question, required this.answer1, required this.answer2});

  void setQuestion(String getQuestion){
    question = getQuestion;
  }
  String getQuestion(){
    return question;
  }

  void setAnswer1(String getAnswer1){
    answer1 = getAnswer1;
  }

  String getAnswer1(){
    return answer1;
  }

  void setAnswer2(String getAnswer2){
    answer1 = getAnswer2;
  }

  String getAnswer2(){
    return answer1;
  }
}