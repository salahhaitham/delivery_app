
import 'package:delivery_app/Features/Splash/widgets/SplashViewBody.dart';
import 'package:flutter/material.dart';

class Splashview extends StatelessWidget {
  const Splashview({Key? key}) : super(key: key);
 static const routename="splashview";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Splashviewbody()
    );
  }
}
