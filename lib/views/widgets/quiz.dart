import 'package:flutter/material.dart';
import '../../data/data.dart';
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

  int bullish = 0;

  void answerQuestionBull() {
    setState(() => questionIndex += 1);
    setState(() => bullish +=1);
  }
  void answerQuestionBear() {
    setState(() => questionIndex += 1);
    setState(() => bullish -=1);
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

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        alignment: Alignment.topLeft,
        child: BackButton(
          onPressed: _back,
        ),
      ),
      questionIndex < questions.length-1
      ?
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              const Text("Question: "),
              Text("${questionIndex + 1}/${questions.length}"),
            ],
          ),
          SizedBox(
            height: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("${questions[questionIndex]["q"]}",
                    style:
                        TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.green)),
                      onPressed: answerQuestionBull,
                      child: Text("${questions[questionIndex]["ans1"]}"),
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.red)),
                        onPressed: answerQuestionBear,
                        child: Text("${questions[questionIndex]["ans2"]}")),
                  ],
                ),
              ],
            ),
          ),
        ],
      )
          :
          Container(
            child: bullish < 0
                ? Text("Markets are bearsih")
                : Text("ITS A BULL MARKET")
          )
    ]);
  }
}
