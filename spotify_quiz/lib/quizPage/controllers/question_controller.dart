import 'package:flutter/material.dart';
import '../../utility/quiz_utils.dart';
//import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../models/models.dart' as model;
import 'package:spotify_quiz/utility/utilities.dart' as utilities;

Map<String, Object> format(model.Question q) {
  var answers = [];
  var qText = "";

  // TYPE QUESTION A
  if (q.type == "A") {
    qText = "Who is the following artist?";

    for (var i = 0; i < q.options.length; i++) {
      answers.add({"text": q.options[i], "score": -2});
    }
    answers.add({"text": q.answer, "score": 10});
    answers.shuffle();
    if ((q.obj as model.Artist).images != null) {
      print("There was an image");
      print((q.obj as model.Artist).images!.length);
      model.Image image = (q.obj as model.Artist).images![1];
      return {
        'questionText': qText,
        'answers': answers,
        'image': image,
        'type': q.type
      };
    }
    print("There was no image");
    print((q.obj as model.Artist).images!.length);
  }
  // TYPE QUESTION B
  else if (q.type == "B") {
    qText = "Who sings this song?";

    for (var i = 0; i < q.options.length; i++) {
      answers.add({"text": q.options[i], "score": -2});
    }
    answers.add({"text": q.answer, "score": 10});
    answers.shuffle();
    if ((q.obj as model.Track).images != null) {
      
      model.Image image = (q.obj as model.Track).images![1];
      return {
        'questionText': qText,
        'answers': answers,
        'image': image,
        'song_title': (q.obj as model.Track).name,
        'type': q.type
      };
    }
    print("There was no image");
    print((q.obj as model.Artist).images!.length);
  }
  else if (q.type == "C") {
    qText = "When was this album released?";
    

    for (var i = 0; i < q.options.length; i++) {
      answers.add({"text": q.options[i], "score": -2});
    }
    answers.add({"text": q.answer, "score": 10});
    answers.shuffle();
    if ((q.obj as model.Album).images != null) {
      
      model.Image image = (q.obj as model.Album).images![1];
      return {
        'questionText': qText,
        'answers': answers,
        'image': image,
        'album_title': "${(q.obj as model.Album).name} by ${(q.obj as model.Album).artists[0].name}",
        'type': q.type
      };
    }
    print("There was no image");
    print((q.obj as model.Artist).images!.length);
  }
  else if (q.type == "D") {
    qText = "What's the title of this song?";
    

    for (var i = 0; i < q.options.length; i++) {
      answers.add({"text": q.options[i], "score": -2});
    }
    answers.add({"text": q.answer, "score": 10});
    answers.shuffle();
    if ((q.obj as model.Track).images != null) {
      
      model.Image image = (q.obj as model.Track).images![1];
      return {
        'questionText': qText,
        'answers': answers,
        'image': image,
        'type': q.type,
        'preview_url': (q.obj as model.Track).preview_url
      };
    }
    print("There was no image");
    print((q.obj as model.Artist).images!.length);
  }


  return {
    'questionText': qText,
    'answers': answers,
    'image': utilities.imageUserProfile
  };
}

Future<List<dynamic>> createQuestions(String selectedMode) async {

  var questionsList = [];
  model.Quiz quiz = await generate_quiz(selectedMode);

  for (var i = 0; i < quiz.questions.length; i++) {
    questionsList.add(format(quiz.questions[i]));
  }

  return questionsList;

  // return [
  //   {
  //     'questionText': 'In which year album X was released?',
  //     'answers': [
  //       {'text': '1920', 'score': -2},
  //       {'text': '1400', 'score': -2},
  //       {'text': '800', 'score': 10},
  //       {'text': '9444', 'score': -2},
  //     ]..shuffle(),
  //   },
  //   {
  //     'questionText': 'Is this song made by this artist?',
  //     'answers': [
  //       {'text': 'Yes', 'score': -2},
  //       {'text': 'No', 'score': 10},
  //     ]..shuffle(),
  //   },
  //   {
  //     'questionText': 'Which is this song?',
  //     'playButton': true,
  //     'answers': [
  //       {'text': '1920', 'score': -2},
  //       {'text': '1400', 'score': -2},
  //       {'text': '800', 'score': 10},
  //       {'text': '9444', 'score': -2},
  //     ]..shuffle(),
  //   },
  //   {
  //     'questionText': 'How many albums has artist X released?',
  //     'answers': [
  //       {'text': '4', 'score': -2},
  //       {'text': '3', 'score': -2},
  //       {'text': '1', 'score': -2},
  //       {'text': '0', 'score': 10},
  //     ]..shuffle(),
  //   },
  //   {
  //     'questionText': 'How many songs has artist X released?',
  //     'answers': [
  //       {'text': '43', 'score': -2},
  //       {'text': '21', 'score': 10},
  //       {'text': '90', 'score': -2},
  //       {'text': '5', 'score': -2},
  //     ]..shuffle(),
  //   },
  //   {
  //     'questionText': 'Of which albums is this song part of?',
  //     'answers': [
  //       {'text': 'Chtulu', 'score': 10},
  //       {'text': 'Draconic', 'score': -2},
  //       {'text': 'Fish and Chips', 'score': -2},
  //       {'text': 'Jeremy Ashkenas', 'score': -2},
  //     ]..shuffle(),
  //   },
  //   {
  //     'questionText': 'When was this song released?',
  //     'answers': [
  //       {'text': '1980', 'score': 10},
  //       {'text': '2012', 'score': -2},
  //       {'text': '2013', 'score': -2},
  //       {'text': '2020', 'score': -2},
  //     ]..shuffle(),
  //   },
  //   {
  //     'questionText': 'How many songs are in this album?',
  //     'answers': [
  //       {'text': '90', 'score': 10},
  //       {'text': '32', 'score': -2},
  //       {'text': '21', 'score': -2},
  //       {'text': '11', 'score': -2},
  //     ]..shuffle(),
  //   },
  //   {
  //     'questionText': 'Who made this song?',
  //     'answers': [
  //       {'text': 'Alec', 'score': 10},
  //       {'text': 'Ric', 'score': -2},
  //       {'text': 'Brumbrum', 'score': -2},
  //       {'text': 'Fiki', 'score': -2},
  //     ]..shuffle(),
  //   },
  // ]..shuffle();
}
