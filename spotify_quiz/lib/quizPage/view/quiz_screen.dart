import 'package:flutter/material.dart';
import 'package:spotify_quiz/quizPage/view/quiz_screen_a.dart';
import 'package:spotify_quiz/quizPage/view/quiz_screen_b.dart';
import 'package:spotify_quiz/quizPage/view/quiz_screen_c.dart';
import 'package:spotify_quiz/quizPage/view/quiz_screen_d.dart';
import '../../custom_widgets/text.dart';
import '../components/answer.dart';
import '../components/question.dart';
import 'package:spotify_quiz/models/models.dart' as model;

class Quiz extends StatelessWidget {
  final List<dynamic>? questions;
  final int questionIndex;
  final Function? answerQuestion;

  const Quiz({
    Key? key,
    required this.questions,
    required this.answerQuestion,
    required this.questionIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(questions![questionIndex]["type"] == "A"){
      return QuizA(questions: questions, answerQuestion: answerQuestion, questionIndex: questionIndex);
    }
    else if(questions![questionIndex]["type"] == "B"){
      return QuizB(questions: questions, answerQuestion: answerQuestion, questionIndex: questionIndex);
    }
    else if(questions![questionIndex]["type"] == "C"){
      return QuizC(questions: questions, answerQuestion: answerQuestion, questionIndex: questionIndex);
    }
    else{
      return QuizD(questions: questions, answerQuestion: answerQuestion, questionIndex: questionIndex);
    }
   //return QuizB(questions: questions, answerQuestion: answerQuestion, questionIndex: questionIndex);
  }
}
