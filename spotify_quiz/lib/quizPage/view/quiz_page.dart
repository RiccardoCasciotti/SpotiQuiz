import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_quiz/quizPage/components/question.dart';
import 'package:spotify_quiz/utility/utilities.dart' as utilities;
import 'package:spotify_quiz/utility/quiz_utils.dart' as quiz_utils;

import 'package:spotify_quiz/authentication/bloc/authentication_bloc.dart';
import 'package:spotify_quiz/repositories/user/user_repository.dart';

import '../../custom_widgets/text.dart';
import '../controllers/question_controller.dart';
import 'quiz_screen.dart';
import 'result_screen.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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

// ignore: must_be_immutable

int limit = quiz_utils.limit;

class QuizPage extends StatefulWidget {
  String selectedMode;

  QuizPage({
    required this.selectedMode,
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _QuizPageState();
  }
}

class _QuizPageState extends State<QuizPage> {
  // ignore: prefer_typing_uninitialized_variables
  //Future<List<Map<String, Object>>> _questions = createQuestions(widget.selectedMode);
  Future<List<dynamic>>? _questions;

  @override
  void initState() {
    _questions = createQuestions(widget.selectedMode);
    super.initState();
    //List<Map<String, Object>> questions = [];
  }

  var _questionIndex = 0;
  var _totalScore = 0;
  var _wrongAnswers = 0;
  var _correctAnswers = 0;
  var _questionScore = 0;
  var _hasAnswered = false;
  // ignore: prefer_typing_uninitialized_variables
  var _secondSlotQuestions;

  Future<void> _answerQuestion(int score) async {
    print("QuestionIndex");
    print(_questionIndex);
    //FUNCTION WE CALL WHEN WE GIVE AN ANSWER, HERE WE CAN IMPLEMENT THE LOGIC TO CREATE NEW QUESTIONS
    if ((_questionIndex + 1) % limit == 1) {
      print("Create Second List");
      _secondSlotQuestions = createQuestions(widget.selectedMode);
    }
    if (score > 0) {
      _correctAnswers++;
    } else {
      _wrongAnswers++;
    }
    _totalScore += score;

    if ((_questionIndex + 1) % limit == 0) {
      print(_questionIndex);
      print("Populating First List");
      _questions = _secondSlotQuestions;
    }

    setState(() {
      _questionIndex = (_questionIndex + 1) % limit;
      _questionScore = score;
      _hasAnswered = true;
    });
  }

  void moveOn() {
    //WE DECIDE TO CONTINUE WITH NEW QUESTIONS
    setState(() {
      _hasAnswered = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Future<void> goHome() async {
      _questionIndex = 0;
      UserRepository userRepository = UserRepository();
      context.read<AuthenticationBloc>().user =
          await userRepository.UpdateAfterQuizOnDB(
                  context.read<AuthenticationBloc>().user,
                  _correctAnswers,
                  _wrongAnswers,
                  _totalScore)
              .whenComplete(() => Navigator.pop(context));
    }

    return Scaffold(
      backgroundColor: utilities.secondaryColor,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30.0),
          child: FutureBuilder<List<dynamic>>(
            future: _questions, // a previously-obtained Future<String> or null
            builder:
                (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  print("Error ${snapshot.error}");
                }
                if (snapshot.hasData) {
                  if (snapshot.hasData == false) {
                    print("NO DATAAA");
                  }
                  //print("DATAAAAAA ${snapshot.data}");
                  return _hasAnswered
                      ? PageTransitionSwitcher(
                          duration: const Duration(milliseconds: 500),
                          transitionBuilder:
                              (child, animation, secondaryAnimation) =>
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
                            goHome,
                            moveOn,
                          ),
                        )
                      : PageTransitionSwitcher(
                          duration: const Duration(milliseconds: 500),
                          transitionBuilder:
                              (child, animation, secondaryAnimation) =>
                                  SharedAxisTransition(
                                    animation: animation,
                                    secondaryAnimation: secondaryAnimation,
                                    fillColor: utilities.secondaryColor,
                                    transitionType:
                                        SharedAxisTransitionType.horizontal,
                                    child: child,
                                  ),
                          child: Quiz(
                            answerQuestion: _answerQuestion,
                            questionIndex: _questionIndex,
                            questions: snapshot.data,
                          ));
                } else {
                  return PageTransitionSwitcher(
                    duration: const Duration(milliseconds: 500),
                    transitionBuilder: (child, animation, secondaryAnimation) =>
                        SharedAxisTransition(
                      animation: animation,
                      secondaryAnimation: secondaryAnimation,
                      fillColor: utilities.secondaryColor,
                      transitionType: SharedAxisTransitionType.horizontal,
                      child: child,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 60,
                          height: 60,
                          child: CircularProgressIndicator(),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: CustomText(
                            text: 'No data snapshot...',
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  );
                }
              } else {
                return PageTransitionSwitcher(
                  duration: const Duration(milliseconds: 500),
                  transitionBuilder: (child, animation, secondaryAnimation) =>
                      SharedAxisTransition(
                    animation: animation,
                    secondaryAnimation: secondaryAnimation,
                    fillColor: utilities.secondaryColor,
                    transitionType: SharedAxisTransitionType.horizontal,
                    child: child,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 60,
                        height: 60,
                        child: CircularProgressIndicator(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: CustomText(
                          text: AppLocalizations.of(context)!.createquiz,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
