import 'package:flutter/material.dart';
import 'package:spotify_quiz/custom_widgets/text.dart';
import 'package:spotify_quiz/gameInfoPage/tablet/components/play_button.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:spotify_quiz/utility/utilities.dart' as utilities;

// ignore: must_be_immutable
class GameInfoScreenTablet extends StatelessWidget {
  String urlImage;
  String text;
  String selectedMode;

  GameInfoScreenTablet({
    Key? key,
    required this.text,
    required this.urlImage,
    required this.selectedMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: utilities.secondaryColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        key: const Key("TabletGoBackInfoPage"),
        backgroundColor: utilities.secondaryColor,
        foregroundColor: utilities.primaryColor,
        elevation: 0.0,
        title: Text(AppLocalizations.of(context)!.gobackbutton),
      ),
      body: Container(
        key: const Key("TabletBackgroundImageInfoPage"),
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
            key: const Key("TabletInfoText"),
            thirdColor: true,
            text: text,
            size: 35,
            alignCenter: true,
            bold: true,
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        height: 250,
        width: 250,
        child: FittedBox(
          child: PlayButtonTablet( selectedMode: selectedMode,),
        ),
      ),
    );
  }
}
