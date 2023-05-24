import 'package:flutter/material.dart';
import '../components/answer.dart';
import '../components/question.dart';
import 'package:spotify_quiz/models/models.dart' as model;

class QuizA extends StatelessWidget {
  final List<dynamic>? questions;
  final int questionIndex;
  final Function? answerQuestion;

  const QuizA({
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
                  key: const Key("ImageSinger"),
                  alignment: Alignment.center,
                  width: 300,
                  height: 300,
                  child: Image.network(
                    (questions![questionIndex]['image'] as model.Image).url,
                  ),
                ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ...(questions![questionIndex]['answers']).map((answer) {
                    final index =
                        (questions![questionIndex]['answers']).indexOf(answer) +
                            1;
                    return Answer(
                        key: Key("AnswerQuestion$index"),
                        () => answerQuestion!(answer['score']),
                        answer['text'].toString(),
                        null);
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
                child: Question(
                  questions![questionIndex]['questionText'].toString(),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  if (questions![questionIndex]['image'] != null)
                    Container(
                      key: const Key("ImageSingerHorizontal"),
                      alignment: Alignment.center,
                      width: 250,
                      height: 250,
                      child: Image.network(
                        (questions![questionIndex]['image'] as model.Image).url,
                      ),
                    ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ...(questions![questionIndex]['answers']).map((answer) {
                        final index = (questions![questionIndex]['answers'])
                                .indexOf(answer) +
                            1;
                        return AnswerHorizontal(
                            key: Key("AnswerQuestionHorizontal$index"),
                            () => answerQuestion!(answer['score']),
                            answer['text'].toString(),
                            null);
                      })
                    ],
                  )
                ],
              )
            ],
          );
  }
}
