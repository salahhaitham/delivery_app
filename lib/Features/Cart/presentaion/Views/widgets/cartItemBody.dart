
import 'package:delivery_app/Features/Cart/presentaion/Cubit/CartCubit/cart_cubit.dart';
import 'package:delivery_app/Features/Cart/presentaion/Cubit/cartItemCubit/cart_item_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/AppTextStyles.dart';
import '../../../../../core/utils/App_Colors.dart';
import '../../../domain/entities/cartItemEntity.dart';
import 'cartActionsButton.dart';
import 'cartViewBody.dart';

class CartItemBody extends StatelessWidget {
  const CartItemBody({
    super.key,required this.cartItemEntity
  });
  final CartItemEntity cartItemEntity;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          cartItemEntity.menuItemModel.image,
          fit: BoxFit.contain,
          width: 70,
          height: 70,
        ),
        SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(cartItemEntity.menuItemModel.name, style: AppTextStyles.heading16semiBold),
              Opacity(
                opacity: 0.30,
                child: Text(
                  cartItemEntity.menuItemModel.description,
                  style: AppTextStyles.heading13semiBold,
                ),
              ),

              Text(
                '\$ ${cartItemEntity.CalculateTotalPrice()}',
                style: AppTextStyles.body19Bold.copyWith(
                  color: App_Colors.kprimaryColor,
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 11),

        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            IconButton(
              icon: Icon(
                Icons.delete_outline,
                color: App_Colors.kprimaryColor,
              ),
              onPressed: () {
                context
                    .read<CartCubit>()
                    .removeCart(cartItemEntity);
              },
            ),
            SizedBox(height: 16,),
            Row(

              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CartActionButton(

                  color: Color(0xffF9E1E1),
                  icon: Icon(
                    Icons.remove,
                    color: App_Colors.kprimaryColor,
                  ),
                  ontap: () {

                    cartItemEntity.decreaseCount();
                    context.read<CartItemCubit>().UpdateCartItem(cartItemEntity);
                  },
                ),
                SizedBox(width: 8,),


                Text("${cartItemEntity.count}", style: AppTextStyles.heading16semiBold),

                SizedBox(width: 8,),
                CartActionButton(
                  color: Color(0xffE10C33),
                  icon: Icon(Icons.add, color: Colors.white),
                  ontap: () {
                    cartItemEntity.increaseCount();
                    context.read<CartItemCubit>().UpdateCartItem(cartItemEntity);
                  },
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}