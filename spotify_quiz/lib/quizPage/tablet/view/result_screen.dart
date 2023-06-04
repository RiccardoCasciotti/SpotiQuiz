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
      : super(key: const Key("ResultScreenPageTablet"));

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          CustomText(
            key: const Key("ResultText"),
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
                key: const Key("ScoreQuiz"),
                text: AppLocalizations.of(context)!.scorequiz,
                size: 35,
                alignCenter: true,
                thirdColor: true,
                bold: true,
              ),
              CustomText(
                key: const Key("ScoreQuizInfo"),
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
                key: const Key("ReturnButton"),
                text: AppLocalizations.of(context)!.quitbutton,
                selectHandler: (context) => returnHome(),
              ),
              const SizedBox(
                width: 100,
              ),
              TextButtonReturn(
                key: const Key("ContinueButton"),
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
