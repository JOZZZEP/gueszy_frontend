import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RoundTextField extends StatelessWidget {
  const RoundTextField(
    this.label, {
    super.key,
  });

  final String label;
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        labelText: label,
        labelStyle: GoogleFonts.kanit(
          fontSize: 15,
        ),
        contentPadding: const EdgeInsets.all(15),
      ),
      style: GoogleFonts.kanit(
        fontSize: 15,
      ),
    );
  }
}
