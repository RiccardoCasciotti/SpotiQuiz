import 'package:flutter/material.dart';
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
          child: Text(
            answerText,
            style: TextStyle(
                color: utilities.secondaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
        ),

        // RaisedButton is deprecated and should not be used
        // Use ElevatedButton instead

        // child: RaisedButton(
        // color: const Color(0xFF00E676),
        // textColor: Colors.white,
        // onPressed: selectHandler(),
        // child: Text(answerText),
        // ), //RaisedButton
      ),
    ); //Container
  }
}
