import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:spotify_quiz/main.dart' as app;
import 'package:spotify_quiz/models/album.dart';
import 'package:spotify_quiz/models/artist.dart';
import 'package:spotify_quiz/models/event.dart';
import 'package:spotify_quiz/models/track.dart';
import 'package:spotify_quiz/utility/api_calls.dart';

import 'package:spotify_quiz/utility/utilities.dart' as utilities;

void main() async {
  app.main();
  utilities.runningTest = true;
  await dotenv.load(fileName: ".env");
  utilities.refreshToken =  dotenv.env['TEST_REFRESH_TOKEN']!;

  await utilities.getNewAccessToken();

  test('get_events_on_position()', () async {
    //setup
   

    List<Event> result = await get_events_on_position("Milano");
    
    //test
    expect(result.isEmpty, false);
  });

test('Call Success: get_related_artists()', () async {
    //setup
   

    List<Artist> result = await get_related_artists("0TnOYISbd1XYRBk9myaseg");
    
    //test
    expect(result.isEmpty, false);
  });

  
  test('Call Failed: get_related_artists()', () async {
    //setup
   

    List<Artist> result = await get_related_artists("--");
    
    //test
    expect(result.isEmpty, true);
  });
  
  test('Call Success: get_artist_albums()', () async {
    //setup
   

    List<Album> result = await get_artist_albums("0TnOYISbd1XYRBk9myaseg");
    
    //test
    expect(result.isEmpty, false);
  });
  test('Call Failed: get_artist_albums()', () async {
    //setup
   

    List<Album> result = await get_artist_albums("--");
    
    //test
    expect(result.isEmpty, true);
  });

  test('Call Success: get_followed_artists()', () async {
    //setup
   

    List<Artist> result = await get_followed_artists();
    
    //test
    expect(result.isEmpty, false);
  });

  test('Call Success: get_artist_quizpage()', () async {
    //setup
   

    List<Artist> result = await get_artist_quizpage();
    
    //test
    expect(result.isEmpty, false);
  });
  test('Call Success: get_artist()', () async {
    //setup
   

    Artist result = await get_artist("0TnOYISbd1XYRBk9myaseg");
    
    //test
    expect(result!= null, true);
  });
  test('Call Success: get_top_tracks()', () async {
    //setup
   

    List<Track> result = await get_top_tracks("0TnOYISbd1XYRBk9myaseg");
    
    //test
    expect(result.isEmpty, false);
  });
  test('Call Failed: get_top_tracks()', () async {
    //setup
   

    List<Track> result = await get_top_tracks("--");
    
    //test
    expect(result.isEmpty, true);
  });

  test('Call Success: fake_event_api_call()', () async {
    //setup
   

    var result = await fake_event_api_call();
    
    //test
  expect(result["data"] == null, false);
  });


  
  
  

}