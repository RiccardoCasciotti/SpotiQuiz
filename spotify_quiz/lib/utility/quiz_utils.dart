import 'dart:math';

import 'package:flutter/material.dart';
import 'package:spotify_quiz/models/models.dart' as model;
import 'package:spotify_quiz/utility/api_calls.dart';
import 'package:spotify_quiz/utility/question_a_utils.dart';
import 'package:spotify_quiz/utility/question_b_utils.dart';
import 'package:spotify_quiz/utility/question_c_utils.dart';
import 'package:spotify_quiz/utility/question_d_utils.dart';
import 'package:uuid/uuid.dart';

// Create uuid object

// type: A B C D R

int limit = 6;
Future<model.Quiz> generate_quiz(String type) async {
  List<model.Question> questions = [];
  var uuid = Uuid();
  var generator = generate_a;

  if (type != "R") {
    if (type == "A") {
      generator = generate_a;
    } else if (type == "B") {
      generator = generate_b;
    } else if (type == "C") {
      generator = generate_c;
    } else if (type == "D") {
      generator = generate_d;
    }

    for (var i = 0; i < limit; i++) {
      final question = await generator();
      questions.add(question);
    }
  } else {
    final types = [generate_a, generate_b, generate_c, generate_d];
    Random random = Random();
    for (var i = 0; i < limit; i++) {
      int index = random.nextInt(types.length);
      final question = await types[index]();
      questions.add(question);
    }
  }
  final res = model.Quiz(
      uid: uuid.v4(),
      points: 0,
      correct: 0,
      wrong: 0,
      type: type,
      questions: questions);
  return res;
}
