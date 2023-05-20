import 'package:flutter/material.dart';

import '../../custom_widgets/text.dart';

class Question extends StatelessWidget {
  final String questionText;

  const Question(this.questionText, {Key? key}) : super(key: key);

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

class QuestionHorizontal extends StatelessWidget {
  final String questionText;

  const QuestionHorizontal(this.questionText, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      child: CustomText(
        text: questionText,
        size: 23,
        alignCenter: true,
        thirdColor: true,
      ), //Text
    ); //Container
  }
}
