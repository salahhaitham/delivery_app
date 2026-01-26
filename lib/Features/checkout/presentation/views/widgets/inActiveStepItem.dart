
import 'package:flutter/material.dart';

import '../../../../../core/utils/AppTextStyles.dart';

class inActivetepItem extends StatelessWidget {
  const inActivetepItem({super.key, required this.index, required this.text});
  final int index;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey.shade300,
          radius: 11.5,
          child: Text("$index", style: AppTextStyles.body13Bold),
        ),
        SizedBox(width: 4),
        Text(
          text,
          style: AppTextStyles.body13Bold.copyWith(color: Colors.grey.shade500),
        ),
      ],
    );
  }
}