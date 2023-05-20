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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var correctAnswers = context.read<AuthenticationBloc>().user.correctAnswer;
    var wrongAnswers = context.read<AuthenticationBloc>().user.wrongAnswer;
    var bestScore = context.read<AuthenticationBloc>().user.bestScore;
    var experience = context.read<AuthenticationBloc>().user.experience;
    var nOfQuiz = context.read<AuthenticationBloc>().user.numberQuiz;

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
                        const CircleAvatar(
                          radius: 115,
                          backgroundImage: NetworkImage(
                              'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomText(
                          text: "Username",
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
                                text: "1",
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
                                text: "2300",
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
                              CustomText(
                                key: const Key("CorrectAnswerTextProfile"),
                                text:
                                    AppLocalizations.of(context)!.correctanswer,
                                thirdColor: true,
                                size: 20,
                              ),
                              CustomText(
                                key: const Key("CorrectAnswerInfoProfile"),
                                text: nOfQuiz != 0
                                    ? "${(100 * correctAnswers / (correctAnswers + wrongAnswers)).round()}%"
                                    : "0",
                                size: 25,
                              ),
                            ]),
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                CustomText(
                                  key: const Key("CorrectAnswerTextProfile"),
                                  text: AppLocalizations.of(context)!
                                      .correctanswer,
                                  thirdColor: true,
                                  size: 20,
                                ),
                                CustomText(
                                  key: const Key("CorrectAnswerInfoProfile"),
                                  text: nOfQuiz != 0
                                      ? "${(100 * correctAnswers / (correctAnswers + wrongAnswers)).round()}%"
                                      : "0",
                                  size: 25,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                CustomText(
                                  key: const Key("WrongAnswerTextProfile"),
                                  text:
                                      AppLocalizations.of(context)!.wronganswer,
                                  thirdColor: true,
                                  size: 20,
                                ),
                                CustomText(
                                  key: const Key("WrongAnswerInfoProfile"),
                                  text: nOfQuiz != 0
                                      ? "${(100 * wrongAnswers / (correctAnswers + wrongAnswers)).round()}%"
                                      : "0",
                                  size: 25,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                CustomText(
                                  key: const Key("ExperienceTextProfile"),
                                  text:
                                      AppLocalizations.of(context)!.experience,
                                  thirdColor: true,
                                  size: 20,
                                ),
                                CustomText(
                                  key: const Key("ExperienceInfoProfile"),
                                  text: experience.toString(),
                                  size: 25,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                CustomText(
                                  key: const Key("BestScoreTextProfile"),
                                  text: AppLocalizations.of(context)!.bestScore,
                                  thirdColor: true,
                                  size: 20,
                                ),
                                CustomText(
                                  key: const Key("BestScoreInfoProfile"),
                                  text: bestScore.toString(),
                                  size: 25,
                                ),
                              ],
                            ),
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
