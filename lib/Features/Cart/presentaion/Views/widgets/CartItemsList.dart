import 'package:delivery_app/Features/Cart/domain/entities/cartItemEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Cubit/CartCubit/cart_cubit.dart';
import 'cartItem.dart';

class CartItemsList extends StatelessWidget {
  const CartItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    print("build list");
    return BlocBuilder<CartCubit, CartState>(
      buildWhen: (prev, curr) =>
      prev.cart.cartItems != curr.cart.cartItems,
      builder: (context, state) {
        final items = state.cart.cartItems;

        return SliverList(
          delegate: SliverChildBuilderDelegate(
                (context, index) {
              final item = items[index];
              return cartItem(
                key: ValueKey(item.menuItemModel.id),
                cartItemEntity: item,
              );
            },
            childCount: items.length,
          ),
        );
      },
    );
  }
}
