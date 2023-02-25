import 'package:flutter/material.dart';
import 'package:spotify_quiz/custom_widgets/text.dart';

class QuestionTablet extends StatelessWidget {
  final String questionText;

  const QuestionTablet(this.questionText, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      child: CustomText(
        text: questionText,
        size: 28,
        alignCenter: true,
        thirdColor: true,
      ), //Text
    ); //Container
  }
}
