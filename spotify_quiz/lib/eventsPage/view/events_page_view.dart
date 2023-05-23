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
    _events = _getCurrentPosition();
    super.initState();
    //List<Map<String, Object>> questions = [];
  }

  Future<Placemark> _getAddressFromLatLng(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position!.latitude, position!.longitude);

    Placemark place = placemarks[0];

    return place;
  }

  Future<List<dynamic>> _getCurrentPosition() async {
    // final hasPermission = await _handleLocationPermission();
    // if (!hasPermission) return;
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    _currentPosition = position;
    Placemark pos = await _getAddressFromLatLng(_currentPosition);
    var events = await get_events_on_position(pos.locality);
    _currentCity = "${pos.locality}";
    print(_currentCity);
    return events;
  }

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
        body: Center(
            child: FutureBuilder<List<dynamic>>(
                future: _events, // a previously-obtained Future<String> or null
                builder: (BuildContext context,
                    AsyncSnapshot<List<dynamic>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {
                      print("Error ${snapshot.error}");
                    }
                    if (snapshot.hasData) {
                      if (snapshot.data!.length == 0) {
                        return CustomText(
                            text: AppLocalizations.of(context)!.noevents,
                            size: 20);
                      }

                      return Center(
                          child: ListView.separated(
                            
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
                      ));
                    }
                  }

                  return PageTransitionSwitcher(
                    duration: const Duration(milliseconds: 500),
                    transitionBuilder: (child, animation, secondaryAnimation) =>
                        SharedAxisTransition(
                      animation: animation,
                      secondaryAnimation: secondaryAnimation,
                      fillColor: utilities.secondaryColor,
                      transitionType: SharedAxisTransitionType.horizontal,
                      child: child,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 60,
                          height: 60,
                          child: CircularProgressIndicator(),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: CustomText(
                            text: AppLocalizations.of(context)!.loadingevents,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  );
                })));
  }
}

Widget buildCard(Event event, BuildContext context) {
  return Container(
     //height: MediaQuery.of(context).size.height,
      //width: MediaQuery.of(context).size.width,
      child: Container(
          //padding: EdgeInsets.all(10.0),
          
          margin: EdgeInsets.all(3.0),
          decoration: BoxDecoration(
              color: Colors.white70,
              border: Border.all(
                  //color: Color.fromARGB(a, r, g, b)[500],
                  ),
              borderRadius: BorderRadius.all(Radius.circular(8))),
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Container(
              
                padding: EdgeInsets.all(10.0),
                height: 75,
                width: 75,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    event.image_url,
                    height: 75,
                    width: 75,

                    //fit: BoxFit.cover,
                  ),
                )),
            Container(
                margin: EdgeInsets.all(10.0),
                //width: double.infinity,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        padding: EdgeInsets.all(3.0),
                        child: SizedBox(
                            //width: double.infinity,
                            
                            height: 20,
                            child: AutoSizeText(
                            style: TextStyle(fontSize: 14),
                            
              maxLines: 2,
                            "Event:   ${event.event_name}",
                          )
                           ),
                          
                        ),
                        
                        Container(
                            padding: EdgeInsets.all(3.0),
                            child: Text(
                              selectionColor: Colors.black,
                              "Date:   ${event.startDate}",
                            )),
                    Container(
                        padding: EdgeInsets.all(3.0),
                        child: Text(
                          selectionColor: Colors.black,
                          "Venue:   ${event.venue_name}",
                        )),
                  ],
                ))
          ])));
}
