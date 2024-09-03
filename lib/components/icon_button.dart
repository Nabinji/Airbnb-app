import 'package:flutter/material.dart';

class MyIconButton extends StatelessWidget {
  final IconData icon;
  final double? radius;
  const MyIconButton({
    super.key,
    required this.icon,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.white,
      child: Center(
        child: Icon(
          icon,
        ),
      ),
    );
  }
}
