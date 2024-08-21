import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final Color backgroundColor;
  final IconData icon;
  final Color colorIcon;
  final double iconSize;
  final void Function()? onTap;
  const RoundButton({
    super.key,
    required this.backgroundColor,
    required this.icon,
    required this.colorIcon,
    required this.iconSize,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: colorIcon,
          size: iconSize,
        ),
      ),
    );
  }
}
