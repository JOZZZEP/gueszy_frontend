import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gueszy/widgets/text_custom.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

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
  int wordCount = 1;

  void startTimer() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (timeLeft > 0) {
          timeLeft--;
        } else {
          timer.cancel();
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
          text = "คำ $wordCount";
          startTimer();
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
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
                                            wordCount++;
                                            text = "คำ $wordCount";
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
                                            wordCount++;
                                            text = "คำ $wordCount";
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
          ],
        ),
      ),
    );
  }
}
