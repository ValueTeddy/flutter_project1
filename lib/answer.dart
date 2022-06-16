import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final buttonHandler;
  final String answerText;

  Answer(this.buttonHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.green)),
        onPressed: buttonHandler,
        child: Text(answerText),
      ),
    );
  }
}
