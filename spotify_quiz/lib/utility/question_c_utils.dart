
// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:spotify_quiz/models/models.dart' as model;
import 'package:spotify_quiz/utility/api_calls.dart';
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
List<model.Artist> similar_artists = [];
String similar_id = "0TnOYISbd1XYRBk9myaseg";
String initializer_id = "0TnOYISbd1XYRBk9myaseg";
int count = 0;

List<model.Artist> consume_followed_artists = [];
List<model.Artist> consume_similar_artists = [];
List<model.Album> consume_albums = [];
int similar_index = 0;
int i = 0;

Future<void> init_data() async {
 
  
  if (followed_artists.isEmpty && i == 0){
    followed_artists = await get_followed_artists();
    if(!followed_artists.isEmpty){
      consume_followed_artists = followed_artists;
      consume_followed_artists.shuffle();
    }
    
    i++;
  }

  


  if (consume_similar_artists.length < 4){

    var candidate;

    if(!followed_artists.isEmpty ){

      candidate = followed_artists.last;
      followed_artists.removeLast();
 
    }

    else if(!similar_artists.isEmpty) {

      candidate = similar_artists.last;
      similar_artists.removeLast();

    }
    else if (similar_artists.isEmpty){

      similar_artists = await get_related_artists(similar_id);
      similar_artists = similar_artists.sublist(0,similar_artists.length < 30 ? similar_artists.length : 30 );
      similar_artists.shuffle();
      candidate = similar_artists.last;
      similar_artists.removeLast();

    }
    similar_id = candidate.id;

    consume_similar_artists = await get_related_artists(similar_id);

    consume_similar_artists = consume_similar_artists.sublist(0,consume_similar_artists.length < 30 ? consume_similar_artists.length : 30 );
    while (consume_similar_artists.length < 4 && count < 10) {
      count++;
      await init_data();
    }
    if(count == 10){
      similar_id = initializer_id;
      count = 0;
      await init_data();
    }

    
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

    final String dateFormatted = formatter.format(date);

    if (!options.contains(dateFormatted) &&
        date != DateUtils.dateOnly(album.date)) {
      options.add(dateFormatted);
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
