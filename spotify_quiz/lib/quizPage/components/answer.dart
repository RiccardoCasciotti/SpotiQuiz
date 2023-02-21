import 'package:flutter/material.dart';
import 'package:spotify_quiz/custom_widgets/text.dart';
import 'package:spotify_quiz/utility/utilities.dart' as utilities;

class Answer extends StatelessWidget {
  final Function selectHandler;
  final String answerText;

  const Answer(this.selectHandler, this.answerText, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // use SizedBox for white space instead of Container
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.infinity,
        height: 80,
        child: ElevatedButton(
          onPressed: (() => selectHandler()),
          style: ButtonStyle(
            textStyle: MaterialStateProperty.all(
              TextStyle(color: utilities.secondaryColor),
            ),
            backgroundColor: MaterialStateProperty.all(utilities.primaryColor),
          ),
          child: CustomText(
            text: answerText,
            size: 20,
            alignCenter: true,
            secondColor: true,
            bold: true,
          ),
        ),
      ),
    ); //Container
  }
}
