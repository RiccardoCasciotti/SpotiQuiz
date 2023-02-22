// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:spotify_quiz/utility/utilities.dart' as utilities;

// ignore: must_be_immutable
class CustomBoxedWidget extends StatelessWidget {
  double sizeRadius;
  double widthRadius;
  Widget insideBox;
  bool thirdColor;

  CustomBoxedWidget({
    Key? key,
    this.widthRadius = 2.5,
    this.sizeRadius = 10.0,
    this.thirdColor = false,
    required this.insideBox,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: thirdColor ? utilities.tertiaryColor : utilities.primaryColor,
          width: widthRadius,
        ),
        borderRadius: BorderRadius.circular(sizeRadius),
      ),
      child: insideBox,
    );
  }
}
