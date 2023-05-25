import 'package:flutter/material.dart';
import '../../custom_widgets/text.dart';
import '../components/answer.dart';
import '../components/question.dart';
import 'package:spotify_quiz/utility/utilities.dart' as utilities;
import 'package:spotify_quiz/models/models.dart' as model;

class QuizB extends StatelessWidget {
  final List<dynamic>? questions;
  final int questionIndex;
  final Function? answerQuestion;
  final bool isRandom;

  const QuizB({
    Key? key,
    required this.questions,
    required this.answerQuestion,
    required this.questionIndex,
    required this.isRandom,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait
        ? Column(
            children: [
              if (isRandom)
                CustomText(
                  size: 20,
                  thirdColor: true,
                  bold: true,
                  text: questions![questionIndex]['questionText'].toString(),
                ),
              const SizedBox(
                height: 20,
              ),
              if (questions![questionIndex]['image'] != null)
                Container(
                  alignment: Alignment.center,
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                          (questions![questionIndex]['image'] as model.Image)
                              .url,
                        ),
                        fit: BoxFit.fill),
                    border: Border.all(
                      color: utilities.tertiaryColor,
                      width: 1,
                    ),
                  ),
                ),
              const SizedBox(
                height: 20,
              ),
              CustomText(
                alignCenter: true,
                size: 20,
                thirdColor: true,
                bold: true,
                text: questions![questionIndex]['song_title'].toString(),
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
              if (isRandom)
                CustomText(
                  size: 20,
                  thirdColor: true,
                  bold: true,
                  text: questions![questionIndex]['questionText'].toString(),
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  if (questions![questionIndex]['image'] != null)
                    Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                  (questions![questionIndex]['image']
                                          as model.Image)
                                      .url,
                                ),
                                fit: BoxFit.fill),
                            border: Border.all(
                              color: utilities.tertiaryColor,
                              width: 1,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: 300,
                          height: 50,
                          child: CustomText(
                            alignCenter: true,
                            size: 15,
                            bold: true,
                            thirdColor: true,
                            text: questions![questionIndex]['song_title']
                                .toString(),
                          ),
                        ),
                      ],
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
