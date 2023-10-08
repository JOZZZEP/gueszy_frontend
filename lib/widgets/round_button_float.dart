import 'package:flutter/material.dart';
import 'package:gueszy/widgets/text_custom.dart';

class RoundButtonFloat extends StatelessWidget {
  const RoundButtonFloat(
    this.text, {
    super.key,
    this.textSize,
    this.textColor,
    this.buttonColor,
    this.buttonHeight,
    this.buttonRadius,
    this.buttonHorizontalPadding,
    this.elevation,
  });

  final String text;
  final double? textSize;
  final Color? textColor;

  final Color? buttonColor;
  final double? buttonHeight;
  final double? buttonRadius;
  final double? buttonHorizontalPadding;
  final double? elevation;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: buttonHeight ?? 30,
      margin: const EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.symmetric(horizontal: buttonHorizontalPadding ?? 5),
      child: FloatingActionButton.extended(
        backgroundColor: buttonColor ?? Colors.pink,
        onPressed: () {},
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(buttonRadius ?? 10)),
        label: TextCustom(
          text,
          size: textSize ?? 15,
          color: textColor ?? Colors.white,
        ),
        elevation: elevation ?? 0,
      ),
    );
  }
}
