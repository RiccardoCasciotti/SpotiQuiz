import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';

class User {
  final String uid;
  final String username;
  final String nation;
  final num level;
  final num numberQuiz;
  final num experience;
  final num bestScore;

  User({
    required this.uid,
    required this.username,
    required this.level,
    required this.numberQuiz,
    required this.experience,
    required this.bestScore,
    required this.nation,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      experience: json['experience'],
      level: json['level'],
      numberQuiz: json['numOfQuiz'],
      uid: json['uid'],
      username: json['username'],
      nation: json['nation'],
      bestScore: json['bestScore'],
    );
  }
}

Future createUser(
    {required String uid,
    required String nation,
    required num bestScore,
    required num level,
    required num experience,
    required num numOfQuiz,
    required String username}) async {
  //reference to document
  final docUser = FirebaseFirestore.instance.collection('users').doc(uid);

  final json = {
    'experience': experience,
    'level': level,
    'numOfQuiz': numOfQuiz,
    'uid': uid,
    'username': username,
    'bestScore': bestScore,
    'nation': Platform.localeName,
  };

  await docUser.set(json);
}
