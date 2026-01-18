import 'package:delivery_app/Features/Cart/presentaion/Cubit/CartCubit/cart_cubit.dart';
import 'package:delivery_app/Features/Cart/presentaion/Cubit/cartItemCubit/cart_item_cubit.dart';
import 'package:delivery_app/Features/Cart/presentaion/Views/widgets/cartViewBody.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Cartview extends StatelessWidget {
  const Cartview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartItemCubit(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body:
               Cartviewbody()


      ),
    );
  }
}
