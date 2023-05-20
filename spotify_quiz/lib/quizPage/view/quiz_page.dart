import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_quiz/utility/utilities.dart' as utilities;
import 'package:spotify_quiz/authentication/bloc/authentication_bloc.dart';
import 'package:spotify_quiz/repositories/user/user_repository.dart';

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

// ignore: must_be_immutable
class QuizPage extends StatefulWidget {
  int selectedMode;

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

  void _answerQuestion(int score) {
    //FUNCTION WE CALL WHEN WE GIVE AN ANSWER, HERE WE CAN IMPLEMENT THE LOGIC TO CREATE NEW QUESTIONS
    if (score > 0) {
      _correctAnswers++;
    } else {
      _wrongAnswers++;
    }
    _totalScore += score;

    if (_questionIndex + 1 == 5) {
      // Future<List<Map<String, Object>>> questions =
      //     createQuestions(widget.selectedMode);
    }

    setState(() {
      _questionIndex = (_questionIndex + 1) % 5;
      _questionScore = score;
      _hasAnswered = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    void moveOn() {
      //WE DECIDE TO CONTINUE WITH NEW QUESTIONS
      setState(() {
        _hasAnswered = false;
      });
    }

    Future<void> goHome() async {
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
        body: Padding(
            padding: const EdgeInsets.all(30.0),
            child: FutureBuilder<List<dynamic>>(
                future:
                    _questions, // a previously-obtained Future<String> or null
                builder: (BuildContext context,
                    AsyncSnapshot<List<dynamic>> snapshot) {
                  List<Widget> children = [];
                  
    if (snapshot.connectionState == ConnectionState.done) {
          
            if(snapshot.hasError){
print("Error ${snapshot.error}");            }
                  if (snapshot.hasData) {
                    print("DATAAAAAA ${snapshot.data}");
                    _hasAnswered
                        ? children = [PageTransitionSwitcher(
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
                            child: Result(
                              _totalScore,
                              _questionScore,
                              _goHome,
                              _moveOn,
                            ),
                          )
                        ]: children = [PageTransitionSwitcher(
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
                            )
                          )];
                  } else {
                    children = const <Widget>[
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: CircularProgressIndicator(),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 16),
                        child: Text('Creating your quiz...', selectionColor: Colors.white70),
                      ),
                    ];
                  }
                  
   } return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: children,
            ),
          );})));
  }
}