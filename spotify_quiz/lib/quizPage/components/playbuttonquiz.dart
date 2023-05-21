// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:spotify_quiz/utility/utilities.dart' as utilities;

import '../../custom_widgets/text.dart';
import '../../quizPage/view/quiz_page.dart';
import '../../utility/transitions.dart';

// ignore: must_be_immutable
class PlayButtonQuiz extends StatefulWidget {
  const PlayButtonQuiz({
    Key? key,
  }) : super(key: key);

  @override
  State<PlayButtonQuiz> createState() => _PlayButtonState();
}

class _PlayButtonState extends State<PlayButtonQuiz> {
  bool _tapped = false;
  final animationDuration = const Duration(milliseconds: 50);

  @override
  void initState() {
    super.initState();
    _tapped = false;
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return FloatingActionButton.extended(
      elevation: 0,
      onPressed: () {
        setState(() {
          _tapped = true;
        });
        Future.delayed(animationDuration).then((_) => {
              Navigator.push(
                context,
                ScaleRoute(
                  page: QuizPage(
                    selectedMode: "A",
                  ),
                ),
              ).then(
                (value) => setState(() {
                  _tapped = false;
                }),
              ),
            });
      },
      label: CustomText(
        text: AppLocalizations.of(context)!.playbuttonquiz,
        size: 20,
        secondColor: true,
        bold: true,
      ),
      foregroundColor: utilities.secondaryColor,
      icon: const Icon(Icons.play_circle),
      backgroundColor:
          _tapped ? utilities.primaryColor : utilities.tertiaryColor,
      heroTag: null,
    );
  }
}