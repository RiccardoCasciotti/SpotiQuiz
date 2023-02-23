// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:spotify_quiz/utility/utilities.dart' as utilities;

// ignore: must_be_immutable
class CustomTextButton extends StatelessWidget {
  Function selectHandler;
  String buttonText;
  String onState;

  CustomTextButton({
    Key? key,
    required this.selectHandler,
    required this.buttonText,
    required this.onState,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // use SizedBox for white space instead of Container
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 80,
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
            buttonText,
            style: TextStyle(
                color: utilities.secondaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
        ),
      ),
    ); //Container
  }
}

// ignore: must_be_immutable
class CustomTextButtonResult extends StatelessWidget {
  Function selectHandler;
  String buttonText;

  CustomTextButtonResult({
    Key? key,
    required this.selectHandler,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // use SizedBox for white space instead of Container
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 135,
        child: ElevatedButton(
          onPressed: (() => selectHandler(context)),
          style: ElevatedButton.styleFrom(
            backgroundColor: utilities.primaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
          ),
          child: Text(
            buttonText,
            style: TextStyle(
              color: utilities.secondaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
        ),
      ),
    ); //Container
  }
}
