// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:spotify_quiz/utilities.dart' as utilities;

class CustomContainerProfilePic extends StatelessWidget {
  String picUrl;
  double sizeBorder;

  CustomContainerProfilePic({
    Key? key,
    required this.picUrl,
    this.sizeBorder = 2.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(3.0),
      //padding: const EdgeInsets.all(1.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: utilities.primaryColor,
          width: sizeBorder,
        ),
      ),
      child: DecoratedBox(
        // add this
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              image: NetworkImage(
                  //It will be the String
                  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
              fit: BoxFit.cover),
        ),
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(20),
              width: 130.0,
              height: 130.0,
            ),
          ],
        ),
      ),
    );
  }
}
