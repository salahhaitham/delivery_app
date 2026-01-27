
import 'package:delivery_app/Features/checkout/presentation/views/widgets/stepItem.dart';
import 'package:flutter/material.dart';

class stepsListView extends StatelessWidget {
  const stepsListView({Key? key,required this.currentIndex,required this.ontap}) : super(key: key);
  final int currentIndex;
  final ValueChanged ontap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        getsteps().length,
            (index) => GestureDetector(
              onTap:() {
                ontap(index);
              },
              child: StepItem(
                        isActive: index<=currentIndex,
                        index: (index) + 1,
                        text: getsteps()[index],
                      ),
            ),
      ),
    );
  }
  List<String> getsteps() {
    return ["shipping", "address", "payment"];
  }
}