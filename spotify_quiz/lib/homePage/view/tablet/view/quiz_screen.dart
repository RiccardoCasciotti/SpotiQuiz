import 'package:flutter/material.dart';
import 'package:spotify_quiz/custom_widgets/box_custom_pic.dart';
import 'package:spotify_quiz/custom_widgets/text.dart';
import 'package:spotify_quiz/gameInfoPage/tablet/view/game_info_view.dart';
import 'package:spotify_quiz/homePage/view/tablet/components/custom_navigation_rail.dart';
import 'package:spotify_quiz/utility/transitions.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:spotify_quiz/utility/utilities.dart' as utilities;

import '../../../../models/artist.dart';

// ignore: must_be_immutable
class QuizScreenTablet extends StatelessWidget {
  void Function(int)? onItemTapped;
  int selectedIndex;
  QuizScreenTablet({
    Key? key,
    required this.onItemTapped,
    required this.selectedIndex,
  }) : super(key: const Key("TabletQuizPage"));

  @override
  Widget build(BuildContext context) {
    ImageProvider mic = const AssetImage("assets/images/mic.jpg");
    ImageProvider singer = const AssetImage("assets/images/singer.jpg");
    ImageProvider concert = const AssetImage("assets/images/concert.jpg");
    ImageProvider album = const AssetImage("assets/images/album.jpg");
    ImageProvider sarabanda = const AssetImage("assets/images/sarabanda.jpg");

    List<Widget> trialGames = [
      Column(
        children: [
          GestureDetector(
            key: const Key("TabletGameA"),
            onTap: () => Navigator.push(
              context,
              ScaleRoute(
                page: GameInfoPageTablet(selectedGame: "A"),
              ),
            ),
            child: Hero(
              tag: "gameA",
              child: CustomContainerPic(
                pic: singer,
                withBorder: true,
                circularity: 10,
              ),
            ),
          ),
          CustomText(
            key: const Key("TabletGameAText"),
            text: AppLocalizations.of(context)!.artist,
            size: 20,
            bold: true,
            italic: true,
            thirdColor: true,
          ),
        ],
      ),
      const SizedBox(
        width: 50,
      ),
      Column(
        children: [
          GestureDetector(
            key: const Key("TabletGameB"),
            onTap: () => Navigator.push(
              context,
              ScaleRoute(
                page: GameInfoPageTablet(selectedGame: "B"),
              ),
            ),
            child: Hero(
              tag: "gameB",
              child: CustomContainerPic(
                pic: mic,
                withBorder: true,
                circularity: 10,
              ),
            ),
          ),
          CustomText(
            key: const Key("TabletGameBText"),
            text: AppLocalizations.of(context)!.song,
            size: 20,
            bold: true,
            italic: true,
            thirdColor: true,
          ),
        ],
      ),
      const SizedBox(
        width: 50,
      ),
      Column(
        children: [
          GestureDetector(
            key: const Key("TabletGameC"),
            onTap: () => Navigator.push(
              context,
              ScaleRoute(
                page: GameInfoPageTablet(selectedGame: "C"),
              ),
            ),
            child: Hero(
              tag: "gameC",
              child: CustomContainerPic(
                pic: album,
                withBorder: true,
                circularity: 10,
              ),
            ),
          ),
          CustomText(
            key: const Key("TabletGameCText"),
            text: AppLocalizations.of(context)!.album,
            size: 20,
            bold: true,
            italic: true,
            thirdColor: true,
          ),
        ],
      ),
      const SizedBox(
        width: 50,
      ),
      Column(
        children: [
          GestureDetector(
            key: const Key("TabletGameD"),
            onTap: () => Navigator.push(
              context,
              ScaleRoute(
                page: GameInfoPageTablet(selectedGame: "D"),
              ),
            ),
            child: Hero(
              tag: "gameD",
              child: CustomContainerPic(
                pic: sarabanda,
                withBorder: true,
                circularity: 10,
              ),
            ),
          ),
          CustomText(
            key: const Key("TabletGameDText"),
            text: AppLocalizations.of(context)!.sarabanda,
            size: 20,
            bold: true,
            italic: true,
            thirdColor: true,
          ),
        ],
      ),
      const SizedBox(
        width: 50,
      ),
      Column(
        children: [
          GestureDetector(
            key: const Key("TabletGameR"),
            onTap: () => Navigator.push(
              context,
              ScaleRoute(
                page: GameInfoPageTablet(selectedGame: "R"),
              ),
            ),
            child: Hero(
              tag: "gameR",
              child: CustomContainerPic(
                pic: concert,
                withBorder: true,
                circularity: 10,
              ),
            ),
          ),
          CustomText(
            key: const Key("TabletGameRText"),
            text: AppLocalizations.of(context)!.casual,
            size: 20,
            bold: true,
            italic: true,
            thirdColor: true,
          ),
        ],
      ),
      const SizedBox(
        width: 50,
      ),
    ];
    return Scaffold(
      backgroundColor: utilities.secondaryColor,
      body: Center(
        child: Row(
          children: [
            CustomNavRail(
              selectedIndex: selectedIndex,
              onItemTapped: onItemTapped,
            ),
            const VerticalDivider(
              thickness: 1,
              width: 1,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //UPPER PART WITH THE TYPE OF QUIZ
                    Column(
                      children: [
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CustomText(
                                  key: const Key("TabletPresentationText"),
                                  text:
                                      AppLocalizations.of(context)!.chooseaquiz,
                                  size: 30.0,
                                  bold: true,
                                ),
                              ],
                            ),
                          ],
                        ),
                        SingleChildScrollView(
                          key: const Key("TabletListGames"),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomText(
                          key: const Key("TabletArtistText"),
                          text: AppLocalizations.of(context)!.yourfavartists,
                          size: 30.0,
                          bold: true,
                        ),
                      ],
                    ),
                    //LOWER PART PANEL WITH FAVOURITE ARTISTS
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 15.0, 0.0, 0.0),
                      child: FutureBuilder<List<Artist>>(
                          future: utilities.artists,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              final artists = snapshot.data!;
                              List<Widget> artistsBox = [];
                              for (Artist artist in artists) {
                                artistsBox.add(
                                  Row(
                                    children: [
                                      CustomContainerPicNetwork(
                                        picUrl: artist.images![1].url,
                                        withBorder: false,
                                        width: 100,
                                        height: 100,
                                        circularity: 10,
                                      ),
                                      Flexible(
                                        fit: FlexFit.loose,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Align(
                                            alignment: MediaQuery.of(context)
                                                        .orientation !=
                                                    Orientation.portrait
                                                ? Alignment.centerLeft
                                                : Alignment.center,
                                            child: CustomTextTableTablet(
                                              text: artist.name,
                                              size: 20,
                                              alignCenter: true,
                                              thirdColor: true,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }
                              final artistsRow = <TableRow>[];

                              if (MediaQuery.of(context).orientation ==
                                  Orientation.portrait) {
                                for (int ind = 0;
                                    ind < artists.length / 2.floor();
                                    ind += 2) {
                                  artistsRow.add(
                                    TableRow(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              50, 0, 0, 0),
                                          child: artistsBox[ind],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 0, 0, 0),
                                          child: artistsBox[ind + 1],
                                        ),
                                      ],
                                    ),
                                  );
                                  artistsRow.add(
                                    const TableRow(
                                      children: <Widget>[
                                        SizedBox(
                                          height: 10,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  );
                                }
                              } else {
                                for (int ind = 0;
                                    ind < artists.length / 3.floor();
                                    ind += 3) {
                                  artistsRow.add(
                                    TableRow(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 0, 0, 0),
                                          child: artistsBox[ind],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 0, 0, 0),
                                          child: artistsBox[ind + 1],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 0, 0, 0),
                                          child: artistsBox[ind + 2],
                                        ),
                                      ],
                                    ),
                                  );
                                  artistsRow.add(
                                    const TableRow(
                                      children: <Widget>[
                                        SizedBox(
                                          height: 10,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  );
                                }
                              }

                              return SingleChildScrollView(
                                key: const Key("TabletArtistList"),
                                scrollDirection: Axis.vertical,
                                child: Table(
                                  key: const Key("TabletTableLocalRanking"),
                                  border: TableBorder.symmetric(),
                                  defaultVerticalAlignment:
                                      TableCellVerticalAlignment.middle,
                                  children: <TableRow>[
                                    for (TableRow row in artistsRow) row
                                  ],
                                  defaultColumnWidth: const FlexColumnWidth(),
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
                    ),
                    // Column(
                    //   children: [
                    //     Column(
                    //       children: [
                    //         Row(
                    //           mainAxisAlignment: MainAxisAlignment.start,
                    //           children: [
                    //             CustomText(
                    //               key: const Key("TabletArtistText"),
                    //               text: AppLocalizations.of(context)!
                    //                   .yourfavartists,
                    //               size: 30.0,
                    //               bold: true,
                    //             ),
                    //           ],
                    //         ),
                    //       ],
                    //     ),
                    //     SingleChildScrollView(
                    //       key: const Key("TabletArtistList"),
                    //       scrollDirection: Axis.horizontal,
                    //       child: Row(
                    //         children: trialArtists,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
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
