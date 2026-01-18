import 'package:delivery_app/Features/Cart/domain/entities/cartItemEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Cubit/CartCubit/cart_cubit.dart';
import 'cartItem.dart';

class CartItemsList extends StatelessWidget {
  const CartItemsList({super.key, required this.cartItems});
  final List<CartItemEntity> cartItems;
  @override
  Widget build(BuildContext context) {
    return
        SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: cartItem(cartItemEntity: context.watch<CartCubit>().cartEntity.cartItems[index]),
          ),
          childCount: context.watch<CartCubit>().cartEntity.cartItems.length,
        ),
      );

  }
}
