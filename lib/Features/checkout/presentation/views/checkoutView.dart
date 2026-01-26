import 'package:delivery_app/Features/Cart/domain/entities/cartEntity.dart';
import 'package:delivery_app/Features/checkout/presentation/views/widgets/checkoutViewBody.dart';
import 'package:delivery_app/core/utils/AppTextStyles.dart';
import 'package:flutter/material.dart';

class checkoutView extends StatelessWidget {
  const checkoutView({Key? key, required this.cartEntity}) : super(key: key);
  static const String routename = "checkoutview";
  final CartEntity cartEntity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("checkout", style: AppTextStyles.body19Bold),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back_ios_rounded),
        ),
      ),
      body: checkoutviewbody(),
    );
  }
}
