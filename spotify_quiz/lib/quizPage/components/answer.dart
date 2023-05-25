import 'package:flutter/material.dart';
import 'package:spotify_quiz/custom_widgets/text.dart';
import 'package:spotify_quiz/utility/utilities.dart' as utilities;

class Answer extends StatefulWidget {
  final Function selectHandler;
  final String answerText;
  final Function? playerStop;

  const Answer(this.selectHandler, this.answerText, this.playerStop, {Key? key})
      : super(key: key);

  @override
  State<Answer> createState() => _AnswerState();
}

class _AnswerState extends State<Answer> {
  bool _tapped = false;
  final animationDuration = const Duration(milliseconds: 50);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () async {
            
            setState(() {
              _tapped = true;
            });
            if( widget.playerStop != null){
              await  widget.playerStop!();
            }
            
            Future.delayed(animationDuration).then((_){
                 
                  widget.selectHandler();
                  
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
    );
  }
}

class AnswerHorizontal extends StatefulWidget {
  final Function selectHandler;
  final String answerText;
  final Function? playerStop;

  const AnswerHorizontal(this.selectHandler, this.answerText, this.playerStop,
      {Key? key})
      : super(key: key);

  @override
  State<AnswerHorizontal> createState() => _AnswerHorizontalState();
}

class _AnswerHorizontalState extends State<AnswerHorizontal> {
  bool _tapped = false;
  final animationDuration = const Duration(milliseconds: 50);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 380,
        height: 45,
        child: ElevatedButton(
          onPressed: () async {
            if (widget.playerStop != null) {
              await widget.playerStop!();
            }

            setState(() {
              _tapped = true;
            });
            Future.delayed(animationDuration).then((_) => {
                  widget.selectHandler(),
                });
          },
          style: ButtonStyle(
            backgroundColor: _tapped
                ? MaterialStateProperty.all(utilities.primaryColor)
                : MaterialStateProperty.all(utilities.tertiaryColor),
          ),
          child: CustomText(
            text: widget.answerText,
            size: 18,
            alignCenter: true,
            secondColor: true,
            bold: true,
          ),
        ),
      ),
    );
  }
}
