// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:spotify_quiz/utility/utilities.dart' as utilities;

import '../../custom_widgets/custom_buttons.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function returnHome;
  final Function moveOn;
  final int questionScore;

  const Result(
      this.resultScore, this.questionScore, this.returnHome, this.moveOn,
      {Key? key})
      : super(key: key);

//Remark Logic
  String get resultPhrase {
    String resultText;
    if (questionScore > 0) {
      resultText = 'Correct Answer!';
    } else {
      resultText = 'Wrong Answer!';
      print(resultScore);
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: utilities.primaryColor),
            textAlign: TextAlign.center,
          ), //Text
          Text(
            'Score ' '$resultScore',
            style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: utilities.primaryColor),
            textAlign: TextAlign.center,
          ), //Text
          CustomButtonsQuiz(
            firstButtonPressed: (context) => returnHome(),
            secondButtonPressed: (context) => moveOn(),
          )
          // FlatButton is deprecated and should not be used
          // Use TextButton instead

          // FlatButton(
          // child: Text(
          //	 'Restart Quiz!',
          // ), //Text
          // textColor: Colors.blue,
          // onPressed: resetHandler(),
          // ), //FlatButton
        ], //<Widget>[]
      ), //Column
    ); //Center
  }
}
