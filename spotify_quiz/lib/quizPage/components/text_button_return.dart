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

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

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
      width: 120,
      height: 120,
      child: FittedBox(
        child: FloatingActionButton(
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
          child: CustomText(
            text: widget.text,
            size: 10,
            secondColor: true,
            bold: true,
          ),
        ),
      ),
    );
  }
}
