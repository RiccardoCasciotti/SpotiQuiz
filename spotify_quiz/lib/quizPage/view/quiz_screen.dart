import 'package:flutter/material.dart';
import 'package:spotify_quiz/quizPage/components/playbuttonquiz.dart';
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
    return Column(
      children: [
        Flexible(
          flex: 1,
          child: Container(
            alignment: Alignment.center,
            width: double.infinity,
            child: Question(
              questions![questionIndex]['questionText'].toString(),
            ),
          ),
        ),
        if (questions![questionIndex]['playButton'] != null)
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              child: const PlayButtonQuiz(),
            ),
          ),
        if (questions![questionIndex]['image'] == null)
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              child: Image.network(
                  (questions![questionIndex]['image'] as model.Image).url,
                  height: (questions![questionIndex]['image'] as model.Image)
                      .heigth
                      .toDouble(),
                  width: (questions![questionIndex]['image'] as model.Image)
                      .width
                      .toDouble()),
            ),
          ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ...(questions![questionIndex]['answers']).map((answer) {
              return Answer(() => answerQuestion!(answer['score']),
                  answer['text'].toString());
            })
          ],
        ),
      ],
    );
  }
}
