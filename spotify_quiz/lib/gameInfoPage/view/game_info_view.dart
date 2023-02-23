// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:spotify_quiz/custom_widgets/boxed_widgets.dart';
import 'package:spotify_quiz/gameInfoPage/view/info_screen.dart';
import 'package:spotify_quiz/utility/utilities.dart' as utilities;

import '../../custom_widgets/text.dart';

// ignore: must_be_immutable
class GameInfoPage extends StatelessWidget {
  int selectedGame;

  final pages = [
    GameInfoScreen(
        text: 'Game mode based on your favourite artists',
        urlImage:
            'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
    GameInfoScreen(
        text: 'Game mode based on your favourite songs',
        urlImage:
            'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
    GameInfoScreen(
        text: 'Game mode based on casual artists and songs',
        urlImage:
            'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
  ];

  GameInfoPage({
    Key? key,
    required this.selectedGame,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (selectedGame > 0 && selectedGame < 4) {
      return pages[selectedGame - 1];
    } else {
      return Scaffold(
        backgroundColor: utilities.secondaryColor,
        appBar: AppBar(
          backgroundColor: utilities.secondaryColor,
          foregroundColor: utilities.primaryColor,
          elevation: 0.0,
          title: const Text("Go back"),
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
