import 'package:flutter/material.dart';
import 'package:spotify_quiz/quizPage/tablet/view/qs_a_tablet.dart';
import 'package:spotify_quiz/quizPage/tablet/view/qs_b_tablet.dart';
import 'package:spotify_quiz/quizPage/tablet/view/qs_c_tablet.dart';
import 'package:spotify_quiz/quizPage/tablet/view/qs_d_tablet.dart';
import '../../components/playbuttonquiz.dart';
import '../components/answer.dart';
import '../components/question.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class QuizTablet extends StatelessWidget {
  final List<dynamic>? questions;
  final int questionIndex;
  final Function? answerQuestion;
  final bool isRandom;

  const QuizTablet(
      {Key? key,
      required this.questions,
      required this.answerQuestion,
      required this.questionIndex,
      required this.isRandom})
      : super(key: const Key("QuizScreenPageTablet"));

  @override
  Widget build(BuildContext context) {
    if (questions![questionIndex]["type"] == "A") {
      return QuizAtablet(
        questions: questions,
        answerQuestion: answerQuestion,
        questionIndex: questionIndex,
        isRandom: isRandom,
      );
    } else if (questions![questionIndex]["type"] == "B") {
      return QuizBtablet(
        questions: questions,
        answerQuestion: answerQuestion,
        questionIndex: questionIndex,
        isRandom: isRandom,
      );
    } else if (questions![questionIndex]["type"] == "C") {
      return QuizCtablet(
        questions: questions,
        answerQuestion: answerQuestion,
        questionIndex: questionIndex,
        isRandom: isRandom,
      );
    } else {
      return QuizDtablet(
        questions: questions,
        answerQuestion: answerQuestion,
        questionIndex: questionIndex,
        isRandom: isRandom,
      );
    }
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Column(
  //     children: [
  //       Flexible(
  //         flex: 1,
  //         child: Container(
  //           alignment: Alignment.center,
  //           width: double.infinity,
  //           child: QuestionTablet(
  //             questions[questionIndex]['questionText'].toString(),
  //           ),
  //         ),
  //       ),
  //       if (questions[questionIndex]['playButton'] != null)
  //         Flexible(
  //           flex: 1,
  //           child: Container(
  //             alignment: Alignment.center,
  //             width: double.infinity,
  //             child: const PlayButtonQuiz(),
  //           ),
  //         ),
  //       Flexible(
  //         flex: 1,
  //         child: GridView.count(
  //           crossAxisCount: 2,
  //           crossAxisSpacing: 20,
  //           mainAxisSpacing: 20,
  //           childAspectRatio: 4,
  //           children: [
  //             ...(questions[questionIndex]['answers']
  //                     as List<Map<String, Object>>)
  //                 .map((answer) {
  //               return AnswerTablet(() => answerQuestion!(answer['score']),
  //                   answer['text'].toString());
  //             })
  //           ],
  //         ),
  //       ),
  //     ],
  //   );
  // }
}
