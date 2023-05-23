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
      : super(key: const Key("ResultScreenPage"));

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CustomText(
                  key: const Key("ResultText"),
                  text: questionScore > 0
                      ? AppLocalizations.of(context)!.correctanswerquiz
                      : AppLocalizations.of(context)!.wronganswerquiz,
                  size: 30,
                  alignCenter: true,
                  wrongColor: questionScore > 0 ? false : true,
                  bold: true,
                ),
                const SizedBox(
                  height: 150,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
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
                      thirdColor: true,
                      alignCenter: true,
                      bold: true,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 150,
                ),
                //Text
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButtonReturn(
                      key: const Key("ReturnButton"),
                      text: AppLocalizations.of(context)!.quitbutton,
                      selectHandler: (_) => returnHome(),
                    ),
                    TextButtonReturn(
                      key: const Key("ContinueButton"),
                      text: AppLocalizations.of(context)!.continuebutton,
                      selectHandler: (_) => moveOn(),
                    ),
                  ],
                ),
              ],
            ),
          )
        : Center(
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
                const SizedBox(
                  height: 35,
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
                const SizedBox(
                  height: 35,
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
