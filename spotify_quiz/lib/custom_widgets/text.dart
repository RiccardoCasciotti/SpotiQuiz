// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:spotify_quiz/utilities.dart' as utilities;

class CustomText extends StatelessWidget {
  String text;
  double size;
  bool bold;
  bool italic;

  CustomText({
    Key? key,
    required this.text,
    required this.size,
    this.bold = false,
    this.italic = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontStyle: italic ? FontStyle.italic : FontStyle.normal,
        fontSize: size,
        color: utilities.primaryColor,
        fontWeight: bold ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}
