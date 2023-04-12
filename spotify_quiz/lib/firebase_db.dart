import 'package:firebase_core/firebase_core.dart';
import 'repositories/firebase_options.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:flutter/material.dart';

import 'package:spotify_quiz/models/user.dart';

void main() {
  DatabaseReference mDatabase;

  mDatabase = FirebaseDatabase.instance.ref();

  void writeNewUser(String userId, String username, int level, int numberQuiz,
      double experience, int coins, String refresh_token, String access_token) {
    User user = User(
        uid: userId,
        username: username,
        level: level,
        numberQuiz: numberQuiz,
        experience: experience,
        coins: coins,
        access_token: access_token, 
        refresh_token: refresh_token
        );
    mDatabase.child("users").child(userId).set(user);
  }
}
