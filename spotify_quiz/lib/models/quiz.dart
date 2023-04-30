import 'models.dart';

class Quiz {
  final int uid;
  final int points;
  final int correct;
  final int wrong;
  final int typeOfQuiz;

  Quiz({
    required this.uid,
    required this.points,
    required this.correct,
    required this.wrong,
    required this.typeOfQuiz,
  });
}
