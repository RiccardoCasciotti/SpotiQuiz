import 'package:flutter/material.dart';
import 'package:spotify_quiz/custom_widgets/text.dart';
import 'package:spotify_quiz/utility/utilities.dart' as utilities;

import '../../custom_widgets/bottom_nav_bar.dart';
import '../../custom_widgets/box_avatar_with_hero.dart';
import '../../custom_widgets/boxed_widgets.dart';
import '../../custom_widgets/custom_buttons.dart';
import '../../profilePage/view/setting_page_view.dart';

class HomeScreen extends StatelessWidget {
  final void Function(dynamic context)? firstButtonPressed;
  final void Function(dynamic context)? secondButtonPressed;
  final void Function(int)? onItemTapped;
  final int selectedIndex;

  const HomeScreen({
    Key? key,
    required this.firstButtonPressed,
    required this.secondButtonPressed,
    required this.onItemTapped,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: utilities.secondaryColor,
      body: Center(
        //body: LayoutBuilder TODO, see slides
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                CustomBoxAvatarWithHero(
                  picUrl:
                      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
                  tags: "profilePic",
                  newPage: const ProfilePage(),
                ),
                CustomBoxedWidget(
                  insideBox: CustomText(
                    text: "Username",
                    size: 25,
                  ),
                  sizeRadius: 20.0,
                  widthRadius: 2.0,
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomText(
                      text: "Level",
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
                      text: "#Quiz",
                      size: 30,
                    ),
                    CustomText(
                      text: "0",
                      size: 35,
                      bold: true,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomText(
                      text: "Best Score",
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
            CustomButtonsHome(
              firstButtonPressed: firstButtonPressed,
              secondButtonPressed: secondButtonPressed,
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavBar(
        selectedIndex: selectedIndex,
        onItemTapped: onItemTapped,
      ),
    );
  }
}
