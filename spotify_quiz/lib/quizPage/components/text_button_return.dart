// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:spotify_quiz/utility/utilities.dart' as utilities;

import '../../custom_widgets/text.dart';

// ignore: must_be_immutable
class TextButtonReturn extends StatefulWidget {
  String text;
  Function selectHandler;

  TextButtonReturn({
    Key? key,
    required this.selectHandler,
    required this.text,
  }) : super(key: key);
  @override
  State<TextButtonReturn> createState() => _TextButtonReturnState();
}

class _TextButtonReturnState extends State<TextButtonReturn> {
  bool _tapped = false;
  final animationDuration = const Duration(milliseconds: 50);

  @override
  void initState() {
    super.initState();
    _tapped = false;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 120,
      child: FloatingActionButton(
        shape: const BeveledRectangleBorder(
            borderRadius: BorderRadius.all(Radius.elliptical(4, 4))),
        elevation: 0,
        onPressed: () {
          setState(() {
            _tapped = true;
          });
          Future.delayed(animationDuration)
              .then((_) => widget.selectHandler(context));
        },
        foregroundColor: utilities.secondaryColor,
        backgroundColor:
            _tapped ? utilities.primaryColor : utilities.tertiaryColor,
        heroTag: null,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomText(
            text: widget.text,
            size: 20,
            secondColor: true,
            bold: true,
          ),
        ),
      ),
    );
  }
}
