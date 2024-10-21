import 'package:flutter/material.dart';

class MyIconButton extends StatelessWidget {
  final IconData icon;
  final double? radius;
  final Color? color;
  final Color? iconColor;
  const MyIconButton({
    super.key,
    required this.icon,
    this.radius,
    this.iconColor = Colors.black,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: color,
      child: Center(
        child: Icon(
          color: iconColor,
          icon,
        ),
      ),
    );
  }
}
