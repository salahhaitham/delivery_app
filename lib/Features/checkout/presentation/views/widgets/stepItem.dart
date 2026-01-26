
import 'package:flutter/material.dart';

import 'activeStepItem.dart';
import 'inActiveStepItem.dart';

class StepItem extends StatelessWidget {
  const StepItem({
    super.key,
    required this.isActive,
    required this.text,
    required this.index,
  });
  final bool isActive;
  final String text;
  final int index;
  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: activeStepItem(text: text),
      secondChild: inActivetepItem(text: text, index: index),
      crossFadeState: isActive
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
      duration: Duration(milliseconds: 300),
    );
  }
}
