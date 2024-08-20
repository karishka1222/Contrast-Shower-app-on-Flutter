import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final Color backgroundColor;
  final IconData icon;
  final Color colorIcon;
  const RoundButton({
    super.key,
    required this.backgroundColor,
    required this.icon,
    required this.colorIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        color: colorIcon,
      ),
    );
  }
}
