import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:spotify_quiz/models/models.dart' as model;
import 'package:spotify_quiz/utility/api_calls.dart';
import 'package:random_date/random_date.dart';
import 'package:random_x/random_x.dart';

//POSSIBLE QUESTIONS

// In which year album X was released?
// How many albums has artist X released?
// How many songs has artist X released?
// Of which albums is this song part of?
// When was this song released?
// How many songs are in this album?
// Who made this album?
// Who made this song?
// Is this song made by this artist?

//Question types:
//    A: link the image of an artist to the artist's name
//    B: link a song to its artist
//    C: In which year album X was released?
//    D: SARABANDA
//
//
List<model.Artist> followed_artists = [];
List<model.Artist> consume_followed_artists = [];
List<model.Artist> consume_similar_artists = [];
List<model.Album> consume_albums = [];
int similar_index = 0;

Future<void> init_data() async {
  if (followed_artists.length == 0) {
    followed_artists = await get_followed_artists();
    consume_followed_artists = followed_artists;
    consume_followed_artists.shuffle();
  }

  if (consume_similar_artists.length < 4) {
    String similar_id = followed_artists.length == 0
        ? "0TnOYISbd1XYRBk9myaseg"
        : followed_artists[similar_index % (followed_artists.length - 1)].id;
    //print("############################ $similar_id");
    consume_similar_artists = await get_related_artists(similar_id);
    consume_similar_artists = consume_similar_artists.sublist(
        0,
        consume_similar_artists.length < 30
            ? consume_similar_artists.length
            : 30);
    consume_similar_artists.shuffle();
    similar_index++;
    //print("SIMILAR_INDEX $similar_index");
  }
  if (consume_albums.length < 4) {
    if (consume_followed_artists.length > 4) {
      for (var i = 0; i < 5; i++) {
        final artist = consume_followed_artists.last;
        consume_followed_artists.removeLast();
        consume_albums = consume_albums + await get_artist_albums(artist.id);
      }
    } else {
      consume_similar_artists =
          consume_similar_artists + consume_followed_artists;
      for (var i = 0; i < 5; i++) {
        final artist = consume_similar_artists.last;
        consume_similar_artists.removeLast();
        consume_albums = consume_albums + await get_artist_albums(artist.id);
      }
    }
    consume_albums = consume_albums.toSet().toList();
    consume_albums.shuffle();
  }
  // for(var i = 0; i < consume_albums.length; i++)
  //     print("ALBUM: ${consume_albums[i].name}");
  //   print("ALBUMS LENGTH: ${consume_albums.length}");
}

Future<model.Question> generate_c() async {
  // C: In which year album X was released?
  // get a list of followed artists
  // call get top tracks given an artist chosen from above

  await init_data();

  model.Album obj;
  String answer;
  List<String> options = [];

  model.Album album = consume_albums.last;
  consume_albums.removeLast();

  final DateFormat formatter = DateFormat('MM/dd/yyyy');

  // for (var i = 0; i < consume_albums.length; i++)
  //   print("ALBUM: ${consume_albums[i].name}");
  // print("ALBUMS LENGTH: ${consume_albums.length}");

  for (var i = 0; i < 3; i++) {
    var date = RndX.generateRandomDateBetween(
        start:
            DateTime((album.date.year - 10), album.date.month, album.date.day),
        end: DateTime.now());

    date = DateUtils.dateOnly(date);

    final String date_formatted = formatter.format(date);

    if (!options.contains(date_formatted) &&
        date != DateUtils.dateOnly(album.date)) {
      options.add(date_formatted);
    } else {
      i--;
    }
  }

  final date = DateUtils.dateOnly(album.date);
  answer = formatter.format(date);
  obj = album;
  String type = "C";

  var res = model.Question(answer, options, type, obj as model.Album);
  // print(res.toString());
  // print((res.obj as model.Album).toString());
  return res;
}
