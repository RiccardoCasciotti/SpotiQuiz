import 'package:flutter/material.dart';
import 'package:spotify_quiz/utility/utilities.dart' as utilities;

class Question extends StatelessWidget {
  final String questionText;

  const Question(this.questionText, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      child: Text(
        questionText,
        style: TextStyle(
          fontSize: 28,
          color: utilities.primaryColor,
        ),
        textAlign: TextAlign.center,
      ), //Text
    ); //Container
  }
}
