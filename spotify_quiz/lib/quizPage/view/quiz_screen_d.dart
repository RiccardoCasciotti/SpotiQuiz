import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spotify_quiz/utility/question_c_utils.dart';
import '../../custom_widgets/text.dart';
import '../components/answer.dart';
import '../components/question.dart';
import 'package:spotify_quiz/models/models.dart' as model;
import 'package:audioplayers/audioplayers.dart';

class QuizD extends StatefulWidget {
  final List<dynamic>? questions;
  final int questionIndex;
  final Function? answerQuestion;
  final bool isRandom;

  const QuizD({
    Key? key,
    required this.questions,
    required this.answerQuestion,
    required this.questionIndex,
    required this.isRandom,
  }) : super(key: key);

  @override
  State<QuizD> createState() => _QuizDState();
}

class _QuizDState extends State<QuizD> {
  late Source preview_url;
  int maxduration = 0;
  int currentpos = 0;
  String currentpostlabel = "00:00";
  String audioasset = "assets/audio/red-indian-music.mp3";
  bool isplaying = false;
  bool audioplayed = false;
  late Uint8List audiobytes;

  AudioPlayer player = AudioPlayer();

  @override
  void initState() {
    preview_url =
        UrlSource(widget.questions![widget.questionIndex]['preview_url']);

    player.onDurationChanged.listen((Duration d) {
      //get the duration of audio
      maxduration = d.inMilliseconds;
      setState(() {});
    });
    player.onPositionChanged.listen((Duration p) async {
      currentpos = p.inMilliseconds; //get the current position of playing audio

      if (currentpos > (maxduration - maxduration / 4)) {
        await player.stop();
        setState(() {
          isplaying = false;
          audioplayed = false;
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait
        ? Column(
            children: [
              if (widget.isRandom)
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  child: Question(
                    widget.questions![widget.questionIndex]['questionText']
                        .toString(),
                  ),
                ),
              if (widget.questions![widget.questionIndex]['image'] != null)
                Container(
                  alignment: Alignment.center,
                  width: 200,
                  height: 200,
                  child: Image.network(
                      (widget.questions![widget.questionIndex]['image']
                              as model.Image)
                          .url,
                      height: (widget.questions![widget.questionIndex]['image']
                              as model.Image)
                          .heigth
                          .toDouble(),
                      width: (widget.questions![widget.questionIndex]['image']
                              as model.Image)
                          .width
                          .toDouble()),
                ),
              Container(
                child: Wrap(
                  spacing: 10,
                  children: [
                    ElevatedButton.icon(
                        onPressed: () async {
                          if (!isplaying && !audioplayed) {
                            await player.play(preview_url);

                            setState(() {
                              isplaying = false;
                              audioplayed = false;
                              currentpos = 0;
                            });

                            setState(() {
                              isplaying = true;
                              audioplayed = true;
                            });
                          } else if (audioplayed && !isplaying) {
                            await player.resume();

                            setState(() {
                              isplaying = true;
                              audioplayed = true;
                            });
                          } else {
                            await player.pause();

                            setState(() {
                              isplaying = false;
                            });
                          }
                        },
                        icon: Icon(isplaying ? Icons.pause : Icons.play_arrow),
                        label: Text(isplaying ? "Pause" : "Play")),
                    ElevatedButton.icon(
                        onPressed: () async {
                          await player.stop();
                          //stop success
                          setState(() {
                            isplaying = false;
                            audioplayed = false;
                            currentpos = 0;
                          });
                        },
                        icon: Icon(Icons.stop),
                        label: Text("Stop")),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ...(widget.questions![widget.questionIndex]['answers'])
                      .map((answer) {
                    return Answer(() => widget.answerQuestion!(answer['score']),
                        answer['text'].toString(), player.stop);
                  })
                ],
              )
            ],
          )
        : Column(
            children: [
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                child: QuestionHorizontal(
                  widget.questions![widget.questionIndex]['questionText']
                      .toString(),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  if (widget.questions![widget.questionIndex]['image'] != null)
                    Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 200,
                          height: 200,
                          child: Image.network(
                            (widget.questions![widget.questionIndex]['image']
                                    as model.Image)
                                .url,
                          ),
                        ),
                        Wrap(
                          spacing: 10,
                          children: [
                            ElevatedButton.icon(
                                onPressed: () async {
                                  if (!isplaying && !audioplayed) {
                                    await player.play(preview_url);

                                    setState(() {
                                      isplaying = false;
                                      audioplayed = false;
                                      currentpos = 0;
                                    });

                                    setState(() {
                                      isplaying = true;
                                      audioplayed = true;
                                    });
                                  } else if (audioplayed && !isplaying) {
                                    await player.resume();

                                    setState(() {
                                      isplaying = true;
                                      audioplayed = true;
                                    });
                                  } else {
                                    await player.pause();

                                    setState(() {
                                      isplaying = false;
                                    });
                                  }
                                },
                                icon: Icon(
                                    isplaying ? Icons.pause : Icons.play_arrow),
                                label: Text(isplaying ? "Pause" : "Play")),
                            ElevatedButton.icon(
                                onPressed: () async {
                                  await player.stop();
                                  //stop success
                                  setState(() {
                                    isplaying = false;
                                    audioplayed = false;
                                    currentpos = 0;
                                  });
                                },
                                icon: Icon(Icons.stop),
                                label: Text("Stop")),
                          ],
                        ),
                      ],
                    ),
                  // Container(
                  //   alignment: Alignment.center,
                  //   width: double.infinity,
                  //   child: CustomText(
                  //     text:
                  //         questions![questionIndex]['questionText'].toString(),
                  //     size: 14,
                  //     alignCenter: true,
                  //     thirdColor: true,
                  //   ),
                  // ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ...(widget.questions![widget.questionIndex]['answers'])
                          .map((answer) {
                        return AnswerHorizontal(
                            () => widget.answerQuestion!(answer['score']),
                            answer['text'].toString(),
                            player.stop);
                      })
                    ],
                  )
                ],
              )
            ],
          );
  }
}
