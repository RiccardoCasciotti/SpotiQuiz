


class Question {
  void obj;
  late  String answer;
  late List<String> options;
  late String type;


  Question( this.answer, this.options, this.type, this.obj);

  dynamic toJson() => {'answer': answer, 'options': options, 'type': type};

  @override
  String toString() {
    return toJson().toString();
  }
}
