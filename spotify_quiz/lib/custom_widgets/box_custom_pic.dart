// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:spotify_quiz/utility/utilities.dart' as utilities;

// ignore: must_be_immutable
class CustomContainerPic extends StatelessWidget {
  String picUrl;
  double sizeBorder;
  double height;
  double width;
  double circularity;
  bool withBorder;

  CustomContainerPic({
    Key? key,
    required this.picUrl,
    this.sizeBorder = 2.0,
    this.height = 200,
    this.width = 200,
    this.circularity = 100,
    this.withBorder = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(3.0),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            picUrl,
          ),
          fit: BoxFit.fill,
        ),
        border: withBorder
            ? Border.all(
                color: utilities.tertiaryColor,
                width: sizeBorder,
              )
            : const Border(),
        borderRadius: BorderRadius.circular(
          circularity,
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomContainerPicNetwork extends StatelessWidget {
  String picUrl;
  double sizeBorder;
  double height;
  double width;
  double circularity;
  bool withBorder;

  CustomContainerPicNetwork({
    Key? key,
    required this.picUrl,
    this.sizeBorder = 2.0,
    this.height = 200,
    this.width = 200,
    this.circularity = 100,
    this.withBorder = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(3.0),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            picUrl,
          ),
        ),
        border: withBorder
            ? Border.all(
                color: utilities.tertiaryColor,
                width: sizeBorder,
              )
            : const Border(),
        borderRadius: BorderRadius.circular(
          circularity,
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomBoxPic extends StatelessWidget {
  String picUrl;
  double sizeBorder;
  double height;
  double width;
  double circularity;
  bool withBorder;

  CustomBoxPic({
    Key? key,
    required this.picUrl,
    this.sizeBorder = 2.0,
    this.height = 200,
    this.width = 200,
    this.circularity = 100,
    this.withBorder = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Image.asset(
        picUrl,
      ),
    );
  }
}
