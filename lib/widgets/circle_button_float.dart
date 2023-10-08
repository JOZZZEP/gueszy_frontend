import 'package:flutter/material.dart';

class CircleButtonFloat extends StatelessWidget {
  const CircleButtonFloat(
    this.icon, {
    this.color,
    super.key,
  });

  final IconData icon;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.small(
      backgroundColor: Colors.green,
      onPressed: () => {},
      shape: const CircleBorder(),
      child: Icon(
        icon,
        color: color ?? Colors.white,
      ),
    );
  }
}
