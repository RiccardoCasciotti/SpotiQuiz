// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:spotify_quiz/custom_widgets/boxedWidget.dart';
import 'package:spotify_quiz/utility/utilities.dart' as utilities;

import '../../custom_widgets/text.dart';

class GameInfoPage extends StatelessWidget {
  int selectedGame;

  GameInfoPage({
    Key? key,
    required this.selectedGame,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (selectedGame == 1) {
      return Scaffold(
        backgroundColor: utilities.secondaryColor,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
              Hero(
                tag: "game1",
                child: AspectRatio(
                  aspectRatio: 1.5,
                  child: Image.network(
                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              CustomBoxedWidget(
                insideBox: SizedBox(
                  width: 500,
                  child: Center(
                    child: CustomText(
                      text:
                          "Game mode with questions related to your favourite artists",
                      size: 25,
                      alignCenter: true,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          elevation: 0,
          onPressed: () {
            // Add your onPressed code here!
          },
          label: CustomText(
            text: "Play",
            size: 20,
            secondColor: true,
            bold: true,
          ),
          foregroundColor: utilities.secondaryColor,
          icon: const Icon(Icons.play_circle),
          backgroundColor: utilities.primaryColor,
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(2.5),
            side: BorderSide(
              color: utilities.primaryColor,
              width: 1.5,
              style: BorderStyle.solid,
            ),
          ),
          heroTag: null,
        ),
      );
    } else if (selectedGame == 2) {
      return Scaffold(
        backgroundColor: utilities.secondaryColor,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
              Hero(
                tag: "game2",
                child: AspectRatio(
                  aspectRatio: 1.5,
                  child: Image.network(
                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              CustomBoxedWidget(
                insideBox: SizedBox(
                  width: 500,
                  child: Center(
                    child: CustomText(
                      text:
                          "Game mode with questions related to your favourite songs",
                      size: 25,
                      alignCenter: true,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          elevation: 0,
          onPressed: () {
            // Add your onPressed code here!
          },
          label: CustomText(
            text: "Play",
            size: 20,
            secondColor: true,
            bold: true,
          ),
          foregroundColor: utilities.secondaryColor,
          icon: const Icon(Icons.play_circle),
          backgroundColor: utilities.primaryColor,
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(2.5),
            side: BorderSide(
              color: utilities.primaryColor,
              width: 1.5,
              style: BorderStyle.solid,
            ),
          ),
          heroTag: null,
        ),
      );
    } else if (selectedGame == 3) {
      return Scaffold(
        backgroundColor: utilities.secondaryColor,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
              Hero(
                tag: "game3",
                child: AspectRatio(
                  aspectRatio: 1.5,
                  child: Image.network(
                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              CustomBoxedWidget(
                insideBox: SizedBox(
                  width: 500,
                  child: Center(
                    child: CustomText(
                      text:
                          "Game mode with random questions, here to test your skills",
                      size: 25,
                      alignCenter: true,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          elevation: 0,
          onPressed: () {
            // Add your onPressed code here!
          },
          label: CustomText(
            text: "Play",
            size: 20,
            secondColor: true,
            bold: true,
          ),
          foregroundColor: utilities.secondaryColor,
          icon: const Icon(Icons.play_circle),
          backgroundColor: utilities.primaryColor,
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(2.5),
            side: BorderSide(
              color: utilities.primaryColor,
              width: 1.5,
              style: BorderStyle.solid,
            ),
          ),
          heroTag: null,
        ),
      );
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
