// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:spotify_quiz/utility/utilities.dart' as utilities;

class CustomText extends StatelessWidget {
  String text;
  double size;
  bool bold;
  bool italic;
  bool alignCenter;
  bool secondColor;

  CustomText({
    Key? key,
    required this.text,
    required this.size,
    this.bold = false,
    this.italic = false,
    this.alignCenter = false,
    this.secondColor = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: alignCenter ? TextAlign.center : TextAlign.justify,
      style: TextStyle(
        fontStyle: italic ? FontStyle.italic : FontStyle.normal,
        fontSize: size,
        color: secondColor ? utilities.secondaryColor : utilities.primaryColor,
        fontWeight: bold ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}
