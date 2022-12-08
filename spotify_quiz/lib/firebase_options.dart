// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDE92CgV9Aks2twogpfk6kOwA3SRmKKY2Q',
    appId: '1:954338554494:web:f5639372e3e71faea45e2f',
    messagingSenderId: '954338554494',
    projectId: 'spotify-quiz-df890',
    authDomain: 'spotify-quiz-df890.firebaseapp.com',
    databaseURL: 'https://spotify-quiz-df890-default-rtdb.firebaseio.com',
    storageBucket: 'spotify-quiz-df890.appspot.com',
    measurementId: 'G-7K9FNZG737',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBWaA3CdoodWslwzOjr8QtkyUDG9GQv0DY',
    appId: '1:954338554494:android:9c652fbe590d9692a45e2f',
    messagingSenderId: '954338554494',
    projectId: 'spotify-quiz-df890',
    databaseURL: 'https://spotify-quiz-df890-default-rtdb.firebaseio.com',
    storageBucket: 'spotify-quiz-df890.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBX-pKlVcLZkteNFF1ZylFUmNcssk54IUk',
    appId: '1:954338554494:ios:56afef043f3cdc41a45e2f',
    messagingSenderId: '954338554494',
    projectId: 'spotify-quiz-df890',
    databaseURL: 'https://spotify-quiz-df890-default-rtdb.firebaseio.com',
    storageBucket: 'spotify-quiz-df890.appspot.com',
    iosClientId: '954338554494-gk8p39qa1pfhvq953f21637ggu01tl6f.apps.googleusercontent.com',
    iosBundleId: 'com.example.spotifyQuiz',
  );
}
