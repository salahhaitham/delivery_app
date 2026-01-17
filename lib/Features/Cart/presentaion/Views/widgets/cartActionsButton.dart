
import 'package:flutter/material.dart';

class CartActionButton extends StatelessWidget {
  const CartActionButton({
    Key? key,
    required this.color,
    required this.icon,
    required this.ontap,
  }) : super(key: key);

  final Color color;
  final Icon icon;
  final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color(0xFFF1F1F5)),
        ),
        child: Center(child: icon),
      ),
    );
  }
}
