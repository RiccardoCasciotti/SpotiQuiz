// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:spotify_quiz/utility/utilities.dart' as utilities;

import '../../custom_widgets/text.dart';
import '../../quizPage/view/quiz_page.dart';
import '../../utility/transitions.dart';

// ignore: must_be_immutable
class PlayButton extends StatefulWidget {
  String selectedMode;

  PlayButton({
    required this.selectedMode,
    Key? key,
  }) : super(key: const Key("PlayButtonInfoPage"));

  @override
  State<PlayButton> createState() => _PlayButtonState();
}

class _PlayButtonState extends State<PlayButton> {
  bool _tapped = false;
  String _selectedMode = "";
  final animationDuration = const Duration(milliseconds: 50);

  @override
  void initState() {
    
    _tapped = false;
    _selectedMode = widget.selectedMode;
    super.initState();
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
        Future.delayed(animationDuration).then((_) {

          setState(() {
          _tapped = false;
        });

              Navigator.push(
                context,
                ScaleRoute(
                  page: QuizPage(
                    selectedMode: _selectedMode,
                  ),
                ),
              );
            });
      },
      label: CustomText(
        text: AppLocalizations.of(context)!.playbutton,
        size: 20,
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
