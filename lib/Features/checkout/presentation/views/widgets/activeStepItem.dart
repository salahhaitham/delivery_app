
import 'package:flutter/material.dart';

import '../../../../../core/utils/AppTextStyles.dart';
import '../../../../../core/utils/App_Colors.dart';

class activeStepItem extends StatelessWidget {
  const activeStepItem({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: App_Colors.kprimaryColor,
          radius: 11.5,
          child: Icon(Icons.check, color: Colors.white),
        ),
        SizedBox(width: 4),
        Text(
          text,
          style: AppTextStyles.body13Bold.copyWith(
            color: App_Colors.kprimaryColor,
          ),
        ),
      ],
    );
  }
}