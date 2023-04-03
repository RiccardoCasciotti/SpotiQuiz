// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:spotify_quiz/custom_widgets/boxed_widgets.dart';
import 'package:spotify_quiz/custom_widgets/text.dart';
import 'package:spotify_quiz/gameInfoPage/tablet/view/info_screen.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:spotify_quiz/utility/utilities.dart' as utilities;

// ignore: must_be_immutable
class GameInfoPageTablet extends StatelessWidget {
  int selectedGame;

  GameInfoPageTablet({
    Key? key,
    required this.selectedGame,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pages = [
      GameInfoScreenTablet(
          text: AppLocalizations.of(context)!.gameinfoartist,
          urlImage: 'assets/images/singer.jpg'),
      GameInfoScreenTablet(
          text: AppLocalizations.of(context)!.gameinfosong,
          urlImage: 'assets/images/mic.jpg'),
      GameInfoScreenTablet(
          text: AppLocalizations.of(context)!.gameinfocasual,
          urlImage: 'assets/images/concert.jpg'),
    ];
    if (selectedGame > 0 && selectedGame < 4) {
      return pages[selectedGame - 1];
    } else {
      return Scaffold(
        backgroundColor: utilities.secondaryColor,
        appBar: AppBar(
          backgroundColor: utilities.secondaryColor,
          foregroundColor: utilities.primaryColor,
          elevation: 0.0,
          title: Text(AppLocalizations.of(context)!.gobackbutton),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomBoxedWidget(
                insideBox: SizedBox(
                  width: 500,
                  child: Center(
                    child: CustomText(
                      text: "Error when pressing the game",
                      size: 25,
                      alignCenter: true,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
