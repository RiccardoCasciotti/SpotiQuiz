

import 'models.dart';

class Question {
  void obj;
  late  String answer;
  late List<String> options;
  late String type;


  Question( String answer, List<String> options, String type, void obj){
     this.answer = answer;
     this.options = options;
     this.type = type;
     this.obj = obj;
     
  }

  dynamic toJson() => {'answer': answer, 'options': options, 'type': type};

  @override
  String toString() {
    return toJson().toString();
  }
}
