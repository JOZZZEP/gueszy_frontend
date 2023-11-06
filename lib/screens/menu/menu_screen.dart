import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gueszy/controller/user_control.dart';
import 'package:gueszy/screens/add_game_screen.dart';
import 'package:gueszy/screens/menu/all_game_screen.dart';
import 'package:gueszy/screens/menu/my_game_screen.dart';
import 'package:gueszy/widgets/round_text_field.dart';
import 'package:gueszy/widgets/text_custom.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> with TickerProviderStateMixin {
  late final TabController _tabController;
  String name = "";
  String password = "";

  final List<Tab> tabList = [
    const Tab(text: "ทั้งหมด"),
    const Tab(text: "เกมของฉัน"),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabList.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    UserControl userControl = Get.find<UserControl>();
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
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Center(
                          child: TextCustom(
                            "User",
                            size: 30,
                          ),
                        ),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            RoundTextField(
                              userControl.getName,
                              onChanged: (value) => setState(() {
                                name = value;
                              }),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            RoundTextField(
                              userControl.getPassword,
                              onChanged: (value) => setState(() {
                                password = value;
                              }),
                            )
                          ],
                        ),
                        actions: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                ),
                                onPressed: () {
                                  Get.back();
                                },
                                child: const TextCustom(
                                  'แก้ไข',
                                  size: 20,
                                  color: Colors.white,
                                ),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                ),
                                onPressed: () {
                                  Get.back();
                                },
                                child: const TextCustom(
                                  'ปิด',
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
                    MyGameScreen(),
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
