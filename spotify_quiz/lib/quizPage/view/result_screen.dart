// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:spotify_quiz/custom_widgets/text.dart';
import 'package:spotify_quiz/quizPage/components/text_button_return.dart';

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
          CustomText(
            text: resultPhrase,
            size: 30,
            alignCenter: true,
            wrongColor: questionScore > 0 ? false : true,
            bold: true,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomText(
                text: "Score:",
                size: 35,
                alignCenter: true,
                thirdColor: true,
                bold: true,
              ),
              CustomText(
                text: '$resultScore',
                size: 35,
                alignCenter: true,
                bold: true,
              ),
            ],
          ),
          //Text
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButtonReturn(
                text: 'Quit',
                selectHandler: (context) => returnHome(),
              ),
              TextButtonReturn(
                text: 'Continue',
                selectHandler: (context) => moveOn(),
              ),
            ],
          ),
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
