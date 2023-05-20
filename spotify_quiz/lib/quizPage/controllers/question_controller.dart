import 'package:flutter/material.dart';
import '../../utility/quiz_utils.dart';
import '../../models/models.dart' as model;


Map<String, Object> format_a(model.Question q){

  const qText = "Who is the following artist?";
  var answers = [];
  for( var i = 0; i < q.options.length; i ++ ){
    answers.add({"text" : q.options[i], "score": -2});
  }
  answers.add({"text" : q.answer, "score": 10});
  answers.shuffle();
  model.Image image = (q.obj as model.Artist).images![1];


return {
      'questionText': qText,
      'answers': answers,
      'image' : image
    };

}




 Future<List<dynamic>> createQuestions(int selectedMode) async{
  // ASK TO MODIFY FROM NUMBERS TO LETTERS

  var questionsList = [];
  if( selectedMode == 1 ){

    model.Quiz quiz_a = await generate_quiz("A");

    for( var i = 0; i < quiz_a.questions.length; i++){
      questionsList.add(format_a(quiz_a.questions[i]));
    }
  

 }
  return questionsList;

  // return [
  //   {
  //     'questionText': 'In which year album X was released?',
  //     'answers': [
  //       {'text': '1920', 'score': -2},
  //       {'text': '1400', 'score': -2},
  //       {'text': '800', 'score': 10},
  //       {'text': '9444', 'score': -2},
  //     ]..shuffle(),
  //   },
  //   {
  //     'questionText': 'Is this song made by this artist?',
  //     'answers': [
  //       {'text': 'Yes', 'score': -2},
  //       {'text': 'No', 'score': 10},
  //     ]..shuffle(),
  //   },
  //   {
  //     'questionText': 'Which is this song?',
  //     'playButton': true,
  //     'answers': [
  //       {'text': '1920', 'score': -2},
  //       {'text': '1400', 'score': -2},
  //       {'text': '800', 'score': 10},
  //       {'text': '9444', 'score': -2},
  //     ]..shuffle(),
  //   },
  //   {
  //     'questionText': 'How many albums has artist X released?',
  //     'answers': [
  //       {'text': '4', 'score': -2},
  //       {'text': '3', 'score': -2},
  //       {'text': '1', 'score': -2},
  //       {'text': '0', 'score': 10},
  //     ]..shuffle(),
  //   },
  //   {
  //     'questionText': 'How many songs has artist X released?',
  //     'answers': [
  //       {'text': '43', 'score': -2},
  //       {'text': '21', 'score': 10},
  //       {'text': '90', 'score': -2},
  //       {'text': '5', 'score': -2},
  //     ]..shuffle(),
  //   },
  //   {
  //     'questionText': 'Of which albums is this song part of?',
  //     'answers': [
  //       {'text': 'Chtulu', 'score': 10},
  //       {'text': 'Draconic', 'score': -2},
  //       {'text': 'Fish and Chips', 'score': -2},
  //       {'text': 'Jeremy Ashkenas', 'score': -2},
  //     ]..shuffle(),
  //   },
  //   {
  //     'questionText': 'When was this song released?',
  //     'answers': [
  //       {'text': '1980', 'score': 10},
  //       {'text': '2012', 'score': -2},
  //       {'text': '2013', 'score': -2},
  //       {'text': '2020', 'score': -2},
  //     ]..shuffle(),
  //   },
  //   {
  //     'questionText': 'How many songs are in this album?',
  //     'answers': [
  //       {'text': '90', 'score': 10},
  //       {'text': '32', 'score': -2},
  //       {'text': '21', 'score': -2},
  //       {'text': '11', 'score': -2},
  //     ]..shuffle(),
  //   },
  //   {
  //     'questionText': 'Who made this song?',
  //     'answers': [
  //       {'text': 'Alec', 'score': 10},
  //       {'text': 'Ric', 'score': -2},
  //       {'text': 'Brumbrum', 'score': -2},
  //       {'text': 'Fiki', 'score': -2},
  //     ]..shuffle(),
  //   },
  // ]..shuffle();
}
