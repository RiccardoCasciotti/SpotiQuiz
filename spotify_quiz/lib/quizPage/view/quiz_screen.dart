import 'package:flutter/material.dart';
import '../../models/answer.dart';
import '../../models/question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
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
        Container(
          alignment: Alignment.center,
          height: 200,
          width: double.infinity,
          child: Question(
            questions[questionIndex]['questionText'].toString(),
          ),
        ),
        const SizedBox(
          height: 100,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ...(questions[questionIndex]['answers']
                    as List<Map<String, Object>>)
                .map((answer) {
              return Answer(() => answerQuestion!(answer['score']),
                  answer['text'].toString());
            })
          ],
        ), //Question
      ],
    ); //Column
  }
}
