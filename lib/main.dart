import 'package:flutter/material.dart';
import 'package:flutter_tutorial/result.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = [
    {
      'q': 'The economy is: ',
      'ans1': 'Strong',
      'ans2': 'Weak',
    },
    {
      'q': 'The economic outlook is: ',
      'ans1': 'Positive',
      'ans2': 'Negative',
    },
    {
      'q': 'Lenders are:  ',
      'ans1': 'Eager',
      'ans2': 'Reticent',
    },
  ];
  double _fontsize = 20;
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() =>_questionIndex += 1);
    //String ans =
  }

  int getQuestionIndex() {
    return _questionIndex;
  }

  void _reset() {
    setState(() {
      _questionIndex = 0;
    });
  }

  Widget q0(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(_questions[0]['q'].toString(),
                  style: TextStyle(fontSize: _fontsize)),
            ],
          ),
        ),
        Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              ElevatedButton(
                onPressed: _answerQuestion,
                child: Text(_questions[0]['ans1'].toString()),
              ),
              ElevatedButton(
                onPressed: _answerQuestion,
                child: Text(_questions[0]['ans2'].toString()),
              ),
            ]),
          ],
        ),
      ],
    );
  }

  Widget q1(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(_questions[1]['q'].toString(),
                  style: TextStyle(fontSize: _fontsize)),
            ],
          ),
        ),
        Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              ElevatedButton(
                onPressed: _answerQuestion,
                child: Text(_questions[1]['ans1'].toString()),
              ),
              ElevatedButton(
                onPressed: _answerQuestion,
                child: Text(_questions[1]['ans2'].toString()),
              ),
            ]),
          ],
        ),
      ],
    );
  }

  Widget q2(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(_questions[2]['q'].toString(),
                  style: TextStyle(fontSize: _fontsize)),
            ],
          ),
        ),
        Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              ElevatedButton(
                onPressed: _answerQuestion,
                child: Text(_questions[2]['ans1'].toString()),
              ),
              ElevatedButton(
                onPressed: _answerQuestion,
                child: Text(_questions[2]['ans2'].toString()),
              ),
            ]),
          ],
        ),
      ],
    );
  }

  Widget quiz(BuildContext context) {
    return Column(
      children: [
        q0(context),
        q1(context),
        q2(context),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Very good app'),
          ),
          body: ListView(
            padding: const EdgeInsets.all(10),
            children: [
              _questionIndex < _questions.length
                  ? Column(
                      //quiz
                      children: [quiz(context)],
                    )
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
