import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gueszy/api/game_service.dart';
import 'package:gueszy/controller/user_control.dart';
import 'package:gueszy/models/index.dart';
import 'package:gueszy/screens/game/game_screen.dart';
import 'package:gueszy/widgets/text_custom.dart';

class AllGameScreen extends StatefulWidget {
  const AllGameScreen({super.key});

  @override
  State<AllGameScreen> createState() => _AllGameScreenState();
}

class _AllGameScreenState extends State<AllGameScreen> {
  // late Users list;
  // late List<AnimationController> _controllers;
  late Games games;
  bool isLoading = false;
  UserControl userControl = Get.find<UserControl>();

  @override
  void initState() {
    super.initState();
    isLoading = true;
    // games = Games();d
    GameServices.getGames().then((value) => {
          setState(() {
            games = value;
            print(games.games[1].name);
            isLoading = false;
          })
        });
  }

  // list = Users();
  // UserServices.getUsers().then((fromServer) => {
  //       setState(() {
  //         list = fromServer;
  //       })
  //     });
  // list = List.generate(20, (index) => {"index": index});
  // final _controllers = List.generate(games!.games.length,
  //   (index) => AnimationController(
  //     duration: const Duration(milliseconds: 80),
  //     vsync: this,
  //   ),
  // );

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        // : Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: <Widget>[
        //       listGame(),
        //     ],
        //   );
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
                                Positioned(
                                  top: 5,
                                  left: 5,
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        size: 50,
                                        color: Colors.white,
                                      ),
                                      const Icon(
                                        Icons.star,
                                        size: 40,
                                        color: Colors.amber,
                                      ),
                                      TextCustom(
                                        (Random().nextInt(5) + 1).toString(),
                                        size: 15,
                                      )
                                    ],
                                  ),
                                ),
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
                        // Navigator.of(context).push(
                        //   MaterialPageRoute(
                        //     builder: (context) => GameScreen(
                        //       game: games.games[index],
                        //     ),
                        //   ),
                        // );
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
                              Center(
                                child: ElevatedButton(
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
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            }
            // : GridView.builder(
            //     padding: const EdgeInsets.all(15),
            //     gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            //         maxCrossAxisExtent: 200,
            //         childAspectRatio: 0.85,
            //         crossAxisSpacing: 10,
            //         mainAxisSpacing: 10),
            //     itemCount: games!.games.length,
            //     itemBuilder: (BuildContext context, index) {
            //       return GestureDetector(
            //         child: ScaleTransition(
            //           scale: Tween<double>(
            //             begin: 1.0,
            //             end: 0.9,
            //           ).animate(_controllers[index]),
            //           child: Container(
            //             alignment: Alignment.center,
            //             decoration: BoxDecoration(
            //               color: Colors.amber,
            //               borderRadius: BorderRadius.circular(15),
            //             ),
            //             child: Column(
            //               children: [
            //                 Padding(
            //                   padding: const EdgeInsets.all(10),
            //                   child: ClipRRect(
            //                     borderRadius: BorderRadius.circular(15),
            //                     child: Image.network(
            //                       "https://yt3.googleusercontent.com/ytc/AOPolaQhiUFeIqKQem41nDtv6WGfGSFRoO9hc78Z-s2G=s900-c-k-c0x00ffffff-no-rj",
            //                       fit: BoxFit.cover,
            //                     ),
            //                   ),
            //                 ),
            //                 TextCustom(
            //                   games!.games[index].name,
            //                   size: 25,
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ),
            //   onTap: () {
            //             _controllers[index].forward();
            //             Future.delayed(const Duration(milliseconds: 80), () {
            //               _controllers[index].reverse();
            //             });
            //             print('Shrink');
            // showDialog(
            //   context: context,
            //   builder: (BuildContext context) => AlertDialog(
            //     title: const TextCustom(
            //       'เริ่มเกม',
            //       size: 30,
            //     ),
            //     content: const TextCustom(
            //       'มีเวลา 60 วินาที',
            //       size: 20,
            //     ),
            //     actions: <Widget>[
            //       Center(
            //         child: ElevatedButton(
            //           style: ElevatedButton.styleFrom(
            //             backgroundColor: Colors.green,
            //           ),
            //           onPressed: () {
            //             Get.back();
            //             Get.to(() => (const GameScreen()));
            //           },
            //           child: const TextCustom(
            //             'เริ่มเกม',
            //             size: 20,
            //             color: Colors.white,
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // );
            // },
            //   );
            // },
            // ),
            // },
            );
  }
}
