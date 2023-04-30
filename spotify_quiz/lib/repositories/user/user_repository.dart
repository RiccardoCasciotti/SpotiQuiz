import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show json;
import 'package:spotify_quiz/utility/utilities.dart' as utilities;

import '../../models/user.dart';

class UserRepository {
  final _firebase = FirebaseFirestore.instance.collection('users');

  Future<void> create({
    required String uid,
    required String username,
    required String nation,
    required int level,
    required int numOfQuiz,
    required int experience,
    required int bestScore,
    required int correctAnswer,
    required int wrongAnswer,
    required String refreshToken,
  }) async {
    try {
      //THIS WAS PUT INSTEAD OF
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
      await _firebase.doc(uid).set(json);

      //THIS

      /*await _firebase.add({
        "uid": uid,
        "username": username,
        "level": level,
        "numOfQuiz": numOfQuiz,
        "experience": experience,
        "coins": coins
      });*/

    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print("Failed with error '${e.code}' : ${e.message}");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<User>> getUsers() async {
    List<User> userList = [];
    try {
      final user = await FirebaseFirestore.instance.collection('users').get();
      for (var element in user.docs) {
        userList.add(User.fromJson(element.data()));
      }
      return userList;
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print("Failed with error '${e.code}' : ${e.message}");
      }
      return userList;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<User?> getByID(String uid) async {
    List<User> userList = [];
    try {
      final user = await FirebaseFirestore.instance.collection('users').get();
      for (var element in user.docs) {
        if ((User.fromJson(element.data())).uid == uid) {
          userList.add(
            User.fromJson(element.data()),
          );
          return userList.first;
        }
      }
      return null;
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print("Failed with error '${e.code}' : ${e.message}");
      }
      return null;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<User> apiGetUser(String accesToken, String refreshToken) async {
    List<User> userList = [];

    //utilities.accessToken = accesToken;
    utilities.refreshToken = refreshToken;

    final userInfo =
        await http.get(Uri.parse("https://api.spotify.com/v1/me"), headers: {
      "Authorization": 'Authorization: Bearer $accesToken',
      "content-type": "application/x-www-form-urlencoded"
    });

    final userJson = json.decode(userInfo.body);

    if (userJson["error"] != {}) {
      debugPrint("Error in the API request: ${userJson["error"]}");
    }

    try {
      utilities.imageUserProfile = userJson["images"][0]["url"];
    } catch (e) {
      debugPrint("theImageWasNotPresent");
    }

    final user = await FirebaseFirestore.instance.collection('users').get();
    for (var element in user.docs) {
      if ((User.fromJson(element.data())).uid == userJson["id"]) {
        userList.add(
          User.fromJson(element.data()),
        );
        return userList.first;
      }
    }

    create(
      uid: userJson["id"],
      username: userJson["display_name"],
      nation: userJson["country"],
      refreshToken: refreshToken,
      level: 0,
      numOfQuiz: 0,
      experience: 0,
      bestScore: 0,
      wrongAnswer: 0,
      correctAnswer: 0,
    );

    return User(
        bestScore: 0,
        nation: userJson["country"],
        experience: 0,
        level: 0,
        numberQuiz: 0,
        correctAnswer: 0,
        wrongAnswer: 0,
        uid: userJson["id"],
        username: userJson["display_name"],
        refreshToken: refreshToken);
  }
}
