import 'package:flutter/material.dart';
import 'package:spotify_quiz/custom_widgets/text.dart';
import 'package:spotify_quiz/utility/transitions.dart';
import 'package:spotify_quiz/utility/utilities.dart' as utilities;

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../custom_widgets/bottom_nav_bar.dart';
import '../../custom_widgets/box_custom_pic.dart';
import '../../gameInfoPage/view/game_info_view.dart';

// ignore: must_be_immutable
class QuizScreen extends StatelessWidget {
  void Function(int)? onItemTapped;
  int selectedIndex;
  QuizScreen({
    Key? key,
    required this.onItemTapped,
    required this.selectedIndex,
  }) : super(key: const Key("QuizPage"));

  @override
  Widget build(BuildContext context) {
    ImageProvider mic = const AssetImage("assets/images/mic.jpg");
    ImageProvider singer = const AssetImage("assets/images/singer.jpg");
    ImageProvider concert = const AssetImage("assets/images/concert.jpg");
    //List of widgets to populate the upper part.
    //It needs to be in the build because it uses a context to navigate through pages

    List<Widget> trialGames = [
      Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              ScaleRoute(
                page: GameInfoPage(selectedGame: "A"),
              ),
            ),
            child: Hero(
              tag: "gameA",
              child: CustomContainerPic(
                key: const Key("FirstQuizButton"),
                pic: singer,
                withBorder: true,
                width: 150,
                height: 150,
                circularity: 10,
              ),
            ),
          ),
          CustomText(
            key: const Key("FirstQuizText"),
            text: AppLocalizations.of(context)!.artist,
            size: 20,
            bold: true,
            italic: true,
            thirdColor: true,
          ),
        ],
      ),
      Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              ScaleRoute(
                page: GameInfoPage(selectedGame: "B"),
              ),
            ),
            child: Hero(
              tag: "gameB",
              child: CustomContainerPic(
                key: const Key("SecondQuizButton"),
                pic: mic,
                withBorder: true,
                width: 150,
                height: 150,
                circularity: 10,
              ),
            ),
          ),
          CustomText(
            key: const Key("SecondQuizText"),
            text: AppLocalizations.of(context)!.song,
            size: 20,
            bold: true,
            italic: true,
            thirdColor: true,
          ),
        ],
      ),
      Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              ScaleRoute(
                page: GameInfoPage(selectedGame: "C"),
              ),
            ),
            child: Hero(
              tag: "gameC",
              child: CustomContainerPic(
                key: const Key("ThirdQuizButton"),
                pic: concert,
                withBorder: true,
                width: 150,
                height: 150,
                circularity: 10,
              ),
            ),
          ),
          CustomText(
            key: const Key("ThirdQuizText"),
            text: AppLocalizations.of(context)!.casual,
            size: 20,
            bold: true,
            italic: true,
            thirdColor: true,
          ),
        ],
      ),
      Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              ScaleRoute(
                page: GameInfoPage(selectedGame: "D"),
              ),
            ),
            child: Hero(
              tag: "gameD",
              child: CustomContainerPic(
                key: const Key("ForthQuizButton"),
                pic: concert,
                withBorder: true,
                width: 150,
                height: 150,
                circularity: 10,
              ),
            ),
          ),
          CustomText(
            key: const Key("ForthQuizButton"),
            text: AppLocalizations.of(context)!.casual,
            size: 20,
            bold: true,
            italic: true,
            thirdColor: true,
          ),
        ],
      ),
      Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              ScaleRoute(
                page: GameInfoPage(selectedGame: "R"),
              ),
            ),
            child: Hero(
              tag: "gameR",
              child: CustomContainerPic(
                key: const Key("FifthQuizText"),
                pic: concert,
                withBorder: true,
                width: 150,
                height: 150,
                circularity: 10,
              ),
            ),
          ),
          CustomText(
            key: const Key("FifthQuizText"),
            text: AppLocalizations.of(context)!.casual,
            size: 20,
            bold: true,
            italic: true,
            thirdColor: true,
          ),
        ],
      ),
    ];

    return Scaffold(
      backgroundColor: utilities.secondaryColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 50,
            ),
            //UPPER PART WITH THE TYPE OF QUIZ
            Column(
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomText(
                          key: const Key("PresentationText"),
                          text: AppLocalizations.of(context)!.chooseaquiz,
                          size: 30.0,
                          bold: true,
                        ),
                      ],
                    ),
                  ],
                ),
                SingleChildScrollView(
                  key: const Key("GameList"),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: trialGames,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            //LOWER PART PANEL WITH FAVOURITE ARTISTS
            Column(
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomText(
                          key: const Key("ArtistText"),
                          text: AppLocalizations.of(context)!.yourfavartists,
                          size: 30.0,
                          bold: true,
                        ),
                      ],
                    ),
                  ],
                ),
                SingleChildScrollView(
                  key: const Key("ArtistList"),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: trialArtists,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavBar(
        selectedIndex: selectedIndex,
        onItemTapped: onItemTapped,
      ),
    );
  }

  //List of widgets done to populate the page at first

  List<Widget> trialArtists = [
    Column(
      textDirection: TextDirection.ltr,
      children: [
        CustomContainerPicNetwork(
          picUrl:
              'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
          withBorder: false,
          width: 150,
          height: 150,
        ),
        Container(
          alignment: Alignment.centerLeft,
          child: CustomText(
            text: "Peppe",
            size: 20,
            bold: true,
            alignCenter: false,
            thirdColor: true,
          ),
        ),
      ],
    ),
    Column(
      children: [
        CustomContainerPicNetwork(
          picUrl:
              'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
          withBorder: false,
          width: 150,
          height: 150,
        ),
        CustomText(
          text: "Peppe",
          size: 20,
          bold: true,
          thirdColor: true,
        ),
      ],
    ),
    Column(
      children: [
        CustomContainerPicNetwork(
          picUrl:
              'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
          withBorder: false,
          width: 150,
          height: 150,
        ),
        CustomText(
          text: "Peppe",
          size: 20,
          bold: true,
          thirdColor: true,
        ),
      ],
    ),
    Column(
      children: [
        CustomContainerPicNetwork(
          picUrl:
              'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
          withBorder: false,
          width: 150,
          height: 150,
        ),
        CustomText(
          text: "Peppe",
          size: 20,
          bold: true,
          thirdColor: true,
        ),
      ],
    ),
    Column(
      children: [
        CustomContainerPicNetwork(
          picUrl:
              'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
          withBorder: false,
          width: 150,
          height: 150,
        ),
        CustomText(
          text: "Peppe",
          size: 20,
          bold: true,
          thirdColor: true,
        ),
      ],
    ),
  ];
}
