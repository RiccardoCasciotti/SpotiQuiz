// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:spotify_quiz/custom_widgets/boxed_widgets.dart';
import 'package:spotify_quiz/custom_widgets/text.dart';
import 'package:spotify_quiz/gameInfoPage/tablet/view/info_screen.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:spotify_quiz/utility/utilities.dart' as utilities;

// ignore: must_be_immutable
class GameInfoPageTablet extends StatelessWidget {
  String selectedGame;

  GameInfoPageTablet({
    Key? key,
    required this.selectedGame,
  }) : super(key: const Key("TabletQuizPage"));

  @override
  Widget build(BuildContext context) {
    final pages = [
      GameInfoScreenTablet(
        key: Key("gameInfoPageA"),
        text: AppLocalizations.of(context)!.gameinfoartist,
        urlImage: 'assets/images/singer.jpg',
        selectedMode: selectedGame,
      ),
      GameInfoScreenTablet(
        key: Key("gameInfoPageB"),
        text: AppLocalizations.of(context)!.gameinfosong,
        urlImage: 'assets/images/mic.jpg',
        selectedMode: selectedGame,
      ),
      GameInfoScreenTablet(
        key: Key("gameInfoPageC"),
        text: AppLocalizations.of(context)!.gameinfoalbum,
        urlImage: 'assets/images/album.jpg',
        selectedMode: selectedGame,
      ),
      GameInfoScreenTablet(
        key: Key("gameInfoPageD"),
        text: AppLocalizations.of(context)!.gamesarabanda,
        urlImage: 'assets/images/sarabanda.jpg',
        selectedMode: selectedGame,
      ),
      GameInfoScreenTablet(
        key: Key("gameInfoPageR"),
        text: AppLocalizations.of(context)!.gameinfocasual,
        urlImage: 'assets/images/concert.jpg',
        selectedMode: selectedGame,
      ),
    ];

    if (selectedGame == "A") {
      return pages[0];
    }
    else if (selectedGame == "B") {
      return pages[1];
    } 
    else if (selectedGame == "C") {
      return pages[2];
    } 
    else if (selectedGame == "D") {
      return pages[3];
    } 
    else if (selectedGame == "R") {
      return pages[4];
    } 
     else {
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
