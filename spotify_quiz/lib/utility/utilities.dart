import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../models/artist.dart';
import '../quizPage/controllers/question_controller.dart';

Color secondaryColor = const Color.fromARGB(255, 25, 20, 20);
Color tertiaryColor = const Color.fromARGB(255, 255, 255, 255);
Color primaryColor = const Color.fromARGB(255, 30, 215, 96);
Color similSecondaryColor = const Color.fromARGB(255, 25, 25, 20);
Color wrongAnswerColor = const Color.fromARGB(255, 231, 34, 34);
Color logoColor = const Color.fromRGBO(54, 217, 174, 1);

var questions_a_prefetch;
var questions_b_prefetch;
var questions_c_prefetch;
var questions_d_prefetch;
var questions_r_prefetch;
var events_prefetch = null;
var location = false;
bool prefetched = false;
String nationality = "";
String accessToken = "";
String refreshToken = "";
String imageUserProfile =
    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg';

bool runningTest = false;
var artists;
var access_token;

Future<String> getAccessToken() async {
  final clientId = dotenv.env['SPOTIFY_CLIENT_ID'];
  final clientSecret = dotenv.env['SPOTIFY_CLIENT_SECRET'];
  final response = await http.post(
    Uri.parse("https://accounts.spotify.com/api/token"),
    headers: {
      "Authorization":
          'Basic ${base64.encode(utf8.encode("$clientId:$clientSecret"))}',
      "content-type": "application/x-www-form-urlencoded"
    },
    encoding: Encoding.getByName('utf-8'),
    body: {"refresh_token": refreshToken, "grant_type": "refresh_token"},
  );
  final bodyJson = json.decode(response.body);

  return bodyJson["access_token"];
}
