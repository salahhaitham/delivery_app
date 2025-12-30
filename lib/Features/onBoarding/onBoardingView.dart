
import 'package:delivery_app/Features/onBoarding/widgets/onBoardingViewBody.dart';
import 'package:flutter/material.dart';

class Onboardingview extends StatelessWidget {
  const Onboardingview({Key? key}) : super(key: key);
static const routename="onboardingview";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: onBoardingViewBody()),
    );
  }
}
