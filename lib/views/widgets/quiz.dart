import 'package:flutter/material.dart';
import 'result.dart';
import '../../data/constants.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  QuizState createState() => QuizState();
}

class QuizState extends State<Quiz> {
  var questionIndex = 0;

  int getQuestionIndex() {
    return questionIndex;
  }

  void answerQuestion() {
    setState(() => questionIndex += 1);
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
    return Container(
      padding: EdgeInsets.symmetric(vertical: 80),
      child: Column(
        children: [
          Row(
            children: [
              Text("Question: "),
              Text("${questionIndex + 1}/${questions.length}"),
            ],
          ),
          Text("${questions[questionIndex].getQuestion()}"),
          Row(
            children: [
              ElevatedButton(
                  onPressed: onPressed,
                  child: Text("${question[questionIndex].getAnswer1}")),
              ElevatedButton(
                  onPressed: onPressed,
                  child: Text("${question[questionIndex].getAnswer2}")),
            ],
          ),
        ],
      ),
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
