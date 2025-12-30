
import 'package:flutter/material.dart';

class OpenBadge extends StatelessWidget {
  const OpenBadge({required this.isOpen});

  final bool isOpen;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: isOpen ? Colors.green.shade100 : Colors.red.shade100,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        isOpen ? 'OPEN' : 'CLOSED',
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: isOpen ? Colors.green : Colors.red,
        ),
      ),
    );
  }
}
