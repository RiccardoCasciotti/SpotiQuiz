// ignore_for_file: non_constant_identifier_names, prefer_if_null_operators

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/intl.dart';
import 'package:random_x/random_x.dart';
import 'package:spotify_quiz/utility/quiz_utils.dart';
import 'package:spotify_quiz/utility/utilities.dart';

import '../models/models.dart' as model;
import 'package:http/http.dart' as http;
import 'package:spotify_quiz/utility/utilities.dart' as utilities;

String limit_albums = "20";
String market = 'IT';
int api_call = 0;

var i = 0;
List<model.Event> events_call = [];
bool events_api_called = false;

model.Event format_event(var eventJson){

  return model.Event(
    eventJson["description"], 
    eventJson["location"]["name"], 
    eventJson["name"],
    eventJson["startDate"],
    eventJson["endDate"],
    eventJson["image"],
    eventJson["location"]["geo"] != null ? eventJson["location"]["geo"]["latitude"]: null,
    eventJson["location"]["geo"] != null ? eventJson["location"]["geo"]["lognitude"]: null,
  );
}

Future<List<model.Event>> get_events_on_position(String? position) async {
 
  String eventsKey = dotenv.env['EVENTS_KEY']!;
  String eventsHost = dotenv.env['EVENTS_HOST']!;
  List<model.Event> events = [];
  
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    var today = DateTime.now();
    String minDate = formatter.format(DateUtils.dateOnly(today));
    String maxDate = formatter.format(DateUtils.dateOnly(DateTime(today.year, today.month, today.day + 14)));
    if( api_call< 11 && !events_api_called && position != null && position != ""){
      api_call++;
      print("NEW API CALL!!!!   NUM OF API CALLS: $api_call");
      
      events_api_called = true;
    final eventsInfo = await http.get(
        Uri.parse(
            "https://concerts-artists-events-tracker.p.rapidapi.com/location?name=$position&minDate=$minDate&maxDate=$maxDate&page=1"),
        headers: {'X-RapidAPI-Key': eventsKey, 'X-RapidAPI-Host': eventsHost});

   

    final eventsJson = json.decode(eventsInfo.body);
    //final eventsJson = json.decode('{"data":[{"@context":"http://schema.org","@type":"MusicEvent","description":"Daniele Silvestri at Teatro Lirico at 2023-05-22T21:00:00+0200","endDate":"2023-05-22","eventStatus":"https://schema.org/EventScheduled","image":"https://images.sk-static.com/images/media/profile_images/artists/519444/huge_avatar","location":{"@type":"Place","address":{"@type":"PostalAddress","addressCountry":"Italy","addressLocality":"Milan","postalCode":"20122","streetAddress":"Via Larga, 16"},"geo":{"@type":"GeoCoordinates","latitude":45.46134,"longitude":9.19166},"name":"Teatro Lirico","sameAs":null},"name":"Daniele Silvestri","performer":[{"@type":"MusicGroup","name":"Daniele Silvestri"}],"startDate":"2023-05-22T21:00:00+0200"}]}');
    for( var i = 0; i < (List.from(eventsJson["data"]).length < 20 ? List.from(eventsJson["data"]).length : 20); i++){
      print(List.from(eventsJson["data"])[i]);
      var curr_event = List.from(eventsJson["data"])[i];
      events.add(format_event(curr_event));
    }
    // print(eventsJson);
    // print(events.toString());
    events_call = events;
    }
   print("NUM OF API CALLS: $api_call");
return events_call;
}

List<model.Image> img_objs(List list) {
  List<model.Image> images = [];
  list = List.from(list);

  for (var i = 0; i < list.length; i++) {
    var tmp = list[i];

    model.Image img = model.Image(tmp["url"], tmp["height"], tmp["width"]);
    images.add(img);
  }
  return images;
}

model.Artist create_artist(var artistJson) {
  List<model.Image>? images = artistJson["images"] != null
      ? img_objs(List.from(artistJson["images"]))
      : null;

  var res = model.Artist(
    artistJson["id"],
    artistJson["name"],
    images != null ? images : null,
    artistJson["genres"] != null
        ? List<String>.from(artistJson["genres"])
        : null,
  );
  return res;
}

