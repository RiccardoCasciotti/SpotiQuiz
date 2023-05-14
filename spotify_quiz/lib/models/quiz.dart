import 'models.dart';

class Quiz {
  final String uid;
  final int points;
  final int correct;
  final int wrong;
  final String type;
  final List<Question> questions;

  Quiz({
    required this.uid,
    required this.points,
    required this.correct,
    required this.wrong,
    required this.type,
    required this.questions
  });

  dynamic toJson() => {'uid': uid, 'points': points, 'correct': correct, 'wrong': wrong, "type": type, "questions":questions };

  @override
  String toString() {
    return toJson().toString();
  }
}
