import 'package:flutter/material.dart';
import './result.dart';
import './constants.dart';
import './quiz.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
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

  void _reset() {
    setState(() {
      questionIndex = 0;
    });
  }

  Widget q0(BuildContext context, var question) {
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
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(questionIndex < questions.length
                ? "Question " + questionIndex.toString()
                : "Great job"),
          ),
          body: ListView(
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
                    return q0(context, question);
                  })
                ],
              ) // main content
                  : Result(), // end page
            ],
          ),
          bottomNavigationBar: BottomAppBar(
            child: OverflowBar(
              children: [
                TextButton(onPressed: _reset, child: const Text("reset")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
