import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:spotify_quiz/utility/utilities.dart' as utilities;

import 'quiz_screen.dart';
import 'result_screen.dart';

class QuizPageTablet extends StatefulWidget {
  const QuizPageTablet({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _QuizPageTabletState();
  }
}

class _QuizPageTabletState extends State<QuizPageTablet> {
  final _questions = const [
    {
      'questionText': 'Q1. Who created Flutter?',
      'answers': [
        {'text': 'Facebook', 'score': -2},
        {'text': 'Adobe', 'score': -2},
        {'text': 'Google', 'score': 10},
        {'text': 'Microsoft', 'score': -2},
      ],
    },
    {
      'questionText': 'Q2. What is Flutter?',
      'answers': [
        {'text': 'Android Development Kit', 'score': -2},
        {'text': 'IOS Development Kit', 'score': -2},
        {'text': 'Web Development Kit', 'score': -2},
        {
          'text':
              'SDK to build beautiful IOS, Android, Web & Desktop Native Apps',
          'score': 10
        },
      ],
    },
    {
      'questionText': ' Q3. Which programing language is used by Flutter',
      'answers': [
        {'text': 'Ruby', 'score': -2},
        {'text': 'Dart', 'score': 10},
        {'text': 'C++', 'score': -2},
        {'text': 'Kotlin', 'score': -2},
      ],
    },
    {
      'questionText': 'Q4. Who created Dart programing language?',
      'answers': [
        {'text': 'Lars Bak and Kasper Lund', 'score': 10},
        {'text': 'Brendan Eich', 'score': -2},
        {'text': 'Bjarne Stroustrup', 'score': -2},
        {'text': 'Jeremy Ashkenas', 'score': -2},
      ],
    },
    {
      'questionText':
          'Q5. Is Flutter for Web and Desktop available in stable version?',
      'answers': [
        {
          'text': 'Yes',
          'score': -2,
        },
        {'text': 'No', 'score': 10},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;
  var _questionScore = 0;
  var _hasAnswered = false;

  void _goHome() {
    Navigator.pop(context);
    /*setState(() {
      _questionIndex = 0;
      _totalScore = 0;
      _questionScore = 0;
    });*/
  }

  void _moveOn() {
    setState(() {
      _hasAnswered = false;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
      _questionScore = score;
      _hasAnswered = true;
    });
    // ignore: avoid_print
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: utilities.secondaryColor,
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: _hasAnswered
              ? PageTransitionSwitcher(
                  duration: const Duration(milliseconds: 500),
                  transitionBuilder: (child, animation, secondaryAnimation) =>
                      SharedAxisTransition(
                        animation: animation,
                        secondaryAnimation: secondaryAnimation,
                        fillColor: utilities.secondaryColor,
                        transitionType: SharedAxisTransitionType.horizontal,
                        child: child,
                      ),
                  child: ResultTablet(
                      _totalScore, _questionScore, _goHome, _moveOn)) //Quiz
              : PageTransitionSwitcher(
                  duration: const Duration(milliseconds: 500),
                  transitionBuilder: (child, animation, secondaryAnimation) =>
                      SharedAxisTransition(
                    animation: animation,
                    secondaryAnimation: secondaryAnimation,
                    fillColor: utilities.secondaryColor,
                    transitionType: SharedAxisTransitionType.horizontal,
                    child: child,
                  ),
                  child: QuizTablet(
                    answerQuestion: _answerQuestion,
                    questionIndex: _questionIndex,
                    questions: _questions,
                  ),
                ),
        ), //Padding
      ), //Scaffold
      debugShowCheckedModeBanner: false,
    ); //MaterialApp
  }
}
