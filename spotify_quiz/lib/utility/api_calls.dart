import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:spotify_quiz/utility/question_a_utils.dart';
import 'package:spotify_quiz/utility/question_b_utils.dart';
import 'package:spotify_quiz/utility/question_c_utils.dart';
import 'package:spotify_quiz/utility/question_d_utils.dart';
import 'package:spotify_quiz/utility/quiz_utils.dart';
import 'package:spotify_quiz/utility/utilities.dart';

import '../models/models.dart' as model;
import 'package:http/http.dart' as http;

import 'package:spotify_quiz/utility/utilities.dart' as utilities;

List<model.Image> img_objs(List list) {
  List<model.Image> images = [];
  list = List.from(list);

  for (var i = 0; i < list.length; i++) {
    var tmp = list[i];

    model.Image img = new model.Image(tmp["url"], tmp["height"], tmp["width"]);
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
  final market = "IT";

  final albumsInfo = await http.get(
      Uri.parse(
          "https://api.spotify.com/v1/artists/$artist_id/albums?market=${market}&limit=4"),
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
      Uri.parse("https://api.spotify.com/v1/me/following?type=artist&limit=4"),
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
  var tmp = await generate_quiz("R");
  
  

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
          "https://api.spotify.com/v1/artists/$artist_id/top-tracks?market=IT"),
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
