import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:gueszy/api/vocab_service.dart';
import 'package:gueszy/models/index.dart';
import 'package:gueszy/screens/game/score_screen.dart';
import 'package:gueszy/widgets/text_custom.dart';

class GameScreen extends StatefulWidget {
  final Game game;
  const GameScreen({Key? key, required this.game}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  int timeLeft = 3;
  int seconds = 1;
  bool start = false;
  bool tap = true;
  String text = "หันไปทางเพื่อน";
  Color? backgroundColor = Colors.white;
  int wordCount = 0;
  int score = 0;
  List<String> vocabList = [];
  List<int> scoreList = [];

  Vocabularys? vocabs;

  void startTimer() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (timeLeft > 0) {
          timeLeft--;
        } else {
          timer.cancel();
          Get.off(() => ScoreScreen(
                vocabList: vocabList,
                scoreList: scoreList,
                score: score,
              ));
        }
      });
    });
  }

  void readyTimer() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (timeLeft > 0) {
          timeLeft--;
        } else {
          timer.cancel();
          timeLeft = 60;
          start = true;
          text = vocabs!.vocabularys[wordCount].word;
          // text = "คำ $wordCount";
          startTimer();
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    timeLeft = 3;
    seconds = 1;
    start = false;
    tap = true;
    text = "หันไปทางเพื่อน";
    backgroundColor = Colors.white;
    wordCount = 0;
    score = 0;
    vocabList = [];
    scoreList = [];
    VocabServices.getVocab(widget.game.id.toInt()).then((value) {
      setState(() {
        vocabs = value;
        vocabs!.vocabularys.shuffle();
      });
    });

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    readyTimer();
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              decoration: BoxDecoration(color: backgroundColor),
              child: Center(
                child: TextCustom(
                  text,
                  size: 80,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: TextCustom(
                timeLeft.toString(),
                size: 40,
              ),
            ),
            SizedBox(
              height: double.infinity,
              child: start
                  ? Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              tap
                                  ? setState(() {
                                      print("left");
                                      tap = false;
                                      backgroundColor = Colors.green;
                                      text = "ถูกต้อง";
                                      Timer.periodic(
                                          const Duration(milliseconds: 500),
                                          (timer) {
                                        setState(() {
                                          if (seconds > 0) {
                                            seconds--;
                                          } else {
                                            timer.cancel();
                                            backgroundColor = Colors.white;
                                            text = vocabs!
                                                .vocabularys[wordCount].word;
                                            wordCount++;
                                            vocabList.add(text);
                                            scoreList.add(1);
                                            score++;
                                            tap = true;
                                          }
                                        });
                                      });
                                    })
                                  : null;
                            },
                            child: Container(
                              decoration: const BoxDecoration(
                                  color: Colors.transparent),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              tap
                                  ? setState(() {
                                      print("right");
                                      tap = false;
                                      backgroundColor = Colors.orange;
                                      text = "ข้าม";
                                      Timer.periodic(
                                          const Duration(milliseconds: 500),
                                          (timer) {
                                        setState(() {
                                          if (seconds > 0) {
                                            seconds--;
                                          } else {
                                            timer.cancel();
                                            backgroundColor = Colors.white;
                                            text = vocabs!
                                                .vocabularys[wordCount].word;
                                            wordCount++;
                                            vocabList.add(text);
                                            scoreList.add(0);
                                            tap = true;
                                          }
                                        });
                                      });
                                    })
                                  : null;
                            },
                            child: Container(
                              decoration: const BoxDecoration(
                                  color: Colors.transparent),
                            ),
                          ),
                        ),
                      ],
                    )
                  : Row(
                      children: [
                        Expanded(
                          // child: GestureDetector(
                          //   onTap: () {
                          //     print("center");
                          //     setState(() {
                          //       start = true;
                          //       text = "คำ";
                          //       startTimer();
                          //     });
                          //   },
                          child: Container(
                            decoration:
                                const BoxDecoration(color: Colors.transparent),
                          ),
                          // ),
                        ),
                      ],
                    ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: InkWell(
                onTap: () {
                  Get.off(() => ScoreScreen(
                        vocabList: vocabList,
                        scoreList: scoreList,
                        score: score,
                      ));
                },
                child: const SizedBox(
                    width: 50, height: 50, child: Icon(Icons.exit_to_app)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
