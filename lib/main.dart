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
      'questionText':
          'Question 1 AA\n\n\AA\n\n\AA\n\n\AA\n\n\AAA\n\n\AAAAAAAAAAAAAAAAAAAAA',
      'answers': ['abc', '123', 'wow!'],
    },
    {
      'questionText': 'Question 2',
      'answers': ['abc', '123', 'yikes!'],
    },
    {
      'questionText': 'Question 3',
      'answers': ['abc', '123', 'hey!'],
    },
  ];

  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex += 1;
    });
  }

  int getQuestionIndex() {
    return _questionIndex;
  }

  void _reset() {
    setState(() {
      _questionIndex = 0;
    });
  }

  Widget quiz(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Container(
          child: Column(
            children: [
              Text(_questions[0]['questionText'].toString(),
                  style: TextStyle(fontSize: 28)),
              ElevatedButton(onPressed: _answerQuestion, child: Text('button')),
            ],
          ),
        ),
        Container(
          child: Column(
            children: [
              Text(_questions[1]['questionText'].toString(),
                  style: TextStyle(fontSize: 28)),
              ElevatedButton(onPressed: _answerQuestion, child: Text('button')),
            ],
          ),
        ),
        Container(
          child: Column(
            children: [
              Text(_questions[2]['questionText'].toString(),
                  style: TextStyle(fontSize: 28)),
              ElevatedButton(onPressed: _answerQuestion, child: Text('button')),
            ],
          ),
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
            title: const Text('Very good app'),
          ),
          body: ListView(
            padding: const EdgeInsets.all(10),
            children: [
              BackButton(
                onPressed: null,
              ),
              _questionIndex < _questions.length
                  ? Column(
                      //quiz
                      children: [quiz(context)],
                    )
                  : Result(), // end page
              BottomAppBar(
                child: Text("this is the bottom"),
              )
            ],
          ),
          bottomNavigationBar: BottomAppBar(
            child: OverflowBar(
              children: [
                TextButton(onPressed: _reset, child: const Text("reset")),
                const Text("this is a great app"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
