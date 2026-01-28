
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Cubit/CartCubit/cart_cubit.dart';
import 'cartViewBody.dart';

class CartViewBody_BlocListener extends StatelessWidget {
  const CartViewBody_BlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(listener: (context, state) {
      if (state is CartConflict) {
        showDialog(
          context: context,
          builder: (_) {
            return AlertDialog(
              title: Text('Change restaurant?'),
              content: Text(
                'Your cart contains items from another restaurant. '
                    'Do you want to clear the cart and add this item?',
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<CartCubit>().clearAndAddFromNewRestaurant(
                        state.cart.restaurantmodel!, state.menuItemModel
                    );
                    Navigator.pop(context);
                  },
                  child: Text('Clear cart'),
                ),
              ],
            );
          },
        );
      }
    }
      , child: Cartviewbody(),
    );
  }
}