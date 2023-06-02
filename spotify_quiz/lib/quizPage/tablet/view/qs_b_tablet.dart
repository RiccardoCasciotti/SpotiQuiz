import 'package:flutter/material.dart';
import 'package:spotify_quiz/quizPage/components/answer.dart';
import '../../../custom_widgets/text.dart';
import '../components/answer.dart';
import '../components/question.dart';
import 'package:spotify_quiz/utility/utilities.dart' as utilities;
import 'package:spotify_quiz/models/models.dart' as model;

class QuizBtablet extends StatelessWidget {
  final List<dynamic>? questions;
  final int questionIndex;
  final Function? answerQuestion;
  final bool isRandom;

  const QuizBtablet({
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
                  size: 30,
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
                  width: 300,
                  height: 300,
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
                size: 25,
                thirdColor: true,
                bold: true,
                text: questions![questionIndex]['song_title'].toString(),
              ),
              Flexible(
                flex: 0, 
          
          child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: 4,
                children: [
                  ...(questions![questionIndex]['answers']).map((answer) {
                    final index =
                        (questions![questionIndex]['answers']).indexOf(answer) +
                            1;
                    return AnswerTablet(
                        key: Key("AnswerQuestion$index"),
                        () => answerQuestion!(answer['score']),
                        answer['text'].toString(),
                        null);
                  })
                ],
              ))
            ],
          )
        : Column(
            children: [
              if (isRandom)
                CustomText(
                  size: 30,
                  thirdColor: true,
                  bold: true,
                  text: questions![questionIndex]['questionText'].toString(),
                ),
              Column(
                
                children: [
                  if (questions![questionIndex]['image'] != null)
                    Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 300,
                          height: 300,
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
                          
                          child: CustomText(
                            alignCenter: true,
                            size: 25,
                            bold: true,
                            thirdColor: true,
                            text: questions![questionIndex]['song_title']
                                .toString(),
                          ),
                        ),
                      ],
                    ),
                  Flexible(
                      flex: 0,
                      child: GridView.count(
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        childAspectRatio: 4,
                        children: [
                          ...(questions![questionIndex]['answers'])
                              .map((answer) {
                            final index = (questions![questionIndex]['answers'])
                                    .indexOf(answer) +
                                1;
                            return AnswerHorizontalTablet(
                                key: Key("AnswerQuestionHorizontal$index"),
                                () => answerQuestion!(answer['score']),
                                answer['text'].toString(),
                                null);
                          })
                        ],
                      ))
                ],
              )
            ],
          );
  }
}
