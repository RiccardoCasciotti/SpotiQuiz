import 'package:flutter/material.dart';
import '../../custom_widgets/text.dart';
import '../components/answer.dart';
import '../components/question.dart';
import 'package:spotify_quiz/models/models.dart' as model;

class QuizB extends StatelessWidget {
  final List<dynamic>? questions;
  final int questionIndex;
  final Function? answerQuestion;

  const QuizB({
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
                  width: 200,
                  height: 200,
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
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                child: Question(
                  questions![questionIndex]['song_title'].toString(),
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
                      width: 150,
                      height: 150,
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
                  // Container(
                  //   alignment: Alignment.center,
                  //   width: double.infinity,
                  //   child: CustomText(
                  //     text:
                  //         questions![questionIndex]['questionText'].toString(),
                  //     size: 14,
                  //     alignCenter: true,
                  //     thirdColor: true,
                  //   ),
                  // ),
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
