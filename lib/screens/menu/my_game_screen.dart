import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gueszy/api/game_service.dart';
import 'package:gueszy/controller/user_control.dart';
import 'package:gueszy/models/index.dart';
import 'package:gueszy/screens/game/game_screen.dart';
import 'package:gueszy/widgets/text_custom.dart';

class MyGameScreen extends StatefulWidget {
  const MyGameScreen({super.key});

  @override
  State<MyGameScreen> createState() => _MyGameScreenState();
}

class _MyGameScreenState extends State<MyGameScreen> {
  // late Users list;
  // late List<AnimationController> _controllers;
  late Games games;
  bool isLoading = false;
  UserControl userControl = Get.find<UserControl>();

  @override
  void initState() {
    super.initState();
    isLoading = true;
    GameServices.getGamesById(userControl.id.toInt()).then((value) => {
          setState(() {
            games = value;
            print(games.games[1].name);
            isLoading = false;
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : GridView.builder(
            padding: const EdgeInsets.all(15),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 0.75,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10),
            itemCount: games.games.length,
            itemBuilder: (BuildContext context, index) {
              return Column(
                children: <Widget>[
                  Card(
                    child: GestureDetector(
                      child: Column(
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Stack(
                              children: [
                                Image.network(games.games[index].image),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 45,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: TextCustom(
                                  games.games[index].name,
                                  size: 20,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: Center(
                              child: TextCustom(
                                games.games[index].name,
                                size: 30,
                              ),
                            ),
                            content: TextCustom(
                              "ใบ้คำเกี่ยวกับ${games.games[index].name}",
                              size: 20,
                            ),
                            actions: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.red,
                                    ),
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            AlertDialog(
                                          title: Center(
                                            child: TextCustom(
                                              games.games[index].name,
                                              size: 30,
                                            ),
                                          ),
                                          content: TextCustom(
                                            "ใบ้คำเกี่ยวกับ${games.games[index].name}",
                                            size: 20,
                                          ),
                                          actions: <Widget>[
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor: Colors.red,
                                                  ),
                                                  onPressed: () {
                                                    Get.back();
                                                    Get.back();
                                                    setState(() {
                                                      isLoading = true;
                                                    });
                                                    GameServices.deleteGame(
                                                            games
                                                                .games[index].id
                                                                .toInt())
                                                        .then((value) => {
                                                              setState(() {
                                                                GameServices.getGamesById(
                                                                        userControl
                                                                            .id
                                                                            .toInt())
                                                                    .then(
                                                                        (value) =>
                                                                            {
                                                                              setState(() {
                                                                                games = value;
                                                                                print(games.games[1].name);
                                                                                isLoading = false;
                                                                              })
                                                                            });
                                                              })
                                                            });
                                                    // Navigator.of(context).push(
                                                    //     MaterialPageRoute(
                                                    //         builder: (context) =>
                                                    //             const MyGameScreen()));
                                                    // Get.off(() =>
                                                    //     const MenuScreen());
                                                  },
                                                  child: const Icon(
                                                    Icons.delete,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        Colors.green,
                                                  ),
                                                  onPressed: () {
                                                    Get.back();
                                                    Get.off(() => (GameScreen(
                                                          game: games
                                                              .games[index],
                                                        )));
                                                  },
                                                  child: const TextCustom(
                                                    'เริ่มเกม',
                                                    size: 20,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                    child: const Icon(
                                      Icons.delete,
                                      color: Colors.white,
                                    ),
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green,
                                    ),
                                    onPressed: () {
                                      Get.back();
                                      Get.off(() => (GameScreen(
                                            game: games.games[index],
                                          )));
                                    },
                                    child: const TextCustom(
                                      'เริ่มเกม',
                                      size: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            });
  }
}
