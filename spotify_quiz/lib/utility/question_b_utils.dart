// ignore_for_file: non_constant_identifier_names

import 'dart:math';

import 'package:spotify_quiz/models/models.dart' as model;
import 'package:spotify_quiz/utility/api_calls.dart';

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

int similar_index = 0;
int i = 0;

Future<void> init_data() async {
  if (followed_artists.isEmpty && i == 0) {
    followed_artists = await get_followed_artists();
    if (!followed_artists.isEmpty) {
      consume_followed_artists = followed_artists;
      consume_followed_artists.shuffle();
    }

    i++;
  }

  if (consume_similar_artists.length < 4) {
    var candidate;

    if (!followed_artists.isEmpty) {
      candidate = followed_artists.last;
      followed_artists.removeLast();
    } else if (!similar_artists.isEmpty) {
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

    //print("SIMILAR_INDEX $similar_index");
  }
  //print("LEN consume_followed_artists: ${consume_followed_artists.length}");
  // if(consume_followed_artists.length < 4){
  //   consume_similar_artists = consume_followed_artists + consume_similar_artists;
  // }
}

Future<model.Question> generate_b() async {
  // B: link a song to its artist
  // get a list of followed artists
  // call get top tracks given an artist chosen from above

  await init_data();
  model.Track obj;
  String answer;
  List<String> options = [];
  model.Artist artist;
  List<model.Track> tracks;
  Random random = Random();

  if (consume_followed_artists.length > 3) {
    artist = consume_followed_artists.last;
    consume_followed_artists.removeLast();
    // for(var i = 0; i < consume_followed_artists.length; i++)
    //   print("FOLLOWED: ${consume_followed_artists[i].name}");
    // print("FOLLOWED LENGTH: ${consume_followed_artists.length}");

    tracks = await get_top_tracks(artist.id);
    if (tracks.isEmpty) {
      return await generate_b();
    }
    for (var i = 0; i < 3; i++) {
      int index = random.nextInt(consume_followed_artists.length);
      if (!options.contains(consume_followed_artists[index].name)) {
        options.add(consume_followed_artists[index].name);
      } else {
        i--;
      }
    }
    int index = random.nextInt(tracks.length);
  answer = artist.name;
  obj = tracks[index];
  String type = "B";

  var res = model.Question(answer, options, type, obj as model.Track);
  // print(res.toString());
  // print((res.text as model.Track).toString());
  return res;
  } else if (consume_similar_artists.length > 3){
    artist = consume_similar_artists.last;
    consume_similar_artists.removeLast();
    // for(var i = 0; i < consume_similar_artists.length; i++)
    //   print("SIMILAR: ${consume_similar_artists[i].name}");
    // print("SIMILAR LENGTH: ${consume_similar_artists.length}");

    tracks = await get_top_tracks(artist.id);
    if (tracks.isEmpty) {
     return await generate_b();
    }
    for (var i = 0; i < 3; i++) {
      int index = random.nextInt(consume_similar_artists.length);
      if (!options.contains(consume_similar_artists[index].name)) {
        options.add(consume_similar_artists[index].name);
      } else {
        i--;
      }
    }
    int index = random.nextInt(tracks.length);
  answer = artist.name;
  obj = tracks[index];
  String type = "B";

  var res = model.Question(answer, options, type, obj as model.Track);
  // print(res.toString());
  // print((res.text as model.Track).toString());
  return res;
  }
  
    return await generate_b();
  
  
}
