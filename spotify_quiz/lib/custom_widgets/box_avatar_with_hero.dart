// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomBoxAvatarWithHero extends StatelessWidget {
  String picUrl;
  double radius;
  String tags;
  Widget newPage;

  CustomBoxAvatarWithHero({
    Key? key,
    required this.picUrl,
    this.radius = 100,
    required this.tags,
    required this.newPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => newPage),
      ),
      child: Hero(
          tag: tags,
          child: CircleAvatar(
            radius: 100,
            backgroundImage: NetworkImage(picUrl),
          )),
    );
  }
}
