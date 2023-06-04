// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:spotify_quiz/utility/utilities.dart' as utilities;
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class CustomText extends StatelessWidget {
  String text;
  double size;
  bool bold;
  bool italic;
  bool alignCenter;
  bool secondColor;
  bool thirdColor;
  bool wrongColor;

  CustomText({
    Key? key,
    required this.text,
    required this.size,
    this.bold = false,
    this.italic = false,
    this.alignCenter = false,
    this.secondColor = false,
    this.thirdColor = false,
    this.wrongColor = false,
    
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color colorTouse;

    if (secondColor) {
      colorTouse = utilities.secondaryColor;
    } else if (thirdColor) {
      colorTouse = utilities.tertiaryColor;
    } else if (wrongColor) {
      colorTouse = utilities.wrongAnswerColor;
    } else {
      colorTouse = utilities.primaryColor;
    }

    return Text(
      text,
      textAlign: alignCenter ? TextAlign.center : TextAlign.justify,
      style: GoogleFonts.openSans(
        fontSize: size,
        color: colorTouse,
        fontWeight: bold ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}
