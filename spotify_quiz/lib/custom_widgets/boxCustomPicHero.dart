// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:spotify_quiz/utilities.dart' as utilities;

class CustomContainerPicHero extends StatelessWidget {
  String picUrl;
  double sizeBorder;
  double height;
  double width;
  double circularity;
  bool withBorder;
  String tag;
  Widget newPage;

  CustomContainerPicHero({
    Key? key,
    required this.picUrl,
    this.sizeBorder = 2.0,
    this.height = 200,
    this.width = 200,
    this.circularity = 100,
    this.withBorder = true,
    required this.tag,
    required this.newPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag,
      child: GestureDetector(
        child: Container(
          height: height,
          width: width,
          margin: const EdgeInsets.all(10.0),
          padding: const EdgeInsets.all(3.0),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(picUrl),
            ),
            border: withBorder
                ? Border.all(
                    color: utilities.primaryColor,
                    width: sizeBorder,
                  )
                : const Border(),
            borderRadius: BorderRadius.circular(circularity),
          ),
        ),
        onTap: () => Navigator.push(
            context,
            PageRouteBuilder(
                pageBuilder: ((context, animation, secondaryAnimation) =>
                    newPage))),
      ),
    );
  }
}
