import 'package:flutter/material.dart';
import 'package:spotify_quiz/gameInfoPage/components/play_button.dart';
import 'package:spotify_quiz/utility/utilities.dart' as utilities;

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../custom_widgets/text.dart';

// ignore: must_be_immutable
class GameInfoScreen extends StatelessWidget {
  String urlImage;
  String text;
  String selectedMode;

  GameInfoScreen({
    Key? key,
    required this.text,
    required this.urlImage,
    required this.selectedMode,
  }) : super(key: const Key("GameInfoPage"));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: utilities.secondaryColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        key: const Key("GoBackButtonInfoPage"),
        backgroundColor: utilities.secondaryColor,
        foregroundColor: utilities.primaryColor,
        elevation: 0.0,
        title: Text(AppLocalizations.of(context)!.gobackbutton),
      ),
      body: Container(
        key: const Key("BackGroundImage"),
        constraints: const BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            opacity: 0.5,
            image: AssetImage(
              urlImage,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: CustomText(
            key: const Key("TextInfoPage"),
            thirdColor: true,
            text: text,
            size: 25,
            alignCenter: true,
            bold: true,
          ),
        ),
      ),
      floatingActionButton: PlayButton(
        selectedMode: selectedMode,
      ),
    );
  }
}
