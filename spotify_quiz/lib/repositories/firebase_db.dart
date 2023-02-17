//import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:spotify_quiz/models/user.dart';

void main() {
  DatabaseReference mDatabase;

  mDatabase = FirebaseDatabase.instance.ref();
/*
  void writeNewUser(String userId, String username, int level, int numberQuiz,
      int experience, int coins) {
    User user = User(
        uid: userId,
        username: username,
        level: level,
        numberQuiz: numberQuiz,
        experience: experience,
        coins: coins);
    mDatabase.child("users").child(userId).set(user);
  }
  */
}
