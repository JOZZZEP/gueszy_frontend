import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gueszy/api/game_service.dart';
import 'package:gueszy/controller/user_control.dart';
import 'package:gueszy/screens/menu/menu_screen.dart';
import 'package:gueszy/widgets/round_text_field.dart';
import 'package:gueszy/widgets/text_custom.dart';

class AddGameScreen extends StatefulWidget {
  const AddGameScreen({super.key});

  @override
  State<AddGameScreen> createState() => _AddGameScreenState();
}

class _AddGameScreenState extends State<AddGameScreen> {
  List<Row> textFieldList = [];
  int textFieldCount = 0;
  String gameName = "";
  String gameImage = "";
  List<String> vocabList = [];
  List<TextEditingController> textControllers = [];

  @override
  void initState() {
    super.initState();
    textFieldList = [];
    textFieldCount = 0;
    vocabList = [];
    textControllers = [];
    gameName = "";
    gameImage = "";
    initTextField();
  }

  void initTextField() {
    textFieldCount++;
    TextEditingController controller =
        TextEditingController(); // Create a controller
    textControllers.add(controller); // Add it to the list of controllers

    textFieldList.add(
      Row(
        children: [
          TextCustom(
            textFieldCount.toString(),
            size: 18,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(5),
                isDense: true,
              ),
              style: GoogleFonts.kanit(fontSize: 18),
              controller: controller, // Assign the controller to the TextField
              onChanged: (value) => setState(() {}),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    UserControl userControl = Get.find<UserControl>();
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
                // Row(
                //   children: [
                //     SizedBox(
                //       height: 50,
                //       child: ElevatedButton(
                //         onPressed: () {},
                //         style: ElevatedButton.styleFrom(
                //           padding: const EdgeInsets.symmetric(horizontal: 0),
                //           shape: RoundedRectangleBorder(
                //             borderRadius: BorderRadius.circular(15),
                //           ),
                //         ),
                //         child: const Icon(Icons.image),
                //       ),
                //     ),
                //     const SizedBox(
                //       width: 10,
                //     ),
                //     const Expanded(child: RoundTextField("ชื่อเกม")),
                //   ],
                // ),
                Row(
                  children: [
                    Expanded(
                        child: RoundTextField(
                      "ชื่อเกม",
                      onChanged: (value) => setState(() {
                        gameName = value;
                      }),
                    )),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                        child: RoundTextField(
                      "URL รูปภาพ",
                      onChanged: (value) => setState(() {
                        gameImage = value;
                      }),
                    )),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(width: 1, color: Colors.grey),
                    ),
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const TextCustom(
                                "คำศัพท์",
                                size: 20,
                              ),
                              MaterialButton(
                                height: 5,
                                onPressed: () {
                                  setState(() {
                                    initTextField();
                                  });
                                },
                                color: Colors.green,
                                textColor: Colors.white,
                                padding: const EdgeInsets.all(10),
                                shape: const CircleBorder(),
                                child: const Icon(
                                  Icons.add,
                                  size: 20,
                                ),
                              )
                            ],
                          ),
                          ...textFieldList.map((e) => e).toList(),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: const TextCustom(
                        "ยกเลิก",
                        color: Colors.white,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        List<String> vocabList = textControllers
                            .where((controller) => controller.text.isNotEmpty)
                            .map((controller) => controller.text)
                            .toList();
                        print(vocabList);
                        GameServices.insertGame({
                          "name": gameName,
                          "image": gameImage,
                          "userId": userControl.id,
                          "access": 0,
                          "word": vocabList
                        });
                        Get.off(() => const MenuScreen());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: const TextCustom(
                        "บันทึก",
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
