//package imports
import 'package:flutter/material.dart';

//file imports
import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favourite color?',
      'answers': [
        {'text':'Black', 'score': 10},
        {'text':'Red',  'score': 4},
        {'text':'Green', 'score': 7}, 
        {'text':'White', 'score': 4},
      ],
    },
    {
      'questionText': 'What\'s your favourite animal?',
      'answers': [
        {'text':'Rabbit', 'score': 10},
        {'text':'Snake','score': 5}, 
        {'text':'Elephant', 'score': 8},
        {'text':'Lion','score': 2},
        ],
    },
    {
      'questionText': 'What\'s your favourite Instructor?',
      'answers': [
        {'text':'Max', 'score': 10},
        {'text':'Manuel', 'score': 8},
        {'text':'Sarah', 'score': 6},
        {'text':'Stephen','score': 10},
        ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {

    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);

    if (_questionIndex < _questions.length) {
      print('we have more questions');
    } else {
      print("No more question");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions: _questions,
                questionIndex: _questionIndex,
              )
            : Result(
              _totalScore, _resetQuiz
            ),
      ),
    );
  }
}