model.Album create_album(var albumJson) {
  List<model.Image>? images = albumJson["images"] != null
      ? img_objs(List.from(albumJson["images"]))
      : null;
  List<model.Artist> artists = [];

  for (var i = 0; i < List.from(albumJson["artists"]).length; i++) {
    var curr_artist = List.from(albumJson["artists"])[i];

    final res = create_artist(curr_artist);
    artists.add(res);
  }

  var res = model.Album(
    albumJson["id"],
    albumJson["name"],
    images != null ? images : null,
    artists,
    DateTime.parse(albumJson["release_date"]),
    albumJson["release_date_precision"],
  );
  return res;
}

Future<List<model.Artist>> get_related_artists(String artist_id) async {
  accessToken = await getAccessToken();

  final artistsInfo = await http.get(
      Uri.parse(
          "https://api.spotify.com/v1/artists/$artist_id/related-artists"),
      headers: {
        "Authorization": 'Authorization: Bearer $accessToken',
        "content-type": "application/x-www-form-urlencoded"
      });

  final artistsJson = json.decode(artistsInfo.body);
  List<model.Artist> artists = [];
  for (var i = 0; i < List.from(artistsJson["artists"]).length; i++) {
    var curr_artist = List.from(artistsJson["artists"])[i];

    final res = create_artist(curr_artist);
    artists.add(res);
  }

  return artists;
}

Future<List<model.Album>> get_artist_albums(String artist_id) async {
  accessToken = await getAccessToken();
  const market = "IT";

  final albumsInfo = await http.get(
      Uri.parse(
          "https://api.spotify.com/v1/artists/$artist_id/albums?market=$market&limit=$limit_albums"),
      headers: {
        "Authorization": 'Authorization: Bearer $accessToken',
        "content-type": "application/x-www-form-urlencoded"
      });

  final albumsJson = json.decode(albumsInfo.body);
  List<model.Album> albums = [];
  for (var i = 0; i < List.from(albumsJson["items"]).length; i++) {
    var curr_album = List.from(albumsJson["items"])[i];
    final res = create_album(curr_album);
    albums.add(res);
  }

  return albums;
}

Future<List<model.Artist>> get_followed_artists() async {
  accessToken = await getAccessToken();

  final artistsInfo = await http.get(
      Uri.parse("https://api.spotify.com/v1/me/following?type=artist"),
      headers: {
        "Authorization": 'Authorization: Bearer $accessToken',
        "content-type": "application/x-www-form-urlencoded"
      });

  final artistsJson = json.decode(artistsInfo.body);

  List<model.Artist> artists = [];
  for (var i = 0; i < List.from(artistsJson["artists"]["items"]).length; i++) {
    var curr_artist = List.from(artistsJson["artists"]["items"])[i];

    final res = create_artist(curr_artist);
    artists.add(res);
  }

  return artists;
}

Future<model.Artist> get_artist(String artist_id) async {
  accessToken = await getAccessToken();

  // ######################################### Insert here to test
  // if( i == 0 ){
  // ignore: unused_local_variable
  //var tmp = await generate_quiz("R");
  //   i++;
  // }

  final artistInfo = await http.get(
      Uri.parse("https://api.spotify.com/v1/artists/$artist_id"),
      headers: {
        "Authorization": 'Authorization: Bearer $accessToken',
        "content-type": "application/x-www-form-urlencoded"
      });
  final artistJson = json.decode(artistInfo.body);
  return create_artist(artistJson);
}

model.Track track_format(track) {
  List<model.Image> images = img_objs(List.from(track["album"]["images"]));

  List<model.Artist> artists = [];
  for (var i = 0; i < (track["artists"]).length; i++) {
    var tmp = track["artists"][i];

    model.Artist artist = create_artist(
        tmp); // check if the fields which are null don't cause problems
    artists.add(artist);
  }

  return model.Track(
      track['id'], track['name'], images, artists, track['preview_url']);
}

Future<List<model.Track>> get_top_tracks(String artist_id) async {
  accessToken = await getAccessToken();

  final tracksInfo = await http.get(
      Uri.parse(
          "https://api.spotify.com/v1/artists/$artist_id/top-tracks?market=$market"),
      headers: {
        "Authorization": 'Authorization: Bearer $accessToken',
        "content-type": "application/x-www-form-urlencoded"
      });

  final tracksJson = json.decode(tracksInfo.body);

  List<model.Track> tracks = [];

  for (var i = 0; i < List.from(tracksJson["tracks"]).length; i++) {
    var tmp = List.from(tracksJson["tracks"])[i];

    model.Track track = track_format(tmp);

    tracks.add(track);
  }
  return tracks;
}
