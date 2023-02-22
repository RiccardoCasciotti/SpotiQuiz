import 'package:flutter/material.dart';
import 'package:spotify_quiz/custom_widgets/text.dart';
import 'package:spotify_quiz/utility/utilities.dart' as utilities;

class Answer extends StatefulWidget {
  final Function selectHandler;
  final String answerText;

  const Answer(this.selectHandler, this.answerText, {Key? key})
      : super(key: key);

  @override
  State<Answer> createState() => _AnswerState();
}

class _AnswerState extends State<Answer> {
  bool _tapped = false;
  final animationDuration = const Duration(milliseconds: 50);

  @override
  Widget build(BuildContext context) {
    // use SizedBox for white space instead of Container
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.infinity,
        height: 80,
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              _tapped = true;
            });
            Future.delayed(animationDuration).then((_) => {
                  widget.selectHandler().then(
                        (value) => setState(() {
                          _tapped = false;
                        }),
                      ),
                });
          },
          style: ButtonStyle(
            backgroundColor: _tapped
                ? MaterialStateProperty.all(utilities.primaryColor)
                : MaterialStateProperty.all(utilities.tertiaryColor),
          ),
          child: CustomText(
            text: widget.answerText,
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
