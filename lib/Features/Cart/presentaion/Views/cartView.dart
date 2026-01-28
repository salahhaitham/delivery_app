import 'package:delivery_app/Features/Cart/presentaion/Cubit/CartCubit/cart_cubit.dart';
import 'package:delivery_app/Features/Cart/presentaion/Views/widgets/cartViewBody.dart';
import 'package:delivery_app/Features/Cart/presentaion/Views/widgets/cartViewBody_BlocListner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/emptyCartView.dart';

class Cartview extends StatelessWidget {
  const Cartview({Key? key, required this.onBrowsePressed}) : super(key: key);
  final VoidCallback onBrowsePressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocSelector<CartCubit, CartState, bool>(
        selector: (state) => state.cart.cartItems.isEmpty,
        builder: (context, isEmpty) {
          return isEmpty
              ? EmptyCartView(onBrowsePressed: onBrowsePressed)
              : CartViewBody_BlocListener();
        },
      ),
    );
  }
}



