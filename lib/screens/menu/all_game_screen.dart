import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gueszy/screens/game/game_screen.dart';
import 'package:gueszy/widgets/text_custom.dart';

class AllGameScreen extends StatefulWidget {
  const AllGameScreen({super.key});

  @override
  State<AllGameScreen> createState() => _AllGameScreenState();
}

class _AllGameScreenState extends State<AllGameScreen>
    with TickerProviderStateMixin {
  late List list;
  late List<AnimationController> _controllers;

  @override
  void initState() {
    super.initState();
    list = List.generate(20, (index) => {"index": index});
    _controllers = List.generate(
      list.length,
      (index) => AnimationController(
        duration: const Duration(milliseconds: 80),
        vsync: this,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(20),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 0.8,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
      itemCount: list.length,
      itemBuilder: (_, index) {
        return GestureDetector(
          child: ScaleTransition(
            scale: Tween<double>(
              begin: 1.0,
              end: 0.9,
            ).animate(_controllers[index]),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        "https://yt3.googleusercontent.com/ytc/AOPolaQhiUFeIqKQem41nDtv6WGfGSFRoO9hc78Z-s2G=s900-c-k-c0x00ffffff-no-rj",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  TextCustom(
                    list[index]["index"].toString(),
                    size: 25,
                  ),
                ],
              ),
            ),
          ),
          onTap: () {
            _controllers[index].forward();
            Future.delayed(const Duration(milliseconds: 80), () {
              _controllers[index].reverse();
            });
            print('Shrink');
            showDialog(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const TextCustom(
                  'เริ่มเกม',
                  size: 30,
                ),
                content: const TextCustom(
                  'มีเวลา 60 วินาที',
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
                        Get.to(() => (const GameScreen()));
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
        );
      },
    );
  }
}
