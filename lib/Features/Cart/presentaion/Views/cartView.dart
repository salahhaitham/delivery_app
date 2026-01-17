
import 'package:delivery_app/Features/Cart/presentaion/Views/widgets/cartViewBody.dart';
import 'package:flutter/material.dart';

class Cartview extends StatelessWidget {
  const Cartview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Cartviewbody(),
    );
  }
}
