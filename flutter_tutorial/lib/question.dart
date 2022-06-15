import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  String questionText = '';

  Question(String questionText) {
    this.questionText = questionText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.all(50),
        child: Text(
          questionText,
          style: TextStyle(fontSize: 28),
          textAlign: TextAlign.center,
        ));
  }
}
