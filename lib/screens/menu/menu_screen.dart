import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gueszy/screens/add_game_screen.dart';
import 'package:gueszy/screens/menu/all_game_screen.dart';
import 'package:gueszy/screens/menu/popular_game_screen.dart';
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
        child: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder:
              (BuildContext context, bool innerBoxIsScrolled) => [
            SliverAppBar(
              title: TextCustom(
                "GUESZY",
                size: 30,
                color: Colors.green[900],
                isBold: true,
              ),
              actions: [
                IconButton(
                  icon: Icon(
                    Icons.person,
                    color: Colors.green[900],
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    Icons.edit,
                    color: Colors.green[900],
                  ),
                  onPressed: () {
                    Get.to(() => const AddGameScreen());
                  },
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
          ],
          body: Column(
            children: [
              TabBar(
                controller: _tabController,
                indicatorWeight: 3,
                dividerColor: Colors.transparent,
                labelStyle: GoogleFonts.kanit(
                  fontSize: 18,
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
                    PopularGameScreen(),
                    AllGameScreen(),
                    AllGameScreen(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
