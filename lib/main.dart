//package imports
import 'package:flutter/material.dart';

//file imports
import './question.dart';
import './answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
 

  final questions = const [
      {'questionText': 'What\'s your favourite color?',
        'answers': ['Black', 'Red', 'Green', 'White'],
      },
      {'questionText': 'What\'s your favourite animal?',
        'answers': ['Rabbit', 'Snake', 'Elephant', 'Lion'],
      },
      {'questionText': 'What\'s your favourite Instructor?',
        'answers': ['Max', 'Manuel', 'Sarah', 'Stephen'],
      },
      
    ];

     var _questionIndex = 0;

    void _answerQuestion() {

     
      
      setState(() {
        _questionIndex = _questionIndex + 1;
      });

      print(_questionIndex);

      if (_questionIndex < questions.length){
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
        body: _questionIndex < questions.length ? Column(
          children: [
            Question(questions[_questionIndex]['questionText']),
            
            ...(questions[_questionIndex]['answers'] as List<String>).map((answer) {

              return Answer(_answerQuestion, answer);
            }).toList()
            
          ],
        ) : Center(child: Text("You did it"),) ,
      ),
    );
  }
}
