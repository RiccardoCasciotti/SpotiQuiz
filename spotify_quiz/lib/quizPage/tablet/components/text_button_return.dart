// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:spotify_quiz/custom_widgets/text.dart';
import 'package:spotify_quiz/utility/utilities.dart' as utilities;

// ignore: must_be_immutable
class TextButtonReturnTablet extends StatefulWidget {
  String text;
  Function selectHandler;

  TextButtonReturnTablet({
    Key? key,
    required this.selectHandler,
    required this.text,
  }) : super(key: key);
  @override
  State<TextButtonReturnTablet> createState() => _TextButtonReturnTabletState();
}

class _TextButtonReturnTabletState extends State<TextButtonReturnTablet> {
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
