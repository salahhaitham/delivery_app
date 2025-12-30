
import 'package:delivery_app/Features/MainView/presentation/Views/widgets/HomeViewBody.dart';
import 'package:flutter/material.dart';

class Homeview extends StatelessWidget {
  const Homeview({Key? key}) : super(key: key);
static const routename="homeview";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Homeviewbody(),
    );
  }
}
