import 'package:flutter/material.dart';
import 'package:spotify_quiz/custom_widgets/text.dart';
import 'package:spotify_quiz/utility/utilities.dart' as utilities;

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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //List of widgets to populate the upper part.
    //It needs to be in the build because it uses a context to navigate through pages

    List<Widget> trialGames = [
      Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => GameInfoPage(selectedGame: 1),
              ),
            ),
            child: Hero(
              tag: "game1",
              child: CustomContainerPic(
                picUrl:
                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
                withBorder: true,
                width: 150,
                height: 150,
                circularity: 10,
              ),
            ),
          ),
          CustomText(
            text: "Artists",
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
              MaterialPageRoute(
                builder: (context) => GameInfoPage(selectedGame: 2),
              ),
            ),
            child: Hero(
              tag: "game2",
              child: CustomContainerPic(
                picUrl:
                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
                withBorder: true,
                width: 150,
                height: 150,
                circularity: 10,
              ),
            ),
          ),
          CustomText(
            text: "Songs",
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
              MaterialPageRoute(
                builder: (context) => GameInfoPage(
                  selectedGame: 3,
                ),
              ),
            ),
            child: Hero(
              tag: "game3",
              child: CustomContainerPic(
                picUrl:
                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
                withBorder: true,
                width: 150,
                height: 150,
                circularity: 10,
              ),
            ),
          ),
          CustomText(
            text: "Casual",
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            height: 20,
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
                        text: "Choose a quiz!",
                        size: 30.0,
                        bold: true,
                      ),
                    ],
                  ),
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: trialGames,
                ),
              ),
            ],
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
                        text: "Your favourite artists",
                        size: 30.0,
                        bold: true,
                      ),
                    ],
                  ),
                ],
              ),
              SingleChildScrollView(
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
        CustomContainerPic(
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
        CustomContainerPic(
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
        CustomContainerPic(
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
        CustomContainerPic(
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
        CustomContainerPic(
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
