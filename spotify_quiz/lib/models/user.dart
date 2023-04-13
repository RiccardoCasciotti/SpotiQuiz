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
  final String? refresh_token;
  final String? access_token;


  static const  empty = User(uid: "-", username: "-", level: -1, numberQuiz: -1, experience:-1, coins:-1);

  const User({
    required this.uid,
    required this.username,
    required this.level,
    required this.numberQuiz,
    required this.experience,
    required this.bestScore,
    required this.nation,
    this.access_token,
    this.refresh_token
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      experience: json['experience'],
      level: json['level'],
      numberQuiz: json['numOfQuiz'],
      uid: json['uid'],
      username: json['username'], 
      refresh_token: json['refresh_token'],
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
    required String username,
    String? access_token, 
    String? refresh_token}) async {
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
