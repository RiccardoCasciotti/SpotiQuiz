import 'package:animations/animations.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:spotify_quiz/custom_widgets/text.dart';
import 'package:spotify_quiz/utility/utilities.dart' as utilities;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../models/event.dart';
import '../../utility/api_calls.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({
    Key? key,
  }) : super(key: key);

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  late Position _currentPosition;
  String? _currentCity = "";
  final animationDuration = const Duration(milliseconds: 50);
  var _events;

  @override
  void initState() {
    _events = utilities.events_prefetch;
    super.initState();
    //List<Map<String, Object>> questions = [];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: const Key("BackGroundImageEvent"),
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
          opacity: 0.4,
          image: AssetImage(
            'assets/images/event.jpg',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: AppBar(
          backgroundColor: utilities.secondaryColor,
          foregroundColor: utilities.primaryColor,
          elevation: 0.0,
          title: const Text("Go back"),
        ),
        body: Center(
          key: const Key("eventFrame"),
          child: FutureBuilder<List<dynamic>>(
              future: _events, // a previously-obtained Future<String> or null
              builder: (BuildContext context,
                  AsyncSnapshot<List<dynamic>> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    print("Error ${snapshot.error}");
                  }
                  if (snapshot.hasData) {
                    if (snapshot.data!.isEmpty) {
                      return CustomText(
                          text: AppLocalizations.of(context)!.noevents,
                          size: 20);
                    }

                    return ListView.separated(
                      key: const Key("eventsList"),
                      padding: const EdgeInsets.all(12),
                      itemCount: snapshot.data!.length,
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 12,
                        );
                      },
                      itemBuilder: (context, index) {
                        return buildCard(snapshot.data![index], context);
                      },
                    );
                  }
                }

                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircularProgressIndicator(),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: CustomText(
                        text: AppLocalizations.of(context)!.loadingevents,
                        size: 20,
                      ),
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }
}

Widget buildCard(Event event, BuildContext context) {
  return Card(
    key: const Key("CardFrame"),
    elevation: 8.0,
    margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
    child: Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(3.0)),
          color: Colors.white),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        leading:
            Container(
              padding:const EdgeInsets.only(right: 12.0),
              decoration:  const BoxDecoration(
                  border:  Border(
                      right:  BorderSide(width: 1.0, color: Colors.black))),
              child: Stack(
                children: [
                  Image.asset(
                    "assets/images/eventPlaceholder.jpg",
                    scale: 1.5,
                  ),
                  Image.network(key: const Key("CardImage"), event.image_url, frameBuilder:
                      (BuildContext context, Widget child, int? frame,
                          bool wasSynchronouslyLoaded) {
                    if (wasSynchronouslyLoaded) {
                      return child;
                    }
                    return AnimatedOpacity(
                      opacity: frame == null ? 0 : 1,
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeOut,
                      child: child,
                    );
                  }, loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
                    return CircularProgressIndicator();
                  }),
                ],
              )),
        
        title: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            event.event_name,
            style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),

        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(event.venue_name,
                    style:  const TextStyle(color: Colors.black))),
            Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(event.startDate,
                    style: const TextStyle(color: Colors.black))),
          ],
        ),
      ),
    ),
  );

}
