import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String uid;
  final String username;
  final num level;
  final num numberQuiz;
  final num experience;
  final num coins;
  final String? refresh_token;
  final String? access_token;


  static const  empty = User(uid: "-", username: "-", level: -1, numberQuiz: -1, experience:-1, coins:-1);

  const User({
    required this.uid,
    required this.username,
    required this.level,
    required this.numberQuiz,
    required this.experience,
    required this.coins,
    this.access_token,
    this.refresh_token
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        coins: json['coins'],
        experience: json['experience'],
        level: json['level'],
        numberQuiz: json['numOfQuiz'],
        uid: json['uid'],
        username: json['username'], 
        access_token: json['access_token'], 
        refresh_token: json['refresh_token']
        );
  }
}

Future createUser(
    {required String uid,
    required num coins,
    required num level,
    required num experience,
    required num numOfQuiz,
    required String username,
    String? access_token, 
    String? refresh_token}) async {
  //reference to document
  final docUser = FirebaseFirestore.instance.collection('users').doc(uid);

  final json = {
    'coins': coins,
    'experience': experience,
    'level': level,
    'numOfQuiz': numOfQuiz,
    'uid': uid,
    'username': username,
  };

  await docUser.set(json);
}
