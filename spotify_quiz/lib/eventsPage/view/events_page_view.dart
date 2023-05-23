import 'package:flutter/material.dart';
import 'package:spotify_quiz/custom_widgets/text.dart';
import 'package:spotify_quiz/utility/utilities.dart' as utilities;

import '../../models/event.dart';

class EventsPage extends StatelessWidget {
  final List<Event> events;
  const EventsPage({
    required List<Event> this.events,
    Key? key,
  }) : super(key: const Key("EventPage"));


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
          itemCount: events.length,
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 12,
            );
          },
          itemBuilder: (context, index) {
            return buildCard(events[index]);
          },
        ));
  }
}

Widget buildCard(Event event) => ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Container(
        color: utilities.secondaryColor,
        child: CustomText(size: 10,text: event.event_name,)
      ),
    );
