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
            Hero(
              tag: "profilePic",
              child: CustomContainerPic(
                picUrl:
                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
                height: 180.0,
                width: 180.0,
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomText(
                      text: "Right Answers",
                      size: 30,
                    ),
                    CustomText(
                      text: "1",
                      size: 35,
                      bold: true,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomText(
                      text: "Collected Points",
                      size: 30,
                    ),
                    CustomText(
                      text: "2000",
                      size: 35,
                      bold: true,
                    ),
                  ],
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
