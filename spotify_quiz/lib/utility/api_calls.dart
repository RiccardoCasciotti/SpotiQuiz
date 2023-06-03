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

model.Event format_event(var eventJson) {
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  final tmp = DateTime.parse(eventJson["startDate"]);
  final startDate = formatter
      .format(DateUtils.dateOnly(DateTime.parse(eventJson["startDate"])));
  final endDate = formatter
      .format(DateUtils.dateOnly(DateTime.parse(eventJson["endDate"])));

  print(startDate);
  // final startDate = "";
  // final endDate = "";
  return model.Event(
    eventJson["description"],
    eventJson["location"]["name"],
    eventJson["name"],
    startDate,
    endDate,
    eventJson["image"],
    eventJson["location"]["geo"] != null
        ? eventJson["location"]["geo"]["latitude"]
        : null,
    eventJson["location"]["geo"] != null
        ? eventJson["location"]["geo"]["lognitude"]
        : null,
  );
}

Future<List<model.Event>> get_events_on_position(String? position) async {
  String eventsKey = dotenv.env['EVENTS_KEY']!;
  String eventsHost = dotenv.env['EVENTS_HOST']!;
  List<model.Event> events = [];
  bool fake_api = true;

  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  var today = DateTime.now();

  String minDate = formatter.format(DateUtils.dateOnly(today));
  String maxDate = formatter.format(
      DateUtils.dateOnly(DateTime(today.year, today.month, today.day + 14)));
  if (fake_api) {
    final eventsJson = fake_event_api_call();

    for (var i = 0;
        i <
            (List.from(eventsJson["data"]).length < 20
                ? List.from(eventsJson["data"]).length
                : 20);
        i++) {
      var curr_event = List.from(eventsJson["data"])[i];
      events.add(format_event(curr_event));
    }
    // print(eventsJson);
    // print(events.toString());
    events_call = events;
  } else if (api_call < 11 &&
      !events_api_called &&
      position != null &&
      position != "") {
    api_call++;
    print("NEW API CALL!!!!   NUM OF API CALLS: $api_call");

    events_api_called = true;
    final eventsInfo = await http.get(
        Uri.parse(
            "https://concerts-artists-events-tracker.p.rapidapi.com/location?name=$position&minDate=$minDate&maxDate=$maxDate&page=1"),
        headers: {'X-RapidAPI-Key': eventsKey, 'X-RapidAPI-Host': eventsHost});

    final eventsJson = json.decode(eventsInfo.body);
    //final eventsJson = json.decode('{"data":[{"@context":"http://schema.org","@type":"MusicEvent","description":"Daniele Silvestri at Teatro Lirico at 2023-05-22T21:00:00+0200","endDate":"2023-05-22","eventStatus":"https://schema.org/EventScheduled","image":"https://images.sk-static.com/images/media/profile_images/artists/519444/huge_avatar","location":{"@type":"Place","address":{"@type":"PostalAddress","addressCountry":"Italy","addressLocality":"Milan","postalCode":"20122","streetAddress":"Via Larga, 16"},"geo":{"@type":"GeoCoordinates","latitude":45.46134,"longitude":9.19166},"name":"Teatro Lirico","sameAs":null},"name":"Daniele Silvestri","performer":[{"@type":"MusicGroup","name":"Daniele Silvestri"}],"startDate":"2023-05-22T21:00:00+0200"}]}');
    for (var i = 0;
        i <
            (List.from(eventsJson["data"]).length < 20
                ? List.from(eventsJson["data"]).length
                : 20);
        i++) {
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
  if (!List.from(artistsJson["artists"]).isEmpty) {
    for (var i = 0; i < List.from(artistsJson["artists"]).length; i++) {
      var curr_artist = List.from(artistsJson["artists"])[i];

      final res = create_artist(curr_artist);
      artists.add(res);
    }
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
  if (!List.from(albumsJson["items"]).isEmpty) {
    for (var i = 0; i < List.from(albumsJson["items"]).length; i++) {
      var curr_album = List.from(albumsJson["items"])[i];
      if (curr_album["release_date_precision"] != "day") {
        continue;
      }
      final res = create_album(curr_album);

      albums.add(res);
    }
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

Future<List<model.Artist>> get_artist_quizpage() async {
  accessToken = await getAccessToken();
  List<model.Artist> followed_artists = [];
  List<model.Artist> similar_artists = [];
  String similar_id = "0TnOYISbd1XYRBk9myaseg";
  String initializer_id = "0TnOYISbd1XYRBk9myaseg";

  List<model.Artist> consume_followed_artists = [];
  List<model.Artist> consume_similar_artists = [];

  int similar_index = 0;
  int i = 0;
  int count = 0;

  Future<void> init_data() async {
    if (followed_artists.isEmpty && i == 0) {
      followed_artists = await get_followed_artists();
      if (followed_artists.isNotEmpty) {
        consume_followed_artists = followed_artists;
        consume_followed_artists.shuffle();
      }

      i++;
    }

    if (consume_similar_artists.length < 4) {
      var candidate;

      if (followed_artists.isNotEmpty) {
        candidate = followed_artists.last;
        followed_artists.removeLast();
      } else if (similar_artists.isNotEmpty) {
        candidate = similar_artists.last;
        similar_artists.removeLast();
      } else if (similar_artists.isEmpty) {
        similar_artists = await get_related_artists(similar_id);
        similar_artists = similar_artists.sublist(
            0, similar_artists.length < 30 ? similar_artists.length : 30);
        similar_artists.shuffle();
        candidate = similar_artists.last;
        similar_artists.removeLast();
      }
      similar_id = candidate.id;

      consume_similar_artists = await get_related_artists(similar_id);

      consume_similar_artists = consume_similar_artists.sublist(
          0,
          consume_similar_artists.length < 30
              ? consume_similar_artists.length
              : 30);
      while (consume_similar_artists.length < 4 && count < 10) {
        count++;
        await init_data();
      }
      if (count == 10) {
        similar_id = initializer_id;
        count = 0;
        await init_data();
      }
    }
  }

  await init_data();
  return consume_similar_artists;
}

//VERSIONE ALTERNATIVA

/*Future<List<model.Artist>> get_artist_quizpage() async {
  accessToken = await getAccessToken();
  List<model.Artist> artists = [];
  final artistsInfo = await http.get(
      Uri.parse("https://api.spotify.com/v1/me/following?type=artist"),
      headers: {
        "Authorization": 'Authorization: Bearer $accessToken',
        "content-type": "application/x-www-form-urlencoded"
      });

  final artistsJson = json.decode(artistsInfo.body);

  for (var i = 0;
      i < List.from(artistsJson["artists"]["items"]).length && i < 5;
      i++) {
    var curr_artist = List.from(artistsJson["artists"]["items"])[i];

    final res = create_artist(curr_artist);
    artists.add(res);
  }
  final http.Response relArtistsInfo;
  List<model.Artist> artistsToGet = [];
  final String firstArtistId;
  if (artists.isNotEmpty) {
    if (artists.length > 1) {
      firstArtistId =
          artists.elementAt(0 + Random().nextInt((artists.length) - 1)).id;
    } else {
      firstArtistId = artists.elementAt(0).id;
    }

    relArtistsInfo = await http.get(
        Uri.parse(
            "https://api.spotify.com/v1/artists/$firstArtistId/related-artists"),
        headers: {
          "Authorization": 'Authorization: Bearer $accessToken',
          "content-type": "application/x-www-form-urlencoded"
        });
  } else {
    relArtistsInfo = await http.get(
        Uri.parse(
            "https://api.spotify.com/v1/artists/0TnOYISbd1XYRBk9myaseg/related-artists"),
        headers: {
          "Authorization": 'Authorization: Bearer $accessToken',
          "content-type": "application/x-www-form-urlencoded"
        });
  }

  final relArtistsJson = json.decode(relArtistsInfo.body);

  for (var i = 0; i < List.from(relArtistsJson["artists"]).length; i++) {
    var curr_rel_artist = List.from(relArtistsJson["artists"])[i];

    final res = create_artist(curr_rel_artist);
    artistsToGet.add(res);
  }

  return artistsToGet;
} */

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
  if (!List.from(tracksJson["tracks"]).isEmpty) {
    for (var i = 0; i < List.from(tracksJson["tracks"]).length; i++) {
      var tmp = List.from(tracksJson["tracks"])[i];
      if (tmp['id'] == null ||
          tmp['name'] == null ||
          tmp['preview_url'] == null) {
        continue;
      }
      model.Track track = track_format(tmp);

      tracks.add(track);
    }
  }
  return tracks;
}

fake_event_api_call() {
  return {
    "data": [
      {
        "description":
            "Visionari Festival 2023 at Circolo Magnolia at 2023-05-21T15:00:00+0200",
        "endDate": "2023-05-22",
        "image":
            "https://images.sk-static.com/images/media/profile_images/events/41010926/huge_avatar",
        "location": {
          "@type": "Place",
          "address": {
            "@type": "PostalAddress",
            "addressCountry": "Italy",
            "addressLocality": "Segrate",
            "postalCode": "20100",
            "streetAddress": "Via Circonvallazione Idroscalo, 41"
          },
          "geo": {
            "@type": "GeoCoordinates",
            "latitude": 45.46366,
            "longitude": 9.28604
          },
          "name": "Circolo Magnolia",
          "sameAs": "http://www.circolomagnolia.it"
        },
        "name": "Visionari Festival 2023",
        "startDate": "2023-05-21T15:00:00+0200"
      },
      {
        "@context": "http://schema.org",
        "@type": "MusicEvent",
        "description":
            "Daniele Silvestri at Teatro Lirico at 2023-05-22T21:00:00+0200",
        "endDate": "2023-05-22",
        "eventStatus": "https://schema.org/EventScheduled",
        "image":
            "https://images.sk-static.com/images/media/profile_images/artists/519444/huge_avatar",
        "location": {
          "@type": "Place",
          "address": {
            "@type": "PostalAddress",
            "addressCountry": "Italy",
            "addressLocality": "Milan",
            "postalCode": "20122",
            "streetAddress": "Via Larga, 16"
          },
          "geo": {
            "@type": "GeoCoordinates",
            "latitude": 45.46134,
            "longitude": 9.19166
          },
          "name": "Teatro Lirico",
          "sameAs": null
        },
        "name": "Daniele Silvestri",
        "performer": [
          {"@type": "MusicGroup", "name": "Daniele Silvestri"}
        ],
        "startDate": "2023-05-22T21:00:00+0200"
      },
      {
        "@context": "http://schema.org",
        "@type": "MusicEvent",
        "description":
            "Lucas Debargue at Conservatorio di Milano at 2023-05-22T20:30:00+0200",
        "endDate": "2023-05-22",
        "eventStatus": "https://schema.org/EventScheduled",
        "image":
            "https://images.sk-static.com/images/media/profile_images/artists/8728409/huge_avatar",
        "location": {
          "@type": "Place",
          "address": {
            "@type": "PostalAddress",
            "addressCountry": "Italy",
            "addressLocality": "Milan",
            "postalCode": "20122",
            "streetAddress": "Via Conservatorio 12"
          },
          "geo": {
            "@type": "GeoCoordinates",
            "latitude": 45.46506,
            "longitude": 9.20309
          },
          "name": "Conservatorio di Milano",
          "sameAs": null
        },
        "name": "Lucas Debargue",
        "performer": [
          {"@type": "MusicGroup", "name": "Lucas Debargue"}
        ],
        "startDate": "2023-05-22T20:30:00+0200"
      },
      {
        "@context": "http://schema.org",
        "@type": "MusicEvent",
        "description": "Sam Fender at Fabrique at 2023-05-23T20:30:00+0200",
        "endDate": "2023-05-23",
        "eventStatus": "https://schema.org/EventScheduled",
        "image":
            "https://images.sk-static.com/images/media/profile_images/artists/6907314/huge_avatar",
        "location": {
          "@type": "Place",
          "address": {
            "@type": "PostalAddress",
            "addressCountry": "Italy",
            "addressLocality": "Milan",
            "postalCode": "20138",
            "streetAddress": "Via Fantoli, 9"
          },
          "geo": {
            "@type": "GeoCoordinates",
            "latitude": 45.45223,
            "longitude": 9.25202
          },
          "name": "Fabrique",
          "sameAs": "http://www.fabriquemilano.it/"
        },
        "name": "Sam Fender",
        "performer": [
          {"@type": "MusicGroup", "name": "Sam Fender"}
        ],
        "startDate": "2023-05-23T20:30:00+0200"
      },
      {
        "@context": "http://schema.org",
        "@type": "MusicEvent",
        "description": "Polyphia at Alcatraz at 2023-05-23T09:00:00+0200",
        "endDate": "2023-05-23",
        "eventStatus": "https://schema.org/EventScheduled",
        "image":
            "https://images.sk-static.com/images/media/profile_images/artists/6308759/huge_avatar",
        "location": {
          "@type": "Place",
          "address": {
            "@type": "PostalAddress",
            "addressCountry": "Italy",
            "addressLocality": "Milan",
            "postalCode": "20159",
            "streetAddress": "Via Valtellina 25/27"
          },
          "geo": {
            "@type": "GeoCoordinates",
            "latitude": 45.49463,
            "longitude": 9.18276
          },
          "name": "Alcatraz",
          "sameAs": "http://www.alcatrazmilano.com"
        },
        "name": "Polyphia",
        "performer": [
          {"@type": "MusicGroup", "name": "Polyphia"},
          {"@type": "MusicGroup", "name": "johan lenox"}
        ],
        "startDate": "2023-05-23T09:00:00+0200"
      },
      {
        "@context": "http://schema.org",
        "@type": "MusicEvent",
        "description": "Polyphia at Alcatraz at 2023-05-23T20:00:00+0200",
        "endDate": "2023-05-23",
        "eventStatus": "https://schema.org/EventScheduled",
        "image":
            "https://images.sk-static.com/images/media/profile_images/artists/6308759/huge_avatar",
        "location": {
          "@type": "Place",
          "address": {
            "@type": "PostalAddress",
            "addressCountry": "Italy",
            "addressLocality": "Milan",
            "postalCode": "20159",
            "streetAddress": "Via Valtellina 25/27"
          },
          "geo": {
            "@type": "GeoCoordinates",
            "latitude": 45.49463,
            "longitude": 9.18276
          },
          "name": "Alcatraz",
          "sameAs": "http://www.alcatrazmilano.com"
        },
        "name": "Polyphia",
        "performer": [
          {"@type": "MusicGroup", "name": "Polyphia"}
        ],
        "startDate": "2023-05-23T20:00:00+0200"
      },
      {
        "@context": "http://schema.org",
        "@type": "MusicEvent",
        "description":
            "Lingua Ignota at Santeria Toscana 31 at 2023-05-23T20:00:00+0200",
        "endDate": "2023-05-23",
        "eventStatus": "https://schema.org/EventScheduled",
        "image":
            "https://images.sk-static.com/images/media/profile_images/artists/9088314/huge_avatar",
        "location": {
          "@type": "Place",
          "address": {
            "@type": "PostalAddress",
            "addressCountry": "Italy",
            "addressLocality": "Milan",
            "postalCode": "20136",
            "streetAddress": "Viale Toscana 31"
          },
          "geo": {
            "@type": "GeoCoordinates",
            "latitude": 45.44561,
            "longitude": 9.18835
          },
          "name": "Santeria Toscana 31",
          "sameAs": "http://www.santeria.milano.it"
        },
        "name": "Lingua Ignota",
        "performer": [
          {"@type": "MusicGroup", "name": "Lingua Ignota"}
        ],
        "startDate": "2023-05-23T20:00:00+0200"
      },
      {
        "@context": "http://schema.org",
        "@type": "MusicEvent",
        "description": "atwood (IT) at Legend Club at 2023-05-23T20:00:00+0200",
        "endDate": "2023-05-23",
        "eventStatus": "https://schema.org/EventScheduled",
        "image":
            "https://images.sk-static.com/images/media/profile_images/artists/10013479/huge_avatar",
        "location": {
          "@type": "Place",
          "address": {
            "@type": "PostalAddress",
            "addressCountry": "Italy",
            "addressLocality": "Milan",
            "postalCode": "20159",
            "streetAddress": "Viale Enrico Fermi 98"
          },
          "geo": {
            "@type": "GeoCoordinates",
            "latitude": 45.50482,
            "longitude": 9.18493
          },
          "name": "Legend Club",
          "sameAs": "http://www.legendclubmilano.com/"
        },
        "name": "atwood (IT)",
        "performer": [
          {"@type": "MusicGroup", "name": "atwood (IT)"}
        ],
        "startDate": "2023-05-23T20:00:00+0200"
      },
      {
        "@context": "http://schema.org",
        "@type": "MusicEvent",
        "description":
            "Michele Bonifati and Michele Bonifati Emong at Un Posto a Milano at 2023-05-23T20:00:00+0200",
        "endDate": "2023-05-23",
        "eventStatus": "https://schema.org/EventScheduled",
        "image":
            "https://images.sk-static.com/images/media/profile_images/artists/10267433/huge_avatar",
        "location": {
          "@type": "Place",
          "address": {
            "@type": "PostalAddress",
            "addressCountry": "Italy",
            "addressLocality": "Milan",
            "postalCode": "20135",
            "streetAddress": "Via Privata Cuccagna, 2/4"
          },
          "geo": {
            "@type": "GeoCoordinates",
            "latitude": 45.45121,
            "longitude": 9.21163
          },
          "name": "Un Posto a Milano",
          "sameAs": "https://www.unpostoamilano.it"
        },
        "name": "Michele Bonifati",
        "performer": [
          {"@type": "MusicGroup", "name": "Michele Bonifati"},
          {"@type": "MusicGroup", "name": "Michele Bonifati Emong"}
        ],
        "startDate": "2023-05-23T20:00:00+0200"
      },
      {
        "@context": "http://schema.org",
        "@type": "MusicEvent",
        "description":
            "Articolo 31 at Mediolanum Forum at 2023-05-24T21:00:00+0200",
        "endDate": "2023-05-24",
        "eventStatus": "https://schema.org/EventScheduled",
        "image":
            "https://images.sk-static.com/images/media/profile_images/artists/520065/huge_avatar",
        "location": {
          "@type": "Place",
          "address": {
            "@type": "PostalAddress",
            "addressCountry": "Italy",
            "addressLocality": "Assago",
            "postalCode": "20090",
            "streetAddress": "Via G. di Vittorio, 6"
          },
          "geo": {
            "@type": "GeoCoordinates",
            "latitude": 45.3796,
            "longitude": 9.21433
          },
          "name": "Mediolanum Forum",
          "sameAs": "http://www.mediolanumforum.it/"
        },
        "name": "Articolo 31",
        "performer": [
          {"@type": "MusicGroup", "name": "Articolo 31"}
        ],
        "startDate": "2023-05-24T21:00:00+0200"
      },
      {
        "@context": "http://schema.org",
        "@type": "MusicEvent",
        "description":
            "Fazil Say at Conservatorio Di Milano Sala Verdi at 2023-05-24T20:30:00+0200",
        "endDate": "2023-05-24",
        "eventStatus": "https://schema.org/EventScheduled",
        "image":
            "https://images.sk-static.com/images/media/profile_images/artists/452373/huge_avatar",
        "location": {
          "@type": "Place",
          "address": {
            "@type": "PostalAddress",
            "addressCountry": "Italy",
            "addressLocality": "Milan",
            "postalCode": "20122",
            "streetAddress": "Via Conservatorio, 12"
          },
          "geo": {
            "@type": "GeoCoordinates",
            "latitude": 45.46497,
            "longitude": 9.20318
          },
          "name": "Conservatorio Di Milano Sala Verdi",
          "sameAs": null
        },
        "name": "Fazil Say",
        "performer": [
          {"@type": "MusicGroup", "name": "Fazil Say"}
        ],
        "startDate": "2023-05-24T20:30:00+0200"
      },
      {
        "@context": "http://schema.org",
        "@type": "MusicEvent",
        "description":
            "Grande Royale and Kickstarter Ritual at Barrio's at 2023-05-24T18:00:00+0200",
        "endDate": "2023-05-24",
        "eventStatus": "https://schema.org/EventScheduled",
        "image":
            "https://images.sk-static.com/images/media/profile_images/artists/8734374/huge_avatar",
        "location": {
          "@type": "Place",
          "address": {
            "@type": "PostalAddress",
            "addressCountry": "Italy",
            "addressLocality": "Milan",
            "postalCode": "20142",
            "streetAddress": "Via Barona"
          },
          "geo": {
            "@type": "GeoCoordinates",
            "latitude": 45.43243,
            "longitude": 9.14839
          },
          "name": "Barrio's",
          "sameAs": "http://www.barrioscafe.it"
        },
        "name": "Grande Royale",
        "performer": [
          {"@type": "MusicGroup", "name": "Grande Royale"},
          {"@type": "MusicGroup", "name": "Kickstarter Ritual"}
        ],
        "startDate": "2023-05-24T18:00:00+0200"
      },
      {
        "@context": "http://schema.org",
        "@type": "MusicEvent",
        "description": "Novanta at Mosso at 2023-05-24T21:30:00+0200",
        "endDate": "2023-05-24",
        "eventStatus": "https://schema.org/EventScheduled",
        "image":
            "https://images.sk-static.com/images/media/profile_images/artists/10250863/huge_avatar",
        "location": {
          "@type": "Place",
          "address": {
            "@type": "PostalAddress",
            "addressCountry": "Italy",
            "addressLocality": "Milan",
            "postalCode": "20127",
            "streetAddress": "Via Angelo Mosso 3"
          },
          "geo": {
            "@type": "GeoCoordinates",
            "latitude": 45.49422,
            "longitude": 9.22654
          },
          "name": "Mosso",
          "sameAs": "http://mosso.org"
        },
        "name": "Novanta",
        "performer": [
          {"@type": "MusicGroup", "name": "Novanta"},
          {"@type": "MusicGroup", "name": "Oneiros Way"}
        ],
        "startDate": "2023-05-24T21:30:00+0200"
      },
      {
        "@context": "http://schema.org",
        "@type": "MusicEvent",
        "description":
            "sierra (it) at Circolo Arci Bellezza at 2023-05-24T21:00:00+0200",
        "endDate": "2023-05-24",
        "eventStatus": "https://schema.org/EventScheduled",
        "image":
            "https://images.sk-static.com/images/media/profile_images/artists/10274318/huge_avatar",
        "location": {
          "@type": "Place",
          "address": {
            "@type": "PostalAddress",
            "addressCountry": "Italy",
            "addressLocality": "Milan",
            "postalCode": "20136",
            "streetAddress": "Via Bellezza, 16A"
          },
          "geo": {
            "@type": "GeoCoordinates",
            "latitude": 45.4487,
            "longitude": 9.19486
          },
          "name": "Circolo Arci Bellezza",
          "sameAs": null
        },
        "name": "sierra (it)",
        "performer": [
          {"@type": "MusicGroup", "name": "sierra (it)"}
        ],
        "startDate": "2023-05-24T21:00:00+0200"
      },
      {
        "@context": "http://schema.org",
        "@type": "MusicEvent",
        "description":
            "Michele Bonifati and Michele Bonifati Emong at Biblioteca del Carrobiolo at 2023-05-24T19:00:00+0200",
        "endDate": "2023-05-24",
        "eventStatus": "https://schema.org/EventScheduled",
        "image":
            "https://images.sk-static.com/images/media/profile_images/artists/10267433/huge_avatar",
        "location": {
          "@type": "Place",
          "address": {
            "@type": "PostalAddress",
            "addressCountry": "Italy",
            "addressLocality": "Monza",
            "postalCode": "20900",
            "streetAddress": "Vicolo Carrobiolo, 4/b"
          },
          "geo": {
            "@type": "GeoCoordinates",
            "latitude": 45.58663,
            "longitude": 9.27725
          },
          "name": "Biblioteca del Carrobiolo",
          "sameAs": null
        },
        "name": "Michele Bonifati",
        "performer": [
          {"@type": "MusicGroup", "name": "Michele Bonifati"},
          {"@type": "MusicGroup", "name": "Michele Bonifati Emong"}
        ],
        "startDate": "2023-05-24T19:00:00+0200"
      },
      {
        "@context": "http://schema.org",
        "@type": "MusicEvent",
        "description": "Live Festival 2023 at Live Festival 2023 at 2023-05-24",
        "endDate": "2023-05-25",
        "eventStatus": "https://schema.org/EventScheduled",
        "image":
            "https://images.sk-static.com/images/media/profile_images/events/41122811/huge_avatar",
        "location": {
          "@type": "Place",
          "address": {
            "@type": "PostalAddress",
            "addressCountry": "Italy",
            "addressLocality": "Milan"
          },
          "name": "Live Festival 2023"
        },
        "name": "Live Festival 2023",
        "performer": [
          {"@type": "MusicGroup", "name": "James Acos"}
        ],
        "startDate": "2023-05-24"
      },
      {
        "@context": "http://schema.org",
        "@type": "MusicEvent",
        "description": "NxWorries at Fabrique at 2023-05-25T21:00:00+0200",
        "endDate": "2023-05-25",
        "eventStatus": "https://schema.org/EventScheduled",
        "image":
            "https://images.sk-static.com/images/media/profile_images/artists/8572009/huge_avatar",
        "location": {
          "@type": "Place",
          "address": {
            "@type": "PostalAddress",
            "addressCountry": "Italy",
            "addressLocality": "Milan",
            "postalCode": "20138",
            "streetAddress": "Via Fantoli, 9"
          },
          "geo": {
            "@type": "GeoCoordinates",
            "latitude": 45.45223,
            "longitude": 9.25202
          },
          "name": "Fabrique",
          "sameAs": "http://www.fabriquemilano.it/"
        },
        "name": "NxWorries",
        "performer": [
          {"@type": "MusicGroup", "name": "NxWorries"},
          {"@type": "MusicGroup", "name": "Knxwledge"}
        ],
        "startDate": "2023-05-25T21:00:00+0200"
      },
      {
        "@context": "http://schema.org",
        "@type": "MusicEvent",
        "description":
            "Articolo 31 at Mediolanum Forum at 2023-05-25T21:00:00+0200",
        "endDate": "2023-05-25",
        "eventStatus": "https://schema.org/EventScheduled",
        "image":
            "https://images.sk-static.com/images/media/profile_images/artists/520065/huge_avatar",
        "location": {
          "@type": "Place",
          "address": {
            "@type": "PostalAddress",
            "addressCountry": "Italy",
            "addressLocality": "Assago",
            "postalCode": "20090",
            "streetAddress": "Via G. di Vittorio, 6"
          },
          "geo": {
            "@type": "GeoCoordinates",
            "latitude": 45.3796,
            "longitude": 9.21433
          },
          "name": "Mediolanum Forum",
          "sameAs": "http://www.mediolanumforum.it/"
        },
        "name": "Articolo 31",
        "performer": [
          {"@type": "MusicGroup", "name": "Articolo 31"}
        ],
        "startDate": "2023-05-25T21:00:00+0200"
      },
      {
        "@context": "http://schema.org",
        "@type": "MusicEvent",
        "description":
            "Punkreas at La Buttiga Beer Room at 2023-05-25T19:00:00+0200",
        "endDate": "2023-05-25",
        "eventStatus": "https://schema.org/EventScheduled",
        "image":
            "https://images.sk-static.com/images/media/profile_images/artists/530228/huge_avatar",
        "location": {
          "@type": "Place",
          "address": {
            "@type": "PostalAddress",
            "addressCountry": "Italy",
            "addressLocality": "Milan",
            "postalCode": "20135",
            "streetAddress": "Viale Isonzo 10"
          },
          "geo": {
            "@type": "GeoCoordinates",
            "latitude": 45.44715,
            "longitude": 9.20786
          },
          "name": "La Buttiga Beer Room",
          "sameAs": null
        },
        "name": "Punkreas",
        "performer": [
          {"@type": "MusicGroup", "name": "Punkreas"}
        ],
        "startDate": "2023-05-25T19:00:00+0200"
      },
      {
        "@context": "http://schema.org",
        "@type": "MusicEvent",
        "description":
            "Gege' Telesforo at Blue Note Milano Jazz Club & Restaurant at 2023-05-25T20:30:00+0200",
        "endDate": "2023-05-25",
        "eventStatus": "https://schema.org/EventScheduled",
        "image":
            "https://images.sk-static.com/images/media/profile_images/artists/410277/huge_avatar",
        "location": {
          "@type": "Place",
          "address": {
            "@type": "PostalAddress",
            "addressCountry": "Italy",
            "addressLocality": "Milan",
            "postalCode": "20100",
            "streetAddress": "Via Pietro Borsieri 37"
          },
          "geo": {
            "@type": "GeoCoordinates",
            "latitude": 45.48903,
            "longitude": 9.18903
          },
          "name": "Blue Note Milano Jazz Club & Restaurant",
          "sameAs": "http://www.bluenotemilano.com/"
        },
        "name": "Gege' Telesforo",
        "performer": [
          {"@type": "MusicGroup", "name": "Gege' Telesforo"}
        ],
        "startDate": "2023-05-25T20:30:00+0200"
      },
      {
        "@context": "http://schema.org",
        "@type": "MusicEvent",
        "description": "Mutonia at Legend Club at 2023-05-25T20:00:00+0200",
        "endDate": "2023-05-25",
        "eventStatus": "https://schema.org/EventScheduled",
        "image":
            "https://images.sk-static.com/images/media/profile_images/artists/9808699/huge_avatar",
        "location": {
          "@type": "Place",
          "address": {
            "@type": "PostalAddress",
            "addressCountry": "Italy",
            "addressLocality": "Milan",
            "postalCode": "20159",
            "streetAddress": "Viale Enrico Fermi 98"
          },
          "geo": {
            "@type": "GeoCoordinates",
            "latitude": 45.50482,
            "longitude": 9.18493
          },
          "name": "Legend Club",
          "sameAs": "http://www.legendclubmilano.com/"
        },
        "name": "Mutonia",
        "performer": [
          {"@type": "MusicGroup", "name": "Mutonia"}
        ],
        "startDate": "2023-05-25T20:00:00+0200"
      },
      {
        "@context": "http://schema.org",
        "@type": "MusicEvent",
        "description":
            "Elettrotape at Artmall Milano at 2023-05-25T21:30:00+0200",
        "endDate": "2023-05-25",
        "eventStatus": "https://schema.org/EventScheduled",
        "image":
            "https://images.sk-static.com/images/media/profile_images/artists/10212061/huge_avatar",
        "location": {
          "@type": "Place",
          "address": {
            "@type": "PostalAddress",
            "addressCountry": "Italy",
            "addressLocality": "Milan",
            "postalCode": null,
            "streetAddress": "via torino 64"
          },
          "geo": {
            "@type": "GeoCoordinates",
            "latitude": 45.46083,
            "longitude": 9.18263
          },
          "name": "Artmall Milano",
          "sameAs": "https://www.instagram.com/artmallmilano/"
        },
        "name": "Elettrotape",
        "performer": [
          {"@type": "MusicGroup", "name": "Elettrotape"}
        ],
        "startDate": "2023-05-25T21:30:00+0200"
      },
      {
        "@context": "http://schema.org",
        "@type": "MusicEvent",
        "description":
            "ABBA Symphonic at Teatro Arcimboldi (teatro Degli Arcimboldi) at 2023-05-25T21:00:00+0200",
        "endDate": "2023-05-25",
        "eventStatus": "https://schema.org/EventScheduled",
        "image":
            "https://images.sk-static.com/images/media/profile_images/artists/10227990/huge_avatar",
        "location": {
          "@type": "Place",
          "address": {
            "@type": "PostalAddress",
            "addressCountry": "Italy",
            "addressLocality": "Milan",
            "postalCode": "20126",
            "streetAddress": "Viale dell'Innovazione, 20"
          },
          "geo": {
            "@type": "GeoCoordinates",
            "latitude": 45.51447,
            "longitude": 9.21372
          },
          "name": "Teatro Arcimboldi (teatro Degli Arcimboldi)",
          "sameAs": null
        },
        "name": "ABBA Symphonic",
        "performer": [
          {"@type": "MusicGroup", "name": "ABBA Symphonic"}
        ],
        "startDate": "2023-05-25T21:00:00+0200"
      },
      {
        "@context": "http://schema.org",
        "@type": "MusicEvent",
        "description": "Joseph Bound at Clèr at 2023-05-25T19:00:00+0200",
        "endDate": "2023-05-25",
        "eventStatus": "https://schema.org/EventScheduled",
        "image":
            "https://images.sk-static.com/images/media/profile_images/artists/9751169/huge_avatar",
        "location": {
          "@type": "Place",
          "address": {
            "@type": "PostalAddress",
            "addressCountry": "Italy",
            "addressLocality": "Milan",
            "postalCode": "20151",
            "streetAddress": "Via Bressanone, 8"
          },
          "geo": {
            "@type": "GeoCoordinates",
            "latitude": 45.49859,
            "longitude": 9.12918
          },
          "name": "Clèr",
          "sameAs": "http://clermilano.com"
        },
        "name": "Joseph Bound",
        "performer": [
          {"@type": "MusicGroup", "name": "Joseph Bound"}
        ],
        "startDate": "2023-05-25T19:00:00+0200"
      },
      {
        "@context": "http://schema.org",
        "@type": "MusicEvent",
        "description":
            "Physical Therapy at Distretto Industriale 4 at 2023-05-25T22:30:00+0200",
        "endDate": "2023-05-25",
        "eventStatus": "https://schema.org/EventScheduled",
        "image":
            "https://images.sk-static.com/images/media/profile_images/artists/6807/huge_avatar",
        "location": {
          "@type": "Place",
          "address": {
            "@type": "PostalAddress",
            "addressCountry": "Italy",
            "addressLocality": "Milan",
            "postalCode": "20139",
            "streetAddress": "25 Via Vincenzo Toffetti"
          },
          "geo": {
            "@type": "GeoCoordinates",
            "latitude": 45.43967,
            "longitude": 9.23327
          },
          "name": "Distretto Industriale 4",
          "sameAs": null
        },
        "name": "Physical Therapy",
        "performer": [
          {"@type": "MusicGroup", "name": "Physical Therapy"},
          {"@type": "MusicGroup", "name": "Katatonic Silentio"},
          {"@type": "MusicGroup", "name": "Presto"}
        ],
        "startDate": "2023-05-25T22:30:00+0200"
      },
      {
        "@context": "http://schema.org",
        "@type": "MusicEvent",
        "description":
            "Gabriel Prokofiev at Mudec Museo delle culture at 2023-05-25T09:00:00+0200",
        "endDate": "2023-05-25",
        "eventStatus": "https://schema.org/EventScheduled",
        "image":
            "https://images.sk-static.com/images/media/profile_images/artists/2404833/huge_avatar",
        "location": {
          "@type": "Place",
          "address": {
            "@type": "PostalAddress",
            "addressCountry": "Italy",
            "addressLocality": "Milan",
            "postalCode": null,
            "streetAddress": null
          },
          "name": "Mudec Museo delle culture",
          "sameAs": null
        },
        "name": "Gabriel Prokofiev",
        "performer": [
          {"@type": "MusicGroup", "name": "Gabriel Prokofiev"}
        ],
        "startDate": "2023-05-25T09:00:00+0200"
      },
      {
        "@context": "http://schema.org",
        "@type": "MusicEvent",
        "description":
            "Narratore Urbano at Let's Go Party at 2023-05-25T20:00:00+0200",
        "endDate": "2023-05-25",
        "eventStatus": "https://schema.org/EventScheduled",
        "image":
            "https://images.sk-static.com/images/media/profile_images/artists/10084621/huge_avatar",
        "location": {
          "@type": "Place",
          "address": {
            "@type": "PostalAddress",
            "addressCountry": "Italy",
            "addressLocality": "Milan",
            "postalCode": null,
            "streetAddress": null
          },
          "name": "Let's Go Party",
          "sameAs": null
        },
        "name": "Narratore Urbano",
        "performer": [
          {"@type": "MusicGroup", "name": "Narratore Urbano"}
        ],
        "startDate": "2023-05-25T20:00:00+0200"
      },
      {
        "@context": "http://schema.org",
        "@type": "MusicEvent",
        "description":
            "Gabry Ponte at Soccorsoinfesta Ornavasso at 2023-05-26T00:00:00+0200",
        "endDate": "2023-05-26",
        "eventStatus": "https://schema.org/EventScheduled",
        "image":
            "https://images.sk-static.com/images/media/profile_images/artists/536411/huge_avatar",
        "location": {
          "@type": "Place",
          "address": {
            "@type": "PostalAddress",
            "addressCountry": "Italy",
            "addressLocality": "Ornavasso",
            "postalCode": "28877",
            "streetAddress": "Piazza Enrico Bianchetti"
          },
          "geo": {
            "@type": "GeoCoordinates",
            "latitude": 45.97017,
            "longitude": 8.41518
          },
          "name": "Soccorsoinfesta Ornavasso",
          "sameAs": null
        },
        "name": "Gabry Ponte",
        "performer": [
          {"@type": "MusicGroup", "name": "Gabry Ponte"}
        ],
        "startDate": "2023-05-26T00:00:00+0200"
      },
      {
        "@context": "http://schema.org",
        "@type": "MusicEvent",
        "description":
            "Roberto Cacciapaglia at Conservatorio di Musica \"Giuseppe Verdi\" at 2023-05-26T20:45:00+0200",
        "endDate": "2023-05-26",
        "eventStatus": "https://schema.org/EventScheduled",
        "image":
            "https://images.sk-static.com/images/media/profile_images/artists/244943/huge_avatar",
        "location": {
          "@type": "Place",
          "address": {
            "@type": "PostalAddress",
            "addressCountry": "Italy",
            "addressLocality": "Milan",
            "postalCode": "20100",
            "streetAddress": "Via Conservatorio, 12"
          },
          "geo": {
            "@type": "GeoCoordinates",
            "latitude": 45.46497,
            "longitude": 9.20318
          },
          "name": "Conservatorio di Musica \"Giuseppe Verdi\"",
          "sameAs": null
        },
        "name": "Roberto Cacciapaglia",
        "performer": [
          {"@type": "MusicGroup", "name": "Roberto Cacciapaglia"}
        ],
        "startDate": "2023-05-26T20:45:00+0200"
      },
      {
        "@context": "http://schema.org",
        "@type": "MusicEvent",
        "description": "Elvenking at Legend Club at 2023-05-26T20:30:00+0200",
        "endDate": "2023-05-26",
        "eventStatus": "https://schema.org/EventScheduled",
        "image":
            "https://images.sk-static.com/images/media/profile_images/artists/483092/huge_avatar",
        "location": {
          "@type": "Place",
          "address": {
            "@type": "PostalAddress",
            "addressCountry": "Italy",
            "addressLocality": "Milan",
            "postalCode": "20159",
            "streetAddress": "Viale Enrico Fermi 98"
          },
          "geo": {
            "@type": "GeoCoordinates",
            "latitude": 45.50482,
            "longitude": 9.18493
          },
          "name": "Legend Club",
          "sameAs": "http://www.legendclubmilano.com/"
        },
        "name": "Elvenking",
        "performer": [
          {"@type": "MusicGroup", "name": "Elvenking"}
        ],
        "startDate": "2023-05-26T20:30:00+0200"
      },
      {
        "@context": "http://schema.org",
        "@type": "MusicEvent",
        "description":
            "Modà at Teatro Degli Arcimboldi at 2023-05-26T21:00:00+0200",
        "endDate": "2023-05-26",
        "eventStatus": "https://schema.org/EventScheduled",
        "image":
            "https://images.sk-static.com/images/media/profile_images/artists/186470/huge_avatar",
        "location": {
          "@type": "Place",
          "address": {
            "@type": "PostalAddress",
            "addressCountry": "Italy",
            "addressLocality": "Milan",
            "postalCode": "20126",
            "streetAddress": "Viale dell'Innovazione, 20"
          },
          "geo": {
            "@type": "GeoCoordinates",
            "latitude": 45.51116,
            "longitude": 9.21106
          },
          "name": "Teatro Degli Arcimboldi",
          "sameAs": null
        },
        "name": "Modà",
        "performer": [
          {"@type": "MusicGroup", "name": "Modà"}
        ],
        "startDate": "2023-05-26T21:00:00+0200"
      },
      {
        "@context": "http://schema.org",
        "@type": "MusicEvent",
        "description":
            "WEL, BULL BRIGADE, Why Everyone Left, Atarassia Gröp, and Menagramo at Santeria Toscana 31 at 2023-05-26T19:00:00+0200",
        "endDate": "2023-05-26",
        "eventStatus": "https://schema.org/EventScheduled",
        "image":
            "https://images.sk-static.com/images/media/profile_images/artists/10196388/huge_avatar",
        "location": {
          "@type": "Place",
          "address": {
            "@type": "PostalAddress",
            "addressCountry": "Italy",
            "addressLocality": "Milan",
            "postalCode": "20136",
            "streetAddress": "Viale Toscana 31"
          },
          "geo": {
            "@type": "GeoCoordinates",
            "latitude": 45.44561,
            "longitude": 9.18835
          },
          "name": "Santeria Toscana 31",
          "sameAs": "http://www.santeria.milano.it"
        },
        "name": "WEL",
        "performer": [
          {"@type": "MusicGroup", "name": "WEL"},
          {"@type": "MusicGroup", "name": "BULL BRIGADE"},
          {"@type": "MusicGroup", "name": "Why Everyone Left"},
          {"@type": "MusicGroup", "name": "Atarassia Gröp"},
          {"@type": "MusicGroup", "name": "Menagramo"}
        ],
        "startDate": "2023-05-26T19:00:00+0200"
      },
      {
        "@context": "http://schema.org",
        "@type": "MusicEvent",
        "description":
            "Valentino Vivace at Istituto Svizzero di Roma at 2023-05-26T21:00:00+0200",
        "endDate": "2023-05-26",
        "eventStatus": "https://schema.org/EventScheduled",
        "image":
            "https://images.sk-static.com/images/media/profile_images/artists/10190894/huge_avatar",
        "location": {
          "@type": "Place",
          "address": {
            "@type": "PostalAddress",
            "addressCountry": "Italy",
            "addressLocality": "Milan",
            "postalCode": "20121",
            "streetAddress": "Via del Vecchio Politecnico 3"
          },
          "geo": {
            "@type": "GeoCoordinates",
            "latitude": 45.47232,
            "longitude": 9.19654
          },
          "name": "Istituto Svizzero di Roma",
          "sameAs": null
        },
        "name": "Valentino Vivace",
        "performer": [
          {"@type": "MusicGroup", "name": "Valentino Vivace"}
        ],
        "startDate": "2023-05-26T21:00:00+0200"
      },
      {
        "@context": "http://schema.org",
        "@type": "MusicEvent",
        "description": "Missin Red at Rob De Matt at 2023-05-26T22:00:00+0200",
        "endDate": "2023-05-26",
        "eventStatus": "https://schema.org/EventScheduled",
        "image":
            "https://images.sk-static.com/images/media/profile_images/artists/7158919/huge_avatar",
        "location": {
          "@type": "Place",
          "address": {
            "@type": "PostalAddress",
            "addressCountry": "Italy",
            "addressLocality": "Milan",
            "postalCode": "20159",
            "streetAddress": "via Enrico Annibale Butti 18"
          },
          "geo": {
            "@type": "GeoCoordinates",
            "latitude": 45.49842,
            "longitude": 9.17446
          },
          "name": "Rob De Matt",
          "sameAs": "http://robdematt.org/"
        },
        "name": "Missin Red",
        "performer": [
          {"@type": "MusicGroup", "name": "Missin Red"}
        ],
        "startDate": "2023-05-26T22:00:00+0200"
      },
      {
        "@context": "http://schema.org",
        "@type": "MusicEvent",
        "description":
            "The Cloverhearts at Rock n' Roll at 2023-05-26T21:00:00+0200",
        "endDate": "2023-05-26",
        "eventStatus": "https://schema.org/EventScheduled",
        "image":
            "https://images.sk-static.com/images/media/profile_images/artists/10087485/huge_avatar",
        "location": {
          "@type": "Place",
          "address": {
            "@type": "PostalAddress",
            "addressCountry": "Italy",
            "addressLocality": "Milan",
            "postalCode": "20125",
            "streetAddress": "Via Giuseppe Bruschetti 11"
          },
          "geo": {
            "@type": "GeoCoordinates",
            "latitude": 45.49246,
            "longitude": 9.20785
          },
          "name": "Rock n' Roll",
          "sameAs": "http://www.rocknrollclub.it/"
        },
        "name": "The Cloverhearts",
        "performer": [
          {"@type": "MusicGroup", "name": "The Cloverhearts"}
        ],
        "startDate": "2023-05-26T21:00:00+0200"
      },
      {
        "@context": "http://schema.org",
        "@type": "MusicEvent",
        "description": "MI AMI Fest 2023 at MI AMI Fest 2023 at 2023-05-26",
        "endDate": "2023-05-28",
        "eventStatus": "https://schema.org/EventScheduled",
        "image":
            "https://images.sk-static.com/images/media/profile_images/events/41132838/huge_avatar",
        "location": {
          "@type": "Place",
          "address": {
            "@type": "PostalAddress",
            "addressCountry": "Italy",
            "addressLocality": "Milan"
          },
          "name": "MI AMI Fest 2023"
        },
        "name": "MI AMI Fest 2023",
        "performer": [
          {"@type": "MusicGroup", "name": "MONT BAUD"}
        ],
        "startDate": "2023-05-26"
      },
      {
        "@context": "http://schema.org",
        "@type": "MusicEvent",
        "description":
            "MI AMI Festival 2023 at Circolo Magnolia at 2023-05-26T16:00:00+0200",
        "endDate": "2023-05-29",
        "eventStatus": "https://schema.org/EventScheduled",
        "image":
            "https://images.sk-static.com/images/media/profile_images/events/40773157/huge_avatar",
        "location": {
          "@type": "Place",
          "address": {
            "@type": "PostalAddress",
            "addressCountry": "Italy",
            "addressLocality": "Segrate",
            "postalCode": "20100",
            "streetAddress": "Via Circonvallazione Idroscalo, 41"
          },
          "geo": {
            "@type": "GeoCoordinates",
            "latitude": 45.46366,
            "longitude": 9.28604
          },
          "name": "Circolo Magnolia",
          "sameAs": "http://www.circolomagnolia.it"
        },
        "name": "MI AMI Festival 2023",
        "performer": [
          {"@type": "MusicGroup", "name": "Verdena"},
          {"@type": "MusicGroup", "name": "Cosmo"},
          {"@type": "MusicGroup", "name": "Jockstrap"},
          {"@type": "MusicGroup", "name": "dente"},
          {"@type": "MusicGroup", "name": "Mecna"},
          {"@type": "MusicGroup", "name": "COMA_COSE"},
          {"@type": "MusicGroup", "name": "Dargen D'amico"},
          {"@type": "MusicGroup", "name": "Fulminacci"},
          {"@type": "MusicGroup", "name": "L'officina Della Camomilla"},
          {"@type": "MusicGroup", "name": "NASKA"},
          {"@type": "MusicGroup", "name": "BNKR44"},
          {"@type": "MusicGroup", "name": "Colombre"},
          {"@type": "MusicGroup", "name": "Ginevra"},
          {"@type": "MusicGroup", "name": "Rareș"},
          {"@type": "MusicGroup", "name": "Deki Alem"},
          {"@type": "MusicGroup", "name": "Giuse The Lizia"},
          {"@type": "MusicGroup", "name": "Bluem"},
          {"@type": "MusicGroup", "name": "Ada Oda"},
          {"@type": "MusicGroup", "name": "Delicatoni"},
          {"@type": "MusicGroup", "name": "Popa"},
          {"@type": "MusicGroup", "name": "Queen Of Saba"},
          {"@type": "MusicGroup", "name": "So Beast"},
          {"@type": "MusicGroup", "name": "MIGLIO"},
          {"@type": "MusicGroup", "name": "Denoise"},
          {"@type": "MusicGroup", "name": "Angelica (IT)"},
          {"@type": "MusicGroup", "name": "montag (IT)"}
        ],
        "startDate": "2023-05-26T16:00:00+0200"
      },
      {
        "@context": "http://schema.org",
        "@type": "MusicEvent",
        "description": "AQUA at Fabrique at 2023-05-27T21:00:00+0200",
        "endDate": "2023-05-27",
        "eventStatus": "https://schema.org/EventScheduled",
        "image":
            "https://images.sk-static.com/images/media/profile_images/artists/209775/huge_avatar",
        "location": {
          "@type": "Place",
          "address": {
            "@type": "PostalAddress",
            "addressCountry": "Italy",
            "addressLocality": "Milan",
            "postalCode": "20138",
            "streetAddress": "Via Fantoli, 9"
          },
          "geo": {
            "@type": "GeoCoordinates",
            "latitude": 45.45223,
            "longitude": 9.25202
          },
          "name": "Fabrique",
          "sameAs": "http://www.fabriquemilano.it/"
        },
        "name": "AQUA",
        "performer": [
          {"@type": "MusicGroup", "name": "AQUA"}
        ],
        "startDate": "2023-05-27T21:00:00+0200"
      },
      {
        "@context": "http://schema.org",
        "@type": "MusicEvent",
        "description":
            "COMA_COSE at MI AMI Festival at 2023-05-27T20:00:00+0200",
        "endDate": "2023-05-27",
        "eventStatus": "https://schema.org/EventScheduled",
        "image":
            "https://images.sk-static.com/images/media/profile_images/artists/9119219/huge_avatar",
        "location": {
          "@type": "Place",
          "address": {
            "@type": "PostalAddress",
            "addressCountry": "Italy",
            "addressLocality": "Milan",
            "postalCode": null,
            "streetAddress": null
          },
          "geo": {
            "@type": "GeoCoordinates",
            "latitude": 45.4642,
            "longitude": 9.18998
          },
          "name": "MI AMI Festival",
          "sameAs": null
        },
        "name": "COMA_COSE",
        "performer": [
          {"@type": "MusicGroup", "name": "COMA_COSE"}
        ],
        "startDate": "2023-05-27T20:00:00+0200"
      },
      {
        "@context": "http://schema.org",
        "@type": "MusicEvent",
        "description":
            "Grande Royale and Los Fuocos at Masnada at 2023-05-27T18:00:00+0200",
        "endDate": "2023-05-27",
        "eventStatus": "https://schema.org/EventScheduled",
        "image":
            "https://images.sk-static.com/images/media/profile_images/artists/8734374/huge_avatar",
        "location": {
          "@type": "Place",
          "address": {
            "@type": "PostalAddress",
            "addressCountry": "Italy",
            "addressLocality": "Milan",
            "postalCode": "20861",
            "streetAddress": null
          },
          "geo": {
            "@type": "GeoCoordinates",
            "latitude": 45.54892,
            "longitude": 9.29879
          },
          "name": "Masnada",
          "sameAs": null
        },
        "name": "Grande Royale",
        "performer": [
          {"@type": "MusicGroup", "name": "Grande Royale"},
          {"@type": "MusicGroup", "name": "Los Fuocos"}
        ],
        "startDate": "2023-05-27T18:00:00+0200"
      },
      {
        "@context": "http://schema.org",
        "@type": "MusicEvent",
        "description":
            "Barkee Bay at MI AMI Festival at 2023-05-27T21:00:00+0200",
        "endDate": "2023-05-27",
        "eventStatus": "https://schema.org/EventScheduled",
        "image":
            "https://images.sk-static.com/images/media/profile_images/artists/10269564/huge_avatar",
        "location": {
          "@type": "Place",
          "address": {
            "@type": "PostalAddress",
            "addressCountry": "Italy",
            "addressLocality": "Milan",
            "postalCode": null,
            "streetAddress": null
          },
          "geo": {
            "@type": "GeoCoordinates",
            "latitude": 45.4642,
            "longitude": 9.18998
          },
          "name": "MI AMI Festival",
          "sameAs": null
        },
        "name": "Barkee Bay",
        "performer": [
          {"@type": "MusicGroup", "name": "Barkee Bay"}
        ],
        "startDate": "2023-05-27T21:00:00+0200"
      },
      {
        "@context": "http://schema.org",
        "@type": "MusicEvent",
        "description":
            "Lion Warriah and Babe Roots at Milan at 2023-05-27T15:00:00+0200",
        "endDate": "2023-05-27",
        "eventStatus": "https://schema.org/EventScheduled",
        "image":
            "https://images.sk-static.com/images/media/profile_images/artists/9812979/huge_avatar",
        "location": {
          "@type": "Place",
          "address": {
            "@type": "PostalAddress",
            "addressCountry": "Italy",
            "addressLocality": "Milan"
          },
          "name": "Milan"
        },
        "name": "Lion Warriah",
        "performer": [
          {"@type": "MusicGroup", "name": "Lion Warriah"},
          {"@type": "MusicGroup", "name": "Babe Roots"}
        ],
        "startDate": "2023-05-27T15:00:00+0200"
      },
      {
        "@context": "http://schema.org",
        "@type": "MusicEvent",
        "description": "Wicked Expectation at RAL at 2023-05-27T21:00:00+0200",
        "endDate": "2023-05-27",
        "eventStatus": "https://schema.org/EventScheduled",
        "image":
            "https://images.sk-static.com/images/media/profile_images/artists/8841684/huge_avatar",
        "location": {
          "@type": "Place",
          "address": {
            "@type": "PostalAddress",
            "addressCountry": "Italy",
            "addressLocality": "Milan",
            "postalCode": null,
            "streetAddress": "via Corsico 3"
          },
          "geo": {
            "@type": "GeoCoordinates",
            "latitude": 45.45237,
            "longitude": 9.17351
          },
          "name": "RAL",
          "sameAs": null
        },
        "name": "Wicked Expectation",
        "performer": [
          {"@type": "MusicGroup", "name": "Wicked Expectation"}
        ],
        "startDate": "2023-05-27T21:00:00+0200"
      },
      {
        "@context": "http://schema.org",
        "@type": "MusicEvent",
        "description":
            "Under The Snow at Legend Club at 2023-05-27T20:30:00+0200",
        "endDate": "2023-05-27",
        "eventStatus": "https://schema.org/EventScheduled",
        "image":
            "https://images.sk-static.com/images/media/profile_images/artists/6323369/huge_avatar",
        "location": {
          "@type": "Place",
          "address": {
            "@type": "PostalAddress",
            "addressCountry": "Italy",
            "addressLocality": "Milan",
            "postalCode": "20159",
            "streetAddress": "Viale Enrico Fermi 98"
          },
          "geo": {
            "@type": "GeoCoordinates",
            "latitude": 45.50482,
            "longitude": 9.18493
          },
          "name": "Legend Club",
          "sameAs": "http://www.legendclubmilano.com/"
        },
        "name": "Under The Snow",
        "performer": [
          {"@type": "MusicGroup", "name": "Under The Snow"}
        ],
        "startDate": "2023-05-27T20:30:00+0200"
      },
      {
        "@context": "http://schema.org",
        "@type": "MusicEvent",
        "description": "SESTO at Milan at 2023-05-27T21:30:00+0200",
        "endDate": "2023-05-27",
        "eventStatus": "https://schema.org/EventScheduled",
        "image":
            "https://images.sk-static.com/images/media/profile_images/artists/10274569/huge_avatar",
        "location": {
          "@type": "Place",
          "address": {
            "@type": "PostalAddress",
            "addressCountry": "Italy",
            "addressLocality": "Milan"
          },
          "name": "Milan"
        },
        "name": "SESTO",
        "performer": [
          {"@type": "MusicGroup", "name": "SESTO"}
        ],
        "startDate": "2023-05-27T21:30:00+0200"
      },
      {
        "@context": "http://schema.org",
        "@type": "MusicEvent",
        "description": "Voigtmann at Super Club at 2023-05-27T23:00:00+0200",
        "endDate": "2023-05-27",
        "eventStatus": "https://schema.org/EventScheduled",
        "image":
            "https://images.sk-static.com/images/media/profile_images/artists/5866344/huge_avatar",
        "location": {
          "@type": "Place",
          "address": {
            "@type": "PostalAddress",
            "addressCountry": "Italy",
            "addressLocality": "Milan",
            "postalCode": "20144",
            "streetAddress": "27 Via Tortona"
          },
          "geo": {
            "@type": "GeoCoordinates",
            "latitude": 45.45182,
            "longitude": 9.16351
          },
          "name": "Super Club",
          "sameAs": null
        },
        "name": "Voigtmann",
        "performer": [
          {"@type": "MusicGroup", "name": "Voigtmann"},
          {"@type": "MusicGroup", "name": "Phill Prince"},
          {"@type": "MusicGroup", "name": "Kerry Wallace"},
          {"@type": "MusicGroup", "name": "Rick Maia"}
        ],
        "startDate": "2023-05-27T23:00:00+0200"
      },
      {
        "@context": "http://schema.org",
        "@type": "MusicEvent",
        "description":
            "Dimitri from Paris at Allianz Cloud at 2023-05-27T18:00:00+0200",
        "endDate": "2023-05-27",
        "eventStatus": "https://schema.org/EventScheduled",
        "image":
            "https://images.sk-static.com/images/media/profile_images/artists/410600/huge_avatar",
        "location": {
          "@type": "Place",
          "address": {
            "@type": "PostalAddress",
            "addressCountry": "Italy",
            "addressLocality": "Milan",
            "postalCode": "20148",
            "streetAddress": "Piazza Carlo Stuparich, 1"
          },
          "geo": {
            "@type": "GeoCoordinates",
            "latitude": 45.4828,
            "longitude": 9.14253
          },
          "name": "Allianz Cloud",
          "sameAs": null
        },
        "name": "Dimitri from Paris",
        "performer": [
          {"@type": "MusicGroup", "name": "Dimitri from Paris"},
          {"@type": "MusicGroup", "name": "Elliot Schooling"},
          {"@type": "MusicGroup", "name": "Liam Palmer"},
          {"@type": "MusicGroup", "name": "Vithz"},
          {"@type": "MusicGroup", "name": "Ferrari"},
          {"@type": "MusicGroup", "name": "Garcon de Rue"}
        ],
        "startDate": "2023-05-27T18:00:00+0200"
      },
      {
        "@context": "http://schema.org",
        "@type": "MusicEvent",
        "description":
            "Ckrono at Santeria Toscana 31 at 2023-05-27T22:00:00+0200",
        "endDate": "2023-05-27",
        "eventStatus": "https://schema.org/EventScheduled",
        "image":
            "https://images.sk-static.com/images/media/profile_images/artists/1064474/huge_avatar",
        "location": {
          "@type": "Place",
          "address": {
            "@type": "PostalAddress",
            "addressCountry": "Italy",
            "addressLocality": "Milan",
            "postalCode": "20136",
            "streetAddress": "Viale Toscana 31"
          },
          "geo": {
            "@type": "GeoCoordinates",
            "latitude": 45.44561,
            "longitude": 9.18835
          },
          "name": "Santeria Toscana 31",
          "sameAs": "http://www.santeria.milano.it"
        },
        "name": "Ckrono",
        "performer": [
          {"@type": "MusicGroup", "name": "Ckrono"}
        ],
        "startDate": "2023-05-27T22:00:00+0200"
      },
      {
        "@context": "http://schema.org",
        "@type": "MusicEvent",
        "description":
            "MI AMI 2023 • day 2 2023 at Circolo Magnolia at 2023-05-27",
        "endDate": "2023-05-27",
        "eventStatus": "https://schema.org/EventScheduled",
        "image":
            "https://images.sk-static.com/images/media/profile_images/events/41027748/huge_avatar",
        "location": {
          "@type": "Place",
          "address": {
            "@type": "PostalAddress",
            "addressCountry": "Italy",
            "addressLocality": "Segrate",
            "postalCode": "20100",
            "streetAddress": "Via Circonvallazione Idroscalo, 41"
          },
          "geo": {
            "@type": "GeoCoordinates",
            "latitude": 45.46366,
            "longitude": 9.28604
          },
          "name": "Circolo Magnolia",
          "sameAs": "http://www.circolomagnolia.it"
        },
        "name": "MI AMI 2023 • day 2 2023",
        "performer": [
          {"@type": "MusicGroup", "name": "Anna Carol"}
        ],
        "startDate": "2023-05-27"
      },
      {
        "@context": "http://schema.org",
        "@type": "MusicEvent",
        "description":
            "Monza Visionaria Festival at Roseto della Villa Reale 2023 at Monza Visionaria Festival at Roseto della Villa Reale 2023 at 2023-05-27",
        "endDate": "2023-05-28",
        "eventStatus": "https://schema.org/EventScheduled",
        "image":
            "https://images.sk-static.com/images/media/profile_images/events/41122800/huge_avatar",
        "location": {
          "@type": "Place",
          "address": {
            "@type": "PostalAddress",
            "addressCountry": "Italy",
            "addressLocality": "Monza"
          },
          "name": "Monza Visionaria Festival at Roseto della Villa Reale 2023"
        },
        "name": "Monza Visionaria Festival at Roseto della Villa Reale 2023",
        "performer": [
          {"@type": "MusicGroup", "name": "Yumi Ito"},
          {"@type": "MusicGroup", "name": "Szymon Mika"}
        ],
        "startDate": "2023-05-27"
      }
    ],
    "page": "1"
  };
}
