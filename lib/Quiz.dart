import 'package:flutter/material.dart';
import './result.dart';
import './constants.dart';
import './Quiz.dart';
import './main.dart';

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  var questionIndex = 0;

  void answerQuestion() {
    setState(() => questionIndex += 1);
  }

  int getQuestionIndex() {
    return questionIndex;
  }

  void _back() {
    setState(() {
      questionIndex -= 1;
    });
  }

  void reset() {
    setState(() {
      questionIndex = 0;
    });
  }

  Widget quiz(BuildContext context, var question) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(question['q'].toString(),
                  style: TextStyle(fontSize: fontsize)),
            ],
          ),
        ),
        Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              ElevatedButton(
                onPressed: answerQuestion,
                child: Text(question['ans1'].toString()),
              ),
              ElevatedButton(
                onPressed: answerQuestion,
                child: Text(question['ans2'].toString()),
              ),
            ]),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(10),
      children: [
        Container(
          alignment: Alignment.topLeft,
          child: BackButton(
            onPressed: _back,
          ),
        ),
        questionIndex < questions.length
            ? Column(
                children: [
                  ...questions.map((var question) {
                    return quiz(context, question);
                  }),
                ],
              )
            : Result(),
      ],
    );
  }
}
