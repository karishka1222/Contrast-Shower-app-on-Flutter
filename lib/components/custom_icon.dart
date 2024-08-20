import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  final Color color;
  final IconData icon;
  const CustomIcon({
    super.key,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(10),
      child: Icon(
        icon,
        color: Colors.white,
        size: 30,
      ),
    );
  }
}
