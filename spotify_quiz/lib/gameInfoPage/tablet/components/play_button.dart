import 'dart:async';

import 'package:flutter/material.dart';
import 'package:spotify_quiz/custom_widgets/text.dart';
import 'package:spotify_quiz/quizPage/tablet/view/quiz_page.dart';
import 'package:spotify_quiz/utility/transitions.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:spotify_quiz/utility/utilities.dart' as utilities;

class PlayButtonTablet extends StatefulWidget {
  const PlayButtonTablet({super.key});

  @override
  State<PlayButtonTablet> createState() => _PlayButtonTabletState();
}

class _PlayButtonTabletState extends State<PlayButtonTablet> {
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
                  page: const QuizPageTablet(),
                ),
              ).then(
                (value) => setState(() {
                  _tapped = false;
                }),
              ),
            });
      },
      label: CustomText(
        text: AppLocalizations.of(context)!.playbutton,
        size: 40,
        secondColor: true,
        bold: true,
      ),
      foregroundColor: utilities.secondaryColor,
      icon: const Icon(Icons.play_circle),
      backgroundColor:
          _tapped ? utilities.primaryColor : utilities.tertiaryColor,
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.circular(2.5),
      ),
      heroTag: null,
    );
  }
}
