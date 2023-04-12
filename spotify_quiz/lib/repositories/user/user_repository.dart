import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show Encoding, base64, json, utf8;

import '../../models/user.dart';



class UserRepository {
  final _firebase = FirebaseFirestore.instance.collection('users');
  

  Future<void> create(
      {required String uid,
      required String username,
      required int level,
      required int numOfQuiz,
      required int experience,
      required int coins, 
      }) async {
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

Future<User> api_get_user(User user) async {

  
    // final redirectUri = 'http://spotify_quiz-api.com';

    // final scopes = 'user-read-email';

    // final client_id = dotenv.env['SPOTIFY_CLIENT_ID'];

    // final client_secret = dotenv.env['SPOTIFY_CLIENT_SECRET'];
    
    // final url1 = Uri.parse('https://accounts.spotify.com/authorize?' +
    //     "response_type=code&client_id=${client_id}&scope=${scopes}&redirect_uri=${redirectUri}");

    // final response = await http.post(
    //         Uri.parse("https://accounts.spotify.com/api/token"),
    //         headers: {
    //           "Authorization":
    //               'Basic ${base64.encode(utf8.encode("${client_id}:${client_secret}"))}',
    //           "content-type": "application/x-www-form-urlencoded"
    //         },
    //         encoding: Encoding.getByName('utf-8'),
    //         body: {
    //           "code": "${code}",
    //           "redirect_uri": "${redirectUri}",
    //           "grant_type": "authorization_code"
    //         },);
    // final response = await http.get(
    //         Uri.parse("https://api.spotify.com/v1/me"),
    //         headers: {
    //           "Authorization":
    //               'Basic ${base64.encode(utf8.encode("${client_id}:${client_secret}"))}',
    //           "content-type": "application/x-www-form-urlencoded"
    //         },
    //         encoding: Encoding.getByName('utf-8'),
    //         body: {
    //           "code": "${code}",
    //           "redirect_uri": "${redirectUri}",
    //           "grant_type": "authorization_code"
    //         },);



    final userInfo = await http.get(
            Uri.parse("https://api.spotify.com/v1/me"),
            headers: {
              "Authorization":
                  'Authorization: Bearer ${user.access_token}',
              "content-type": "application/x-www-form-urlencoded"
            });
    final userJson = json.decode(userInfo.body);
    if(userJson["error"] != {})
      print("Error in the API request: ${userJson["error"]}");
    
    return User(
        coins: 0,
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
