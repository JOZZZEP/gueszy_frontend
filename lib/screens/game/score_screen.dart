import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:gueszy/widgets/text_custom.dart';

class ScoreScreen extends StatefulWidget {
  final List<String> vocabList;
  final List<int> scoreList;
  final int score;
  const ScoreScreen(
      {Key? key,
      required this.vocabList,
      required this.scoreList,
      required this.score})
      : super(key: key);

  @override
  State<ScoreScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
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
        child: Container(
          decoration: BoxDecoration(color: Colors.green[800]),
          child: Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Center(
                  child: TextCustom(
                    "Score",
                    size: 30,
                  ),
                ),
                Center(
                  child: TextCustom(
                    widget.score.toString(),
                    size: 30,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(width: 1, color: Colors.grey),
                    ),
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          for (int i = 0; i < widget.vocabList.length; i++)
                            Row(
                              children: [
                                widget.scoreList[i] == 1
                                    ? const Icon(
                                        Icons.done,
                                        color: Colors.green,
                                        size: 30,
                                      )
                                    : const Icon(
                                        Icons.clear,
                                        color: Colors.red,
                                        size: 30,
                                      ),
                                TextCustom(
                                  widget.vocabList[i],
                                  size: 30,
                                )
                              ],
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: const Icon(
                        Icons.home,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
