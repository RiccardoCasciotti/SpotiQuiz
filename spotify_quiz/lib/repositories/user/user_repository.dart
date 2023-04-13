import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show Encoding, base64, json, utf8;

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

  Future<List<User>> get() async {
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

  Future<User?> checkByID(String uid) async {
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

  Future<User> api_get_user(User user) async {
    final userInfo =
        await http.get(Uri.parse("https://api.spotify.com/v1/me"), headers: {
      "Authorization": 'Authorization: Bearer ${user.accessToken}',
      "content-type": "application/x-www-form-urlencoded"
    });
    final userJson = json.decode(userInfo.body);
    if (userJson["error"] != {})
      print("Error in the API request: ${userJson["error"]}");

    return User(
      bestScore: 0,
      nation: "-",
      experience: 0,
      level: 0,
      numberQuiz: 0,
      uid: userJson["id"],
      username: userJson['display_name'],
      //access_token: userJson['access_token'],
      //refresh_token: userJson['refresh_token']
    );
  }
}
