import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:spotify_quiz/main.dart' as app;
import 'package:spotify_quiz/models/album.dart';
import 'package:spotify_quiz/models/artist.dart';
import 'package:spotify_quiz/models/event.dart';
import 'package:spotify_quiz/models/quiz.dart';
import 'package:spotify_quiz/models/track.dart';
import 'package:spotify_quiz/utility/api_calls.dart';
import 'package:spotify_quiz/utility/quiz_utils.dart';

import 'package:spotify_quiz/utility/utilities.dart' as utilities;

void main() async {
  
  utilities.runningTest = true;
  await dotenv.load(fileName: ".env");
  utilities.refreshToken =  dotenv.env['TEST_REFRESH_TOKEN']!;

  await utilities.getNewAccessToken();

  test('Test: generate_quiz() type A', () async {
    //setup
   

    var result = await generate_quiz("A");
    
    //test
    expect(result.runtimeType == Quiz && result.questions.isNotEmpty && result.type == "A", true);
  });
  test('Test: generate_quiz() type B', () async {
    //setup
   

    var result = await generate_quiz("B");
    
    //test
    expect(result.runtimeType == Quiz && result.questions.isNotEmpty && result.type == "B", true);
  });
  test('Test: generate_quiz() type C', () async {
    //setup
   

    var result = await generate_quiz("C");
    
    //test
    expect(result.runtimeType == Quiz && result.questions.isNotEmpty && result.type == "C", true);
  });
  test('Test: generate_quiz() type D', () async {
    //setup
   

    var result = await generate_quiz("D");
    
    //test
    expect(result.runtimeType == Quiz && result.questions.isNotEmpty && result.type == "D", true);
  });
  test('Test: generate_quiz() type R', () async {
    //setup
   

    var result = await generate_quiz("R");
    
    //test
    expect(result.runtimeType == Quiz && result.questions.isNotEmpty && result.type == "R", true);
  });
}