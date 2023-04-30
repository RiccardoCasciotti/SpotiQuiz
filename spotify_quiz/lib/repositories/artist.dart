import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show json;
import 'package:spotify_quiz/utility/utilities.dart' as utilities;

import '../../models/user.dart';
import '../models/artist.dart';
import '../utility/api_calls.dart';

class ArtistRepository {

Future<Artist> new_artist(String id) async {
  var artist_data = await get_artist(id);
  return new Artist(artist_data[0], artist_data[1], artist_data[2], artist_data[3]);
}

}