import 'package:flutter/material.dart';
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
    return MediaQuery.of(context).orientation == Orientation.portrait
        ? Column(
            children: [
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                child: Question(
                  questions![questionIndex]['questionText'].toString(),
                ),
              ),
              if (questions![questionIndex]['image'] != null)
                Container(
                  alignment: Alignment.center,
                  width: 300,
                  height: 300,
                  child: Image.network(
                      (questions![questionIndex]['image'] as model.Image).url,
                      height:
                          (questions![questionIndex]['image'] as model.Image)
                              .heigth
                              .toDouble(),
                      width: (questions![questionIndex]['image'] as model.Image)
                          .width
                          .toDouble()),
                ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ...(questions![questionIndex]['answers']).map((answer) {
                    return Answer(() => answerQuestion!(answer['score']),
                        answer['text'].toString());
                  })
                ],
              )
            ],
          )
        : Column(
            children: [
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                child: QuestionHorizontal(
                  questions![questionIndex]['questionText'].toString(),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  if (questions![questionIndex]['image'] != null)
                    Container(
                      alignment: Alignment.center,
                      width: 250,
                      height: 250,
                      child: Image.network(
                          (questions![questionIndex]['image'] as model.Image)
                              .url,
                          height: (questions![questionIndex]['image']
                                  as model.Image)
                              .heigth
                              .toDouble(),
                          width: (questions![questionIndex]['image']
                                  as model.Image)
                              .width
                              .toDouble()),
                    ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ...(questions![questionIndex]['answers']).map((answer) {
                        return AnswerHorizontal(
                            () => answerQuestion!(answer['score']),
                            answer['text'].toString());
                      })
                    ],
                  )
                ],
              )
            ],
          );
  }
}
