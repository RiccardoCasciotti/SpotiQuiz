import 'package:firebase_core/firebase_core.dart';
//import 'firebase_options.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:flutter/material.dart';

import 'package:spotify_quiz/models/user.dart';

void main() {
  DatabaseReference mDatabase;

  mDatabase = FirebaseDatabase.instance.ref();

  void writeNewUser(String userId, String username, int level, int numberQuiz,
      double experience, int coins) {
    User user = User(
        uid: userId,
        username: username,
        level: level,
        numberQuiz: numberQuiz,
        experience: experience,
        coins: coins);
    mDatabase.child("users").child(userId).set(user);
  }
}
