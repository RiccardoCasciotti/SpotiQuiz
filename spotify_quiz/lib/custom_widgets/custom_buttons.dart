import 'package:flutter/material.dart';
import 'package:spotify_quiz/custom_widgets/text.dart';
import 'package:spotify_quiz/utility/utilities.dart' as utilities;

// ignore: must_be_immutable
class CustomButtonsHome extends StatelessWidget {
  void Function(dynamic context)? firstButtonPressed;
  void Function(dynamic context)? secondButtonPressed;

  CustomButtonsHome({
    Key? key,
    required this.firstButtonPressed,
    required this.secondButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: 16),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FloatingActionButton(
                  heroTag: null,
                  backgroundColor: utilities.primaryColor,
                  foregroundColor: utilities.secondaryColor,
                  onPressed: () {
                    firstButtonPressed!(context);
                  },
                  child: const Icon(Icons.emoji_events_outlined),
                ),
                CustomText(
                  text: "Ranking",
                  size: 20.0,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FloatingActionButton(
                  heroTag: null,
                  backgroundColor: utilities.primaryColor,
                  foregroundColor: utilities.secondaryColor,
                  onPressed: () {
                    secondButtonPressed!(context);
                  },
                  child: const Icon(Icons.star_outline_sharp),
                ),
                CustomText(
                  text: "Events",
                  size: 20.0,
                ),
              ],
            ),
            const SizedBox(width: 16),
          ],
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
class CustomButtonsQuiz extends StatelessWidget {
  void Function(dynamic context)? firstButtonPressed;
  void Function(dynamic context)? secondButtonPressed;

  CustomButtonsQuiz({
    Key? key,
    required this.firstButtonPressed,
    required this.secondButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: 16),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FloatingActionButton(
                  heroTag: null,
                  backgroundColor: utilities.primaryColor,
                  foregroundColor: utilities.secondaryColor,
                  onPressed: () {
                    firstButtonPressed!(context);
                  },
                  child: const Icon(Icons.home),
                ),
                CustomText(
                  text: "Return",
                  size: 20.0,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FloatingActionButton(
                  heroTag: null,
                  backgroundColor: utilities.primaryColor,
                  foregroundColor: utilities.secondaryColor,
                  onPressed: () {
                    secondButtonPressed!(context);
                  },
                  child: const Icon(Icons.arrow_forward_rounded),
                ),
                CustomText(
                  text: "Continue",
                  size: 20.0,
                ),
              ],
            ),
            const SizedBox(width: 16),
          ],
        ),
      ],
    );
  }
}
