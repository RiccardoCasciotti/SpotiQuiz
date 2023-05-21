import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_quiz/custom_widgets/text.dart';
import 'package:spotify_quiz/utility/utilities.dart' as utilities;

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../authentication/bloc/authentication_bloc.dart';
import '../../../../models/user.dart';
import '../components/custom_navigation_rail.dart';

class RankingScreenTablet extends StatelessWidget {
  final void Function(int)? onItemTapped;
  final int selectedIndex;

  const RankingScreenTablet({
    Key? key,
    required this.onItemTapped,
    required this.selectedIndex,
  }) : super(key: const Key("TabletRankingPage"));

  @override
  Widget build(BuildContext context) {
    final rowsByNation = <TableRow>[];
    final rowsGlobal = <TableRow>[];

    for (User user in context.read<AuthenticationBloc>().userByNation) {
      rowsByNation.add(
        TableRow(
          children: <Widget>[
            CustomText(
              alignCenter: true,
              text: user.username,
              thirdColor: true,
              size: 18,
            ),
            CustomText(
              alignCenter: true,
              text: user.level.toString(),
              size: 18,
              thirdColor: true,
              bold: true,
            ),
            CustomText(
              alignCenter: true,
              text: user.bestScore.toString(),
              size: 18,
              bold: true,
            ),
          ],
        ),
      );
    }

    for (User user in context.read<AuthenticationBloc>().userGlobal) {
      rowsGlobal.add(
        TableRow(
          children: <Widget>[
            CustomText(
              alignCenter: true,
              text: user.username,
              thirdColor: true,
              size: 18,
            ),
            CustomText(
              alignCenter: true,
              text: user.level.toString(),
              size: 18,
              thirdColor: true,
              bold: true,
            ),
            CustomText(
              alignCenter: true,
              text: user.bestScore.toString(),
              size: 18,
              bold: true,
            ),
          ],
        ),
      );
    }

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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      const Flexible(
                        flex: 1,
                        child: SizedBox(
                          height: 50,
                        ),
                      ),
                      Flexible(
                        flex: 4,
                        child: CustomText(
                          key: const Key("TabletLocalRankingText"),
                          text: AppLocalizations.of(context)!.localranking,
                          size: 30,
                          bold: true,
                          thirdColor: true,
                        ),
                      ),
                      const Flexible(
                        flex: 1,
                        child: SizedBox(
                          height: 50,
                        ),
                      ),
                      Flexible(
                        flex: 16,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Container(
                            width: 300,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                border: Border.all(
                                  color: utilities.tertiaryColor,
                                  style: BorderStyle.solid,
                                  width: 0.1,
                                ),
                                shape: BoxShape.rectangle),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Table(
                                  key: const Key("TabletTableLocalRanking"),
                                  border: TableBorder.symmetric(),
                                  defaultVerticalAlignment:
                                      TableCellVerticalAlignment.middle,
                                  children: <TableRow>[
                                    TableRow(
                                      children: <Widget>[
                                        Container(
                                          alignment: Alignment.center,
                                          child: CustomText(
                                            key: const Key(
                                                "TabletUsernameLocalRanking"),
                                            text: AppLocalizations.of(context)!
                                                .usernameranking,
                                            thirdColor: true,
                                            size: 18,
                                            bold: true,
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          child: CustomText(
                                            key: const Key(
                                                "TabletLevelLocalRanking"),
                                            text: AppLocalizations.of(context)!
                                                .level,
                                            thirdColor: true,
                                            size: 18,
                                            bold: true,
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          child: CustomText(
                                            key: const Key(
                                                "TabletBestScoreLocalRanking"),
                                            text: AppLocalizations.of(context)!
                                                .bestscoreranking,
                                            thirdColor: true,
                                            size: 18,
                                            bold: true,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const TableRow(
                                      children: <Widget>[
                                        SizedBox(
                                          height: 20,
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                      ],
                                    ),
                                    for (TableRow row in rowsByNation) row
                                  ],
                                  defaultColumnWidth: const FlexColumnWidth(),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Flexible(
                        flex: 1,
                        child: SizedBox(
                          height: 50,
                        ),
                      ),
                      Flexible(
                        flex: 4,
                        child: CustomText(
                          key: const Key("TabletGlobalRankingText"),
                          text: AppLocalizations.of(context)!.globalranking,
                          size: 30,
                          bold: true,
                          thirdColor: true,
                        ),
                      ),
                      const Flexible(
                        flex: 1,
                        child: SizedBox(
                          height: 50,
                        ),
                      ),
                      Flexible(
                        flex: 16,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Container(
                            width: 300,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                border: Border.all(
                                  color: utilities.tertiaryColor,
                                  style: BorderStyle.solid,
                                  width: 0.1,
                                ),
                                shape: BoxShape.rectangle),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Table(
                                  key: const Key("TabletTableGlobalRanking"),
                                  border: TableBorder.symmetric(),
                                  defaultVerticalAlignment:
                                      TableCellVerticalAlignment.middle,
                                  children: <TableRow>[
                                    TableRow(
                                      children: <Widget>[
                                        Container(
                                          alignment: Alignment.center,
                                          child: CustomText(
                                            key: const Key(
                                                "TabletUsernameGlobalRanking"),
                                            text: AppLocalizations.of(context)!
                                                .usernameranking,
                                            thirdColor: true,
                                            size: 18,
                                            bold: true,
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          child: CustomText(
                                            key: const Key(
                                                "TabletLevelGlobalRanking"),
                                            text: AppLocalizations.of(context)!
                                                .level,
                                            thirdColor: true,
                                            size: 18,
                                            bold: true,
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          child: CustomText(
                                            key: const Key(
                                                "TabletBestScoreGlobalRanking"),
                                            text: AppLocalizations.of(context)!
                                                .bestscoreranking,
                                            thirdColor: true,
                                            size: 18,
                                            bold: true,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const TableRow(
                                      children: <Widget>[
                                        SizedBox(
                                          height: 20,
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                      ],
                                    ),
                                    for (TableRow row in rowsGlobal) row
                                  ],
                                  defaultColumnWidth: const FlexColumnWidth(),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
