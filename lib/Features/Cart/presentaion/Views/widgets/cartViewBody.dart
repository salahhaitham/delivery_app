import 'package:delivery_app/Features/Cart/domain/entities/cartItemEntity.dart';
import 'package:delivery_app/Features/Cart/presentaion/Cubit/CartCubit/cart_cubit.dart';
import 'package:delivery_app/Features/Cart/presentaion/Cubit/cartItemCubit/cart_item_cubit.dart';
import 'package:delivery_app/core/utils/AppTextStyles.dart';
import 'package:delivery_app/core/utils/App_Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'CartItemsList.dart';
import 'cartItem.dart';
import 'cartItemBody.dart';
import 'orderDetailsContainer.dart';

class Cartviewbody extends StatelessWidget {
  const Cartviewbody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    const double checkoutHeight = 180;
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 16),

                    Center(
                      child: Text(
                        'Order details',
                        style: AppTextStyles.heading23Bold,
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              CartItemsList(cartItems: context.watch<CartCubit>().cartEntity.cartItems,),
              SliverToBoxAdapter(
                child: SizedBox(height: checkoutHeight),
              ),
            ],
          ),

        ),
        orderDetailsContainer(),
      ],
    );
  }
}



