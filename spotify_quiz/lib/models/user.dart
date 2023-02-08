import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String uid;
  final String username;
  final num level;
  final num numberQuiz;
  final num experience;
  final num coins;

  User({
    required this.uid,
    required this.username,
    required this.level,
    required this.numberQuiz,
    required this.experience,
    required this.coins,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        coins: json['coins'],
        experience: json['experience'],
        level: json['level'],
        numberQuiz: json['numOfQuiz'],
        uid: json['uid'],
        username: json['username']);
  }
}

Future createUser(
    {required String uid,
    required num coins,
    required num level,
    required num experience,
    required num numOfQuiz,
    required String username}) async {
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
