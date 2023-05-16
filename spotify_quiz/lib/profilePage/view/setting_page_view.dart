import 'package:flutter/material.dart';
import 'package:spotify_quiz/custom_widgets/boxed_widgets.dart';
import 'package:spotify_quiz/utility/utilities.dart' as utilities;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_quiz/authentication/bloc/authentication_bloc.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../custom_widgets/text.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    var correctAnswers = context.read<AuthenticationBloc>().user.correctAnswer;
    var wrongAnswers = context.read<AuthenticationBloc>().user.wrongAnswer;
    var bestScore = context.read<AuthenticationBloc>().user.bestScore;
    var experience = context.read<AuthenticationBloc>().user.experience;

    return Scaffold(
      backgroundColor: utilities.secondaryColor,
      appBar: AppBar(
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
                              text: AppLocalizations.of(context)!.correctanswer,
                              thirdColor: true,
                              size: 20,
                            ),
                            CustomText(
                              text:
                                  "${(100 * correctAnswers / (correctAnswers + wrongAnswers)).round()}%",
                              size: 25,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: AppLocalizations.of(context)!.wronganswer,
                              thirdColor: true,
                              size: 20,
                            ),
                            CustomText(
                              text:
                                  "${(100 * wrongAnswers / (correctAnswers + wrongAnswers)).round()}%",
                              size: 25,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: AppLocalizations.of(context)!.experience,
                              thirdColor: true,
                              size: 20,
                            ),
                            CustomText(
                              text: experience.toString(),
                              size: 25,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: AppLocalizations.of(context)!.bestScore,
                              thirdColor: true,
                              size: 20,
                            ),
                            CustomText(
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
