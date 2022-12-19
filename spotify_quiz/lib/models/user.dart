import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String uid;
  String username;
  int level;
  int numberQuiz;
  double experience;
  int coins;

  User({
    required this.uid,
    required this.username,
    required this.level,
    required this.numberQuiz,
    required this.experience,
    required this.coins,
  });
}

Future createUser(
    {required String uid,
    required int coins,
    required int level,
    required double experience,
    required int numOfQuiz,
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
