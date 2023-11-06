import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RoundTextField extends StatelessWidget {
  const RoundTextField(
    this.label, {
    super.key,
    this.onChanged,
    this.isPassword = false,
  });

  final String label;
  final ValueChanged<String>? onChanged;
  final bool isPassword;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isPassword,
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
      onChanged: onChanged,
    );
  }
}
