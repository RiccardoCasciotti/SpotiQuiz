// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:spotify_quiz/custom_widgets/text.dart';
import 'package:spotify_quiz/quizPage/components/text_button_return.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function returnHome;
  final Function moveOn;
  final int questionScore;

  const Result(
      this.resultScore, this.questionScore, this.returnHome, this.moveOn,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          CustomText(
            text: questionScore > 0
                ? AppLocalizations.of(context)!.correctanswerquiz
                : AppLocalizations.of(context)!.wronganswerquiz,
            size: 30,
            alignCenter: true,
            wrongColor: questionScore > 0 ? false : true,
            bold: true,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomText(
                text: AppLocalizations.of(context)!.scorequiz,
                size: 35,
                alignCenter: true,
                thirdColor: true,
                bold: true,
              ),
              CustomText(
                text: '$resultScore',
                size: 35,
                thirdColor: true,
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
                text: AppLocalizations.of(context)!.quitbutton,
                selectHandler: (_) => returnHome(),
              ),
              TextButtonReturn(
                text: AppLocalizations.of(context)!.continuebutton,
                selectHandler: (_) => moveOn(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
