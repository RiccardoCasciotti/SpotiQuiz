import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:spotify_quiz/utility/utilities.dart';

import '../models/models.dart' as model;
import 'package:http/http.dart' as http;

import 'package:spotify_quiz/utility/utilities.dart' as utilities;

Future<List> get_artist(String artist_id) async {
  accessToken = await getAccessToken();

  final artistInfo = await http.get(
      Uri.parse("https://api.spotify.com/v1/artists/$artist_id"),
      headers: {
        "Authorization": 'Authorization: Bearer $accessToken',
        "content-type": "application/x-www-form-urlencoded"
      });

  final artistJson = json.decode(artistInfo.body);
  
  List<model.Image> images = [];

  for (var i = 0; i < List.from(artistJson["images"]).length; i++) {
    var tmp = List.from(artistJson["images"])[i];
    
    model.Image img = new model.Image(tmp["url"], tmp["height"], tmp["width"]);
    images.add(img);
  }
  var tracks = await get_top_tracks(artist_id);
  var res = [
    artistJson["id"],
    artistJson["name"],
    images,
    List.from(artistJson["genres"]),
    //tracks
  ];
  print(res);
  return res;
}

Future<List<model.Track>> get_top_tracks(String artist_id) async {
  accessToken = await getAccessToken();

  final tracksInfo = await http.get(
      Uri.parse("https://api.spotify.com/v1/artists/$artist_id/top-tracks?market=IT"),
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

model.Track track_format(track) {
  List<model.Image> images = [];

  for (var i = 0; i < List.from(track["album"]["images"]).length; i++) {
    var tmp = List.from(track["album"]["images"])[i];
    model.Image img = model.Image(tmp["url"], tmp["height"], tmp["width"]);
    images.add(img);
  }
  List<model.Artist> artists = [];
  for (var i = 0; i < (track["artists"]).length; i++) {
    var tmp = track["artists"][i];
    
    model.Artist artist =
        model.Artist(tmp["id"], tmp["name"], null, null);
    artists.add(artist);
  }

  return model.Track(
      track['id'], track['name'], images, artists, track['preview_url']);
}


