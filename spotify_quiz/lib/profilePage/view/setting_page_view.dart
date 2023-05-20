import 'package:flutter/material.dart';
import 'package:spotify_quiz/custom_widgets/boxed_widgets.dart';
import 'package:spotify_quiz/utility/utilities.dart' as utilities;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_quiz/authentication/bloc/authentication_bloc.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../custom_widgets/text.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    Key? key,
  }) : super(key: const Key("ProfilePage"));

  @override
  Widget build(BuildContext context) {
    var correctAnswers = context.read<AuthenticationBloc>().user.correctAnswer;
    var wrongAnswers = context.read<AuthenticationBloc>().user.wrongAnswer;
    var bestScore = context.read<AuthenticationBloc>().user.bestScore;
    var experience = context.read<AuthenticationBloc>().user.experience;
    var nOfQuiz = context.read<AuthenticationBloc>().user.numberQuiz;

    return Scaffold(
      backgroundColor: utilities.secondaryColor,
      appBar: AppBar(
        key: const Key("GoBackProfilePage"),
        backgroundColor: utilities.secondaryColor,
        foregroundColor: utilities.primaryColor,
        elevation: 0.0,
        title: Text(AppLocalizations.of(context)!.gobackbutton),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Hero(
                tag: "profilePic",
                child: CircleAvatar(
                  key: const Key("ProfilePicProfilePage"),
                  backgroundImage: NetworkImage(utilities.imageUserProfile),
                  radius: 125,
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomText(
                    key: const Key("StatisticsText"),
                    text: AppLocalizations.of(context)!.statistics,
                    thirdColor: true,
                    size: 25,
                    bold: true,
                  ),
                  CustomBoxedWidget(
                    thirdColor: true,
                    widthRadius: 0.1,
                    insideBox: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              key: const Key("CorrectAnswerTextProfile"),
                              text: AppLocalizations.of(context)!.correctanswer,
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              key: const Key("WrongAnswerTextProfile"),
                              text: AppLocalizations.of(context)!.wronganswer,
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              key: const Key("ExperienceTextProfile"),
                              text: AppLocalizations.of(context)!.experience,
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
