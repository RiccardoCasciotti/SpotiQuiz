import 'package:flutter/material.dart';
import 'package:spotify_quiz/custom_widgets/boxCustomPic.dart';
import 'package:spotify_quiz/custom_widgets/boxedWidget.dart';
import 'package:spotify_quiz/utilities.dart' as utilities;

import 'custom_widgets/text.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: utilities.secondaryColor,
      appBar: AppBar(
        backgroundColor: utilities.secondaryColor,
        foregroundColor: utilities.primaryColor,
        elevation: 0.0,
        title: const Text("Return Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Hero(
              tag: "profilePic",
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
                radius: 110,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomText(text: "Your statistics", size: 25),
                CustomBoxedWidget(
                  insideBox: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: "Correct Answers",
                            size: 30,
                          ),
                          CustomText(
                            text: "100%",
                            size: 35,
                            bold: true,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: "Wrong Answers",
                            size: 30,
                          ),
                          CustomText(
                            text: "89%",
                            size: 35,
                            bold: true,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: "Total Points",
                            size: 30,
                          ),
                          CustomText(
                            text: "70%",
                            size: 35,
                            bold: true,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomText(text: "Which artists you know the most", size: 25),
                CustomBoxedWidget(
                  insideBox: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: "Jessica Jones",
                            size: 30,
                          ),
                          CustomText(
                            text: "100%",
                            size: 35,
                            bold: true,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: "Ed Points",
                            size: 30,
                          ),
                          CustomText(
                            text: "89%",
                            size: 35,
                            bold: true,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: "Enrique Ilo",
                            size: 30,
                          ),
                          CustomText(
                            text: "70%",
                            size: 35,
                            bold: true,
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
    );
  }
}
