
import 'package:flutter/material.dart';

class Restaurant_InfoItem extends StatelessWidget {
  const Restaurant_InfoItem({
    required this.icon,
    required this.text,
    this.color = Colors.black,
    required this.textColor
  });

  final IconData icon;
  final String text;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 18, color: color),
        const SizedBox(width: 4),
        Text(
          text,
          style: TextStyle(
            fontSize: 13,
            color: textColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
