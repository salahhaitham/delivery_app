
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class AuthViewBackgroundImg extends StatelessWidget {
  const AuthViewBackgroundImg({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          top: -60,
          child: SvgPicture.asset(
            "assets/images/onboarding_2.svg",
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }
}