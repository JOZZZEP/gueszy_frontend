import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gueszy/widgets/round_text_field.dart';
import 'package:gueszy/widgets/text_custom.dart';

class AddGameScreen extends StatefulWidget {
  const AddGameScreen({super.key});

  @override
  State<AddGameScreen> createState() => _AddGameScreenState();
}

class _AddGameScreenState extends State<AddGameScreen> {
  late List<TextField> textFieldList = [];
  int textFieldCount = 1;

  @override
  void initState() {
    super.initState();
    textFieldList.add(
      TextField(
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(5),
          isDense: true,
        ),
        style: GoogleFonts.kanit(
          fontSize: 13,
        ),
        onTap: () {
          textFieldList.add(
            TextField(
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(5),
                isDense: true,
              ),
              style: GoogleFonts.kanit(
                fontSize: 13,
              ),
              onTap: () {},
            ),
          );
        },
      ),
    );
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
                const Row(
                  children: [
                    Expanded(child: RoundTextField("ชื่อเกม")),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  children: [
                    Expanded(child: RoundTextField("URL รูปภาพ")),
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
                          const TextCustom("คำศัพท์"),
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
                        Get.back();
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
