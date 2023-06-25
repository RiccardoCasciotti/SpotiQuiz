import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:spotify_quiz/main.dart' as app;
import 'package:spotify_quiz/models/album.dart';
import 'package:spotify_quiz/models/artist.dart';
import 'package:spotify_quiz/models/event.dart';
import 'package:spotify_quiz/models/models.dart';
import 'package:spotify_quiz/models/track.dart';
import 'package:spotify_quiz/repositories/user/user_repository.dart';
import 'package:spotify_quiz/utility/api_calls.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:spotify_quiz/repositories/firebase_options.dart';

import 'package:spotify_quiz/utility/utilities.dart' as utilities;

void main() async {
  app.main();

  // ignore: unused_local_variable
  final fbApp = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  WidgetsFlutterBinding.ensureInitialized();

  utilities.runningTest = true;
  UserRepository userRepo = UserRepository();
  await dotenv.load(fileName: ".env");

  utilities.refreshToken = dotenv.env['TEST_REFRESH_TOKEN']!;

  await utilities.getNewAccessToken();
  
  test('getUsers()', () async {
    //setup

    List<User> result = await userRepo.getUsers();

    //test
    expect(result.isEmpty, false);
  });

  test('Call success: getUsersByNation()', () async {
    //setup

    List<User> result = await userRepo.getUsersByNation("IT");

    //test
    expect(result.isEmpty, false);
  });

  test('Call failure: getUsersByNation()', () async {
    //setup

    List<User> result = await userRepo.getUsersByNation("ITalianooooooo");

    //test
    expect(result.isEmpty, true);
  });

  test('Call success: getByID()', () async {
    //setup

    User? result = await userRepo.getByID("natsivan");

    //test
    expect(result != null, true);
  });

  test('Call failure: getByID()', () async {
    //setup

    User? result = await userRepo.getByID("natsivanOOOO");

    //test
    expect(result != null, false);
  });

  test('NumOfQuiz updated: UpdateAfterQuizOnDB()', () async {
    //setup
    User testUser = User(
        uid: 'natsivan',
        username: 'natsivan',
        level: 293,
        numberQuiz: 373,
        experience: 58770,
        bestScore: 292,
        nation: "IT",
        correctAnswer: 1047,
        wrongAnswer: 2736,
        refreshToken: utilities.refreshToken);
    User result = await userRepo.UpdateAfterQuizOnDB(testUser, 7, 5, 10);

    //test
    expect(result.numberQuiz == 374, true);
  });

  test('Wrong Answers updated: UpdateAfterQuizOnDB()', () async {
    //setup
    User testUser =   User(
        uid: 'natsivan',
        username: 'natsivan',
        level: 293,
        numberQuiz: 373,
        experience: 58770,
        bestScore: 292,
        nation: "IT",
        correctAnswer: 1047,
        wrongAnswer: 2736,
        refreshToken:
            utilities.refreshToken);
    User result = await userRepo.UpdateAfterQuizOnDB(testUser, 7, 5, 10);

    //test
    expect(result.wrongAnswer == 2741, true);
  });

  test('Correct Answers updated: UpdateAfterQuizOnDB()', () async {
    //setup
    User testUser =   User(
        uid: 'natsivan',
        username: 'natsivan',
        level: 293,
        numberQuiz: 373,
        experience: 58770,
        bestScore: 292,
        nation: "IT",
        correctAnswer: 1047,
        wrongAnswer: 2736,
        refreshToken:
            utilities.refreshToken);
    User result = await userRepo.UpdateAfterQuizOnDB(testUser, 7, 5, 10);

    //test
    expect(result.correctAnswer == 1054, true);
  });

  test('Best Score updated: UpdateAfterQuizOnDB()', () async {
    //setup
    User testUser =   User(
        uid: 'natsivan',
        username: 'natsivan',
        level: 293,
        numberQuiz: 373,
        experience: 58770,
        bestScore: 292,
        nation: "IT",
        correctAnswer: 1047,
        wrongAnswer: 2736,
        refreshToken:
            utilities.refreshToken);
    User result = await userRepo.UpdateAfterQuizOnDB(testUser, 7, 5, 10);

    //test
    expect(result.bestScore == 292, true);
  });

  test('Experience updated: UpdateAfterQuizOnDB()', () async {
    //setup
    User testUser =   User(
        uid: 'natsivan',
        username: 'natsivan',
        level: 293,
        numberQuiz: 373,
        experience: 58770,
        bestScore: 292,
        nation: "IT",
        correctAnswer: 1047,
        wrongAnswer: 2736,
        refreshToken:
            utilities.refreshToken);
    User result = await userRepo.UpdateAfterQuizOnDB(testUser, 7, 5, 10);

    //test
    expect(result.experience == 58770 + 30 * 7 + 10 * 5, true);
  });

  test('Level updated: UpdateAfterQuizOnDB()', () async {
    //setup
    User testUser =   User(
        uid: 'natsivan',
        username: 'natsivan',
        level: 293,
        numberQuiz: 373,
        experience: 58770,
        bestScore: 292,
        nation: "IT",
        correctAnswer: 1047,
        wrongAnswer: 2736,
        refreshToken:
            utilities.refreshToken);
    User result = await userRepo.UpdateAfterQuizOnDB(testUser, 7, 5, 10);

    //test
    expect(result.level == ((58770 + 30 * 7 + 10 * 5) / 200).floor(), true);
  });

  test('apiGetUser()', () async {
    //setup

    User result = await userRepo.apiGetUser(
        utilities.accessToken, utilities.refreshToken);

    //If we retrieved the right user, the refreshToken should be the same
    //test
    expect(result.refreshToken == utilities.refreshToken, true);
  });
}
