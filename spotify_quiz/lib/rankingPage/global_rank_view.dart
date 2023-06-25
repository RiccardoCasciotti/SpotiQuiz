import 'package:flutter/material.dart';
import 'package:spotify_quiz/custom_widgets/text.dart';
import 'package:spotify_quiz/models/user.dart';
import 'package:spotify_quiz/utility/utilities.dart' as utilities;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_quiz/authentication/bloc/authentication_bloc.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../custom_widgets/bottom_nav_bar.dart';

class GlobalRankScreen extends StatelessWidget {
  final void Function(int)? onItemTapped;
  final int selectedIndex;

  const GlobalRankScreen({
    Key? key,
    required this.onItemTapped,
    required this.selectedIndex,
  }) : super(key: const Key("GlobalRankingPage"));

  @override
  Widget build(BuildContext context) {
    final rows = <TableRow>[];

    for (User user in context.read<AuthenticationBloc>().userGlobal) {
      rows.add(
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
      rows.add(
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

    return Scaffold(
      appBar: AppBar(
        key: const Key("GoBackButtonGlobalRanking"),
        backgroundColor: utilities.secondaryColor,
        foregroundColor: utilities.primaryColor,
        elevation: 0.0,
        title: Text(AppLocalizations.of(context)!.gobackbutton),
      ),
      backgroundColor: utilities.secondaryColor,
      body: Container(
        key: const Key("BackGroundImageGlobalRanking"),
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            opacity: 0.13,
            image: AssetImage(
              'assets/images/victorycup1.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            children: [
              Flexible(
                flex: 4,
                child: Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: double.infinity,
                  child: CustomText(
                    key: const Key("GlobalRankingText"),
                    text: AppLocalizations.of(context)!.globalranking,
                    size: 30,
                    bold: true,
                    thirdColor: true,
                  ),
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
                    width: 340,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(
                          color: utilities.tertiaryColor,
                          style: BorderStyle.solid,
                          width: 1,
                        ),
                        shape: BoxShape.rectangle),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Table(
                            key: const Key("TableGlobalRanking"),
                            border: TableBorder.symmetric(),
                            defaultVerticalAlignment:
                                TableCellVerticalAlignment.middle,
                            children: <TableRow>[
                              TableRow(
                                children: <Widget>[
                                  Container(
                                    alignment: Alignment.center,
                                    child: CustomText(
                                      key: const Key("UsernameGlobalRanking"),
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
                                      key: const Key("LevelGlobalRanking"),
                                      text: AppLocalizations.of(context)!.level,
                                      thirdColor: true,
                                      size: 18,
                                      bold: true,
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    child: CustomText(
                                      key: const Key("BestScoreGlobalRanking"),
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
                              for (TableRow row in rows) row
                            ],
                            defaultColumnWidth: const FlexColumnWidth(),
                          ),
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
        ),
      ),
      bottomNavigationBar: CustomNavBarRanking(
        selectedIndex: selectedIndex,
        onItemTapped: onItemTapped,
      ),
    );
  }
}
