import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

// compile time constrant => const never change
// run time constrant => final change in runtime

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your best programming language',
      'answers': [
        {'text': 'Java', 'score': 1},
        {'text': 'JS', 'score': 2},
        {'text': 'PHP', 'score': 3}
      ],
    },
    {
      'questionText': 'What\'s your country',
      'answers': [
        {'text': 'USA', 'score': 1},
        {'text': 'UAE', 'score': 2},
        {'text': 'GBR', 'score': 3}
      ],
    }
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Hello'),
      ),
      body: _questionIndex < _questions.length
          ? Quiz(
              answerQuestion: _answerQuestion,
              questionIndex: _questionIndex,
              questions: _questions)
          : Result(_totalScore, _resetQuiz),
    ));
  }
}
