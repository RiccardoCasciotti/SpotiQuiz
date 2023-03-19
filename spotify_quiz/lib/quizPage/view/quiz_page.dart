import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:spotify_quiz/utility/utilities.dart' as utilities;

import '../controllers/question_controller.dart';
import 'quiz_screen.dart';
import 'result_screen.dart';

//POSSIBLE QUESTIONS

// In which year album X was released?
// How many albums has artist X released?
// How many songs has artist X released?
// Of which albums is this song part of?
// When was this song released?
// How many songs are in this album?
// Who made this album?
// Who made this song?
// Is this song made by this artist?

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _QuizPageState();
  }
}

class _QuizPageState extends State<QuizPage> {
  var _questions = createQuestions();

  var _questionIndex = 0;
  var _totalScore = 0;
  var _questionScore = 0;
  var _hasAnswered = false;

  void _goHome() {
    //WE DECIDE WE WANT TO GO BACK
    //Here we should store the final result and the various informations,
    //also putting them in the database
    Navigator.pop(context);
  }

  void _moveOn() {
    //WE DECIDE TO CONTINUE WITH NEW QUESTIONS
    setState(() {
      _hasAnswered = false;
    });
  }

  void _answerQuestion(int score) {
    //FUNCTION WE CALL WHEN WE GIVE AN ANSWER, HERE WE CAN IMPLEMENT THE LOGIC TO CREATE NEW QUESTIONS

    _totalScore += score;

    if (_questionIndex + 1 == 5) {
      _questions = createQuestions();
    }

    setState(() {
      _questionIndex = (_questionIndex + 1) % 5;
      _questionScore = score;
      _hasAnswered = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                child: Result(
                  _totalScore,
                  _questionScore,
                  _goHome,
                  _moveOn,
                ),
              )
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
                child: Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions,
                ),
              ),
      ),
    );
  }
}
