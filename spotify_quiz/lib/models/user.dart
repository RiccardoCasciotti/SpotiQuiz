import 'package:cloud_firestore/cloud_firestore.dart';
import 'models.dart';

class User {
  final String uid;
  final String username;
  final String nation;
  final num level;
  final num numberQuiz;
  final num experience;
  final num bestScore;
  final num correctAnswer;
  final num wrongAnswer;
  final String refreshToken;
  final String accessToken = '-';

  static const empty = User(
      uid: "-",
      username: "-",
      level: -1,
      numberQuiz: -1,
      experience: -1,
      bestScore: -1,
      wrongAnswer: -1,
      correctAnswer: -1,
      nation: "-",
      refreshToken: "-");

  const User({
    required this.uid,
    required this.username,
    required this.level,
    required this.numberQuiz,
    required this.experience,
    required this.bestScore,
    required this.nation,
    required this.correctAnswer,
    required this.wrongAnswer,
    required this.refreshToken,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      experience: json['experience'],
      level: json['level'],
      numberQuiz: json['numOfQuiz'],
      uid: json['uid'],
      username: json['username'],
      refreshToken: json['refreshToken'],
      nation: json['nation'],
      bestScore: json['bestScore'],
      wrongAnswer: json['wrongAnswers'],
      correctAnswer: json['correctAnswers'],
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
    required num correctAnswer,
    required num wrongAnswer,
    required String refreshToken}) async {
  //reference to document
  final docUser = FirebaseFirestore.instance.collection('users').doc(uid);

  final json = {
    'experience': experience,
    'level': level,
    'numOfQuiz': numOfQuiz,
    'uid': uid,
    'username': username,
    'bestScore': bestScore,
    'nation': nation,
    'refreshToken': refreshToken,
    'wrongAnswers': wrongAnswer,
    'correctAnswers': correctAnswer,
  };

  await docUser.set(json);
}
