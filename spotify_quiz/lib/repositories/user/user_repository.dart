import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../../models/user.dart';

class UserRepository {
  final _firebase = FirebaseFirestore.instance.collection('users');

  Future<void> create(
      {required String uid,
      required String username,
      required int level,
      required int numOfQuiz,
      required int experience,
      required int coins}) async {
    try {
      //THIS WAS PUT INSTEAD OF
      final json = {
        'coins': coins,
        'experience': experience,
        'level': level,
        'numOfQuiz': numOfQuiz,
        'uid': uid,
        'username': username,
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
      user.docs.forEach((element) {
        return userList.add(User.fromJson(element.data()));
      });
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

  Future<List<User>> getByID(String uid) async {
    List<User> userList = [];
    try {
      final user = await FirebaseFirestore.instance.collection('users').get();
      user.docs.forEach((element) {
        if ((User.fromJson(element.data())).uid == uid) {
          return userList.add(User.fromJson(element.data()));
        }
      });
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
}
