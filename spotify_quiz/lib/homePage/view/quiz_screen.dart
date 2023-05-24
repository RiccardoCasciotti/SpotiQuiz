import 'package:flutter/material.dart';
import 'package:spotify_quiz/custom_widgets/text.dart';
import 'package:spotify_quiz/models/artist.dart';
import 'package:spotify_quiz/utility/transitions.dart';
import 'package:spotify_quiz/utility/utilities.dart' as utilities;

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../custom_widgets/bottom_nav_bar.dart';
import '../../custom_widgets/box_custom_pic.dart';
import '../../gameInfoPage/view/game_info_view.dart';
import '../../utility/api_calls.dart';

class QuizScreen extends StatefulWidget {
  void Function(int)? onItemTapped;

  int selectedIndex;
  QuizScreen({
    Key? key,
    required this.onItemTapped,
    required this.selectedIndex,
  }) : super(key: const Key("QuizPage"));

  @override
  QuizScreenState createState() => QuizScreenState();
}

class QuizScreenState extends State<QuizScreen> {
  @override
  Widget build(BuildContext context) {
    Future<List<Artist>> getArtists() async {
      return get_artist_quizpage();
      /*
    if (_artists.isNotEmpty) {
      _suggestedArtists = await get_related_artists(_artists[0].id);
    } else {
      _suggestedArtists = await get_related_artists("0TnOYISbd1XYRBk9myaseg");
    }
    for (Artist artist in _artists) {
      artistsList.add(
        Column(
          textDirection: TextDirection.ltr,
          children: [
            CustomContainerPicNetwork(
              picUrl: artist.images![1].url,
              withBorder: false,
              width: 150,
              height: 150,
            ),
            CustomText(
              text: artist.name,
              size: 18,
              alignCenter: true,
              thirdColor: true,
            ),
          ],
        ),
      );
      i++;
      if (i == 5) {
        return;
      }
    }
    if (i < 5) {
      for (Artist artist in _suggestedArtists) {
        artistsList.add(
          Column(
            textDirection: TextDirection.ltr,
            children: [
              CustomContainerPicNetwork(
                picUrl: artist.images![1].url,
                withBorder: false,
                width: 150,
                height: 150,
              ),
              CustomText(
                text: artist.name,
                size: 18,
                alignCenter: true,
                thirdColor: true,
              ),
            ],
          ),
        );
        i++;
        if (i == 5) {
          return;
        }
      }
    }*/
    }

    ImageProvider mic = const AssetImage("assets/images/mic.jpg");
    ImageProvider singer = const AssetImage("assets/images/singer.jpg");
    ImageProvider concert = const AssetImage("assets/images/concert.jpg");
    ImageProvider album = const AssetImage("assets/images/album.jpg");
    ImageProvider sarabanda = const AssetImage("assets/images/sarabanda.jpg");
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
                pic: album,
                withBorder: true,
                width: 150,
                height: 150,
                circularity: 10,
              ),
            ),
          ),
          CustomText(
            key: const Key("ThirdQuizText"),
            text: AppLocalizations.of(context)!.album,
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
                pic: sarabanda,
                withBorder: true,
                width: 150,
                height: 150,
                circularity: 10,
              ),
            ),
          ),
          CustomText(
            key: const Key("ForthQuizButton"),
            text: AppLocalizations.of(context)!.sarabanda,
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
          //mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 50,
            ),
            //UPPER PART WITH THE TYPE OF QUIZ
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
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
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
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
                FutureBuilder<List<Artist>>(
                    future: getArtists(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final artists = snapshot.data!;
                        List<Widget> artistsBox = [];
                        for (Artist artist in artists) {
                          artistsBox.add(
                            Column(
                              textDirection: TextDirection.ltr,
                              children: [
                                CustomContainerPicNetwork(
                                  picUrl: artist.images![1].url,
                                  withBorder: false,
                                  width: 150,
                                  height: 150,
                                ),
                                CustomText(
                                  text: artist.name,
                                  size: 18,
                                  alignCenter: true,
                                  thirdColor: true,
                                ),
                              ],
                            ),
                          );
                          i++;
                        }
                        return SingleChildScrollView(
                          key: const Key("GameList"),
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: artistsBox,
                          ),
                        );
                      } else {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            SizedBox(
                              width: 60,
                              height: 60,
                            ),
                            SizedBox(
                              width: 60,
                              height: 60,
                              child: CircularProgressIndicator(),
                            ),
                          ],
                        );
                      }
                    }),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavBar(
        selectedIndex: widget.selectedIndex,
        onItemTapped: widget.onItemTapped,
      ),
    );
  }

  Widget artistCard(Artist artist) {
    return Column(
      textDirection: TextDirection.ltr,
      children: [
        CustomContainerPicNetwork(
          picUrl: artist.images![1].url,
          withBorder: false,
          width: 150,
          height: 150,
        ),
        CustomText(
          text: artist.name,
          size: 20,
          bold: true,
          alignCenter: false,
          thirdColor: true,
        ),
      ],
    );
  }

  //List of widgets done to populate the page at first

}
