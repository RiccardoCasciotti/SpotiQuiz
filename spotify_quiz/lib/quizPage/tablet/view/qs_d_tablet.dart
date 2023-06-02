import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spotify_quiz/utility/question_c_utils.dart';
import 'package:flutter/material.dart';
import 'package:spotify_quiz/quizPage/components/answer.dart';
import '../../../custom_widgets/text.dart';
import '../components/answer.dart';
import '../components/question.dart';
import 'package:spotify_quiz/utility/utilities.dart' as utilities;
import 'package:spotify_quiz/models/models.dart' as model;

class QuizDtablet extends StatefulWidget {
  final List<dynamic>? questions;
  final int questionIndex;
  final Function? answerQuestion;
  final bool isRandom;

  const QuizDtablet({
    Key? key,
    required this.questions,
    required this.answerQuestion,
    required this.questionIndex,
    required this.isRandom,
  }) : super(key: key);

  @override
  State<QuizDtablet> createState() => _QuizDtabletState();
}

class _QuizDtabletState extends State<QuizDtablet> {
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
                CustomText(
                  size: 30,
                  thirdColor: true,
                  bold: true,
                  text: widget.questions![widget.questionIndex]['questionText']
                      .toString(),
                ),
              const SizedBox(
                height: 40,
              ),
              if (widget.questions![widget.questionIndex]['image'] != null)
                Container(
                  alignment: Alignment.center,
                  width: 300,
                  height: 300,
                  child: Image.network(
                    (widget.questions![widget.questionIndex]['image']
                            as model.Image)
                        .url,
                  ),
                ),
              const SizedBox(
                height: 40,
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
                      ...(widget.questions![widget.questionIndex]['answers'])
                          .map((answer) {
                        final index = (widget.questions![widget.questionIndex]
                                    ['answers'])
                                .indexOf(answer) +
                            1;
                        return AnswerTablet(
                            key: Key("AnswerQuestion$index"),
                            () => widget.answerQuestion!(answer['score']),
                            answer['text'].toString(),
                            null);
                      })
                    ],
                  )),
              const SizedBox(
                height: 80,
              ),
              Wrap(
                spacing: 10,
                children: [
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(padding: EdgeInsets.all(10)),
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
                      label: Text(
                      isplaying ? "Pause" : "Play",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.openSans(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                      ),),),
                  
                  const SizedBox(
                    width: 20,
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(padding: EdgeInsets.all(10)),
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
                    label: Text(
                      "Stop",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.openSans(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  )
                ],
              ),
            ],
          )
        : Column(
            children: [
              if (widget.isRandom)
                CustomText(
                  size: 30,
                  thirdColor: true,
                  bold: true,
                  text: widget.questions![widget.questionIndex]['questionText']
                      .toString(),
                ),
              const SizedBox(
                height: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      if (widget.questions![widget.questionIndex]['image'] !=
                          null)
                        Container(
                          alignment: Alignment.center,
                          width: 280,
                          height: 280,
                          child: Image.network(
                            (widget.questions![widget.questionIndex]['image']
                                    as model.Image)
                                .url,
                          ),
                        ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                            label: Text(
                      isplaying ? "Pause" : "Play",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.openSans(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
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
                            label: Text(
                      "Stop",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.openSans(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                      ),)
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
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
                      ...(widget.questions![widget.questionIndex]['answers'])
                          .map((answer) {
                        final index = (widget.questions![widget.questionIndex]
                                    ['answers'])
                                .indexOf(answer) +
                            1;
                        return AnswerTablet(
                            key: Key("AnswerQuestion$index"),
                            () => widget.answerQuestion!(answer['score']),
                            answer['text'].toString(),
                            null);
                      })
                    ],
                  )),
                  
                ],
              )
            ],
          );
  }
}
