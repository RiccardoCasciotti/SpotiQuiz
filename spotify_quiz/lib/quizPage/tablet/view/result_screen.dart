// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:spotify_quiz/custom_widgets/text.dart';
import 'package:spotify_quiz/quizPage/components/text_button_return.dart';

class ResultTablet extends StatelessWidget {
  final int resultScore;
  final Function returnHome;
  final Function moveOn;
  final int questionScore;

  const ResultTablet(
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
            size: 60,
            alignCenter: true,
            wrongColor: questionScore > 0 ? false : true,
            bold: true,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                width: 100,
              ),
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
                thirdColor: true,
                bold: true,
              ),
              const SizedBox(
                width: 100,
              ),
            ],
          ),
          //Text
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                width: 30,
              ),
              TextButtonReturn(
                text: 'Quit',
                selectHandler: (context) => returnHome(),
              ),
              TextButtonReturn(
                text: 'Continue',
                selectHandler: (context) => moveOn(),
              ),
              const SizedBox(
                width: 30,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
