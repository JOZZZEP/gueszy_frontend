import 'package:flutter/material.dart';
import 'package:gueszy/widgets/text_custom.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> with TickerProviderStateMixin {
  final list = List.generate(20, (index) => {"index": index});
  late List<AnimationController> _controllers;

  @override
  void initState() {
    super.initState();
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
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 70),
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
                  },
                );
              },
            ),
            Positioned(
              top: 10,
              right: 20,
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                FloatingActionButton.small(
                  backgroundColor: Colors.pink,
                  onPressed: () => {},
                  shape: const CircleBorder(),
                  child: const Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
              ]),
            ),
            Positioned(
              bottom: 10,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  FloatingActionButton.small(
                    backgroundColor: Colors.pink,
                    onPressed: () => {},
                    shape: const CircleBorder(),
                    child: const Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  FloatingActionButton.small(
                    backgroundColor: Colors.pink,
                    onPressed: () => {},
                    shape: const CircleBorder(),
                    child: const Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
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
