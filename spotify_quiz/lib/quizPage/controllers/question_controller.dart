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
      model.Image image = (q.obj as model.Track).images[1];
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
  } else if (q.type == "C") {
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
        'album_title':
            "${(q.obj as model.Album).name} by ${(q.obj as model.Album).artists[0].name}",
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

}
