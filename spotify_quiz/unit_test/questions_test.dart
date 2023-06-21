import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:spotify_quiz/main.dart' as app;
import 'package:spotify_quiz/models/album.dart';
import 'package:spotify_quiz/models/artist.dart';
import 'package:spotify_quiz/models/event.dart';
import 'package:spotify_quiz/models/question.dart';
import 'package:spotify_quiz/models/quiz.dart';
import 'package:spotify_quiz/models/track.dart';
import 'package:spotify_quiz/utility/api_calls.dart';
import 'package:spotify_quiz/utility/question_a_utils.dart';
import 'package:spotify_quiz/utility/question_b_utils.dart';
import 'package:spotify_quiz/utility/question_c_utils.dart';
import 'package:spotify_quiz/utility/question_d_utils.dart';
import 'package:spotify_quiz/utility/quiz_utils.dart';

import 'package:spotify_quiz/utility/utilities.dart' as utilities;

void main() async {
  
  utilities.runningTest = true;
  await dotenv.load(fileName: ".env");
  utilities.refreshToken =  dotenv.env['TEST_REFRESH_TOKEN']!;

  await utilities.getNewAccessToken();

  test('Test: generate_a() type A', () async {
    //setup
   

    var result = await generate_a();
    
    //test
    expect(result.runtimeType == Question && result.options.isNotEmpty && result.type == "A", true);
  });
  test('Test: generate_b() type B', () async {
    //setup
   

    var result = await generate_b();
    
    //test
    expect(result.runtimeType == Question && result.options.isNotEmpty && result.type == "B", true);
  });
  test('Test: generate_c() type C', () async {
    //setup
   

    var result = await generate_c();
    
    //test
    expect(result.runtimeType == Question && result.options.isNotEmpty && result.type == "C", true);
  });
  test('Test: generate_d() type D', () async {
    //setup
   

    var result = await generate_d();
    
    //test
    expect(result.runtimeType == Question && result.options.isNotEmpty && result.type == "D", true);
  });



}