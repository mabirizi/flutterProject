import 'package:flutter/material.dart';

class Result extends StatelessWidget {

  final int totalScore;
  final Function resetQuiz;

  Result(this.totalScore, this.resetQuiz);

  String get resultPharse {

    String resultText;

    if (totalScore <= 8){
      resultText  = 'You are awesome and innocent';
    } else if (totalScore <= 14){
      resultText  = 'Pretty Likeale';
    } else if (totalScore <= 20){
      resultText  = 'You are strange';
    } else {
      resultText  = 'You are bad';
    }

    return resultText;

  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child:  Column(
        children: <Widget>[
          Text(resultPharse, 
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),

          FlatButton(child: Text('Restart Quiz'), onPressed:resetQuiz ,)
        ],
      ),
    );
  }
}