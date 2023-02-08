// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  String text;
  double size;
  bool bold;
  bool italic;

  CustomText({
    Key? key,
    required this.text,
    required this.size,
    this.bold = false,
    this.italic = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontStyle: italic ? FontStyle.italic : FontStyle.normal,
          fontSize: size,
          color: Color.fromARGB(255, 255, 255, 255),
          fontWeight: bold ? FontWeight.bold : FontWeight.normal),
    );
  }
}
