import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gueszy/screens/menu/all_game_screen.dart';
import 'package:gueszy/widgets/circle_button_float.dart';
import 'package:gueszy/widgets/text_custom.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> with TickerProviderStateMixin {
  late final TabController _tabController;

  final List<Tab> tabList = [
    const Tab(text: "ทั้งหมด"),
    const Tab(text: "ยอดนิยม"),
    const Tab(text: "เกมใหม่"),
    const Tab(text: "เกมของฉัน"),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabList.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            NestedScrollView(
              floatHeaderSlivers: true,
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) => [
                const SliverAppBar(
                  floating: true,
                  title: TextCustom(
                    "GUESZY",
                    size: 30,
                    isBold: true,
                  ),
                ),
              ],
              body: Column(
                children: [
                  TabBar(
                    controller: _tabController,
                    indicatorWeight: 3,
                    dividerColor: Colors.transparent,
                    labelStyle: GoogleFonts.kanit(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    isScrollable: true,
                    tabs: tabList,
                  ),
                  const Divider(height: 1),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: const [
                        AllGameScreen(),
                        AllGameScreen(),
                        AllGameScreen(),
                        AllGameScreen(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Positioned(
              bottom: 15,
              right: 20,
              child: CircleButtonFloat(Icons.edit),
            ),
          ],
        ),
      ),
    );
  }
}
