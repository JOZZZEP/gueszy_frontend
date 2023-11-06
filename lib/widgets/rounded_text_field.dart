import 'package:flutter/material.dart';
import 'package:gueszy/widgets/components/text_field_container.dart';

class RoundedTextField extends StatelessWidget {
  const RoundedTextField(
    this.hintText, {
    super.key,
    this.icon = Icons.person,
    this.isPassword = false,
    this.onChanged,
  });

  final String hintText;
  final IconData icon;
  final ValueChanged<String>? onChanged;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: isPassword,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: Colors.black,
          ),
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.black),
          border: InputBorder.none,
        ),
        onChanged: onChanged,
      ),
    );
  }
}
