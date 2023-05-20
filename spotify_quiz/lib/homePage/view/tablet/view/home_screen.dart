import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_quiz/custom_widgets/text.dart';
import 'package:spotify_quiz/utility/utilities.dart' as utilities;

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../authentication/bloc/authentication_bloc.dart';
import '../components/custom_navigation_rail.dart';

class HomeScreenTablet extends StatelessWidget {
  final void Function(int)? onItemTapped;
  final int selectedIndex;

  const HomeScreenTablet({
    Key? key,
    required this.onItemTapped,
    required this.selectedIndex,
  }) : super(key: const Key("TabletHomePage"));

  @override
  Widget build(BuildContext context) {
    var correctAnswers = context.read<AuthenticationBloc>().user.correctAnswer;
    var wrongAnswers = context.read<AuthenticationBloc>().user.wrongAnswer;
    var bestScore = context.read<AuthenticationBloc>().user.bestScore;
    var experience = context.read<AuthenticationBloc>().user.experience;
    var nOfQuiz = context.read<AuthenticationBloc>().user.numberQuiz;
    var newlevelCap = ((experience / 200).floor() + 1) * 200;

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
                    const SizedBox(
                      height: 30,
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 115,
                          backgroundImage:
                              NetworkImage(utilities.imageUserProfile),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomText(
                          text:
                              context.read<AuthenticationBloc>().user.username,
                          thirdColor: true,
                          size: 25,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Table(
                      border: TableBorder.symmetric(),
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      children: <TableRow>[
                        TableRow(
                          children: <Widget>[
                            Container(
                              alignment: Alignment.center,
                              child: CustomText(
                                text: AppLocalizations.of(context)!.level,
                                thirdColor: true,
                                size: 30,
                                bold: true,
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: CustomText(
                                text: context
                                    .read<AuthenticationBloc>()
                                    .user
                                    .level
                                    .toString(),
                                size: 30,
                                bold: true,
                              ),
                            ),
                          ],
                        ),
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
                        TableRow(
                          children: <Widget>[
                            Container(
                              alignment: Alignment.center,
                              child: CustomText(
                                text: AppLocalizations.of(context)!.nofquiz,
                                size: 30,
                                thirdColor: true,
                                bold: true,
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: CustomText(
                                text: context
                                    .read<AuthenticationBloc>()
                                    .user
                                    .numberQuiz
                                    .toString(),
                                size: 30,
                                bold: true,
                              ),
                            ),
                          ],
                        ),
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
                      ],
                      columnWidths: const <int, TableColumnWidth>{
                        0: FixedColumnWidth(150),
                        1: FixedColumnWidth(150),
                      },
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomText(
                          text: AppLocalizations.of(context)!.statistics,
                          thirdColor: true,
                          size: 25,
                          bold: true,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Table(
                          children: <TableRow>[
                            TableRow(children: [
                              const SizedBox(
                                width: 5,
                              ),
                              CustomText(
                                key: const Key("CorrectAnswerTextProfile"),
                                alignCenter: true,
                                text:
                                    AppLocalizations.of(context)!.correctanswer,
                                thirdColor: true,
                                size: 25,
                              ),
                              CustomText(
                                key: const Key("CorrectAnswerInfoProfile"),
                                alignCenter: true,
                                text: nOfQuiz != 0
                                    ? "${(100 * correctAnswers / (correctAnswers + wrongAnswers)).round()}%"
                                    : "0",
                                size: 25,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                            ]),
                            TableRow(children: [
                              const SizedBox(
                                width: 10,
                              ),
                              CustomText(
                                key: const Key("WrongAnswerTextProfile"),
                                alignCenter: true,
                                text: AppLocalizations.of(context)!.wronganswer,
                                thirdColor: true,
                                size: 25,
                              ),
                              CustomText(
                                key: const Key("WrongAnswerInfoProfile"),
                                alignCenter: true,
                                text: nOfQuiz != 0
                                    ? "${(100 * wrongAnswers / (correctAnswers + wrongAnswers)).round()}%"
                                    : "0",
                                size: 25,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                            ]),
                            TableRow(children: [
                              const SizedBox(
                                width: 10,
                              ),
                              CustomText(
                                key: const Key("ExperienceTextProfile"),
                                alignCenter: true,
                                text: AppLocalizations.of(context)!.experience,
                                thirdColor: true,
                                size: 25,
                              ),
                              CustomText(
                                key: const Key("ExperienceInfoProfile"),
                                alignCenter: true,
                                text: "$experience/$newlevelCap",
                                size: 25,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                            ]),
                            TableRow(children: [
                              const SizedBox(
                                width: 10,
                              ),
                              CustomText(
                                key: const Key("BestScoreTextProfile"),
                                alignCenter: true,
                                text: AppLocalizations.of(context)!.bestScore,
                                thirdColor: true,
                                size: 25,
                              ),
                              CustomText(
                                key: const Key("BestScoreInfoProfile"),
                                alignCenter: true,
                                text: bestScore.toString(),
                                size: 25,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                            ]),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
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
}
