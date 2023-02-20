import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spotify_quiz/custom_widgets/text.dart';
import 'package:spotify_quiz/utility/utilities.dart' as utilities;

import '../../custom_widgets/boxCustomPic.dart';

class EventsPage extends StatelessWidget {
  EventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: utilities.secondaryColor,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: AppBar(
          backgroundColor: utilities.secondaryColor,
          foregroundColor: utilities.primaryColor,
          elevation: 0.0,
          title: const Text("Go back"),
        ),
        body: ListView.separated(
          padding: const EdgeInsets.all(12),
          itemCount: 30,
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 12,
            );
          },
          itemBuilder: (context, index) {
            return buildCard(index);
          },
        ));
  }
}

Widget buildCard(int index) => ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        color: utilities.secondaryColor,
        child: Image.network(
            'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover),
      ),
    );
