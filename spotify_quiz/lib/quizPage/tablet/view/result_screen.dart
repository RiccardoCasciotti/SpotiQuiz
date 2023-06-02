// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:spotify_quiz/custom_widgets/text.dart';
import 'package:spotify_quiz/quizPage/components/text_button_return.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ResultTablet extends StatelessWidget {
  final int resultScore;
  final Function returnHome;
  final Function moveOn;
  final int questionScore;

  const ResultTablet(
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
            size: 60,
            alignCenter: true,
            wrongColor: questionScore > 0 ? false : true,
            bold: true,
          ),
          const SizedBox(
                height: 100,
              ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                width: 100,
              ),
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
          const SizedBox(
                height: 100,
              ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                width: 30,
              ),
              TextButtonReturn(
                text: AppLocalizations.of(context)!.quitbutton,
                selectHandler: (context) => returnHome(),
              ),
              const SizedBox(
                width: 100,
              ),
              TextButtonReturn(
                text: AppLocalizations.of(context)!.continuebutton,
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
