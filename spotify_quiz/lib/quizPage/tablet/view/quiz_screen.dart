import 'package:flutter/material.dart';
import '../components/answer.dart';
import '../components/question.dart';

class QuizTablet extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function? answerQuestion;

  const QuizTablet({
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
            child: QuestionTablet(
              questions[questionIndex]['questionText'].toString(),
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: 4,
            children: [
              ...(questions[questionIndex]['answers']
                      as List<Map<String, Object>>)
                  .map((answer) {
                return AnswerTablet(() => answerQuestion!(answer['score']),
                    answer['text'].toString());
              })
            ],
          ),
        ),
      ],
    );
  }
}
