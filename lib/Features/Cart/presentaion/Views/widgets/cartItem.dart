import 'package:delivery_app/Features/Cart/domain/entities/cartItemEntity.dart';
import 'package:delivery_app/Features/Cart/presentaion/Cubit/cartItemCubit/cart_item_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cartItemBody.dart';

class cartItem extends StatelessWidget {
  const cartItem({super.key, required this.cartItemEntity});
  final CartItemEntity cartItemEntity;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit,CartItemState>(
      buildWhen: (previous, current) {
        if(current is CartItemUpdated){
          {
            if(current.cartItemEntity.menuItemModel.name==cartItemEntity.menuItemModel.name){
              return true;
            }

          }

        }
        return false;
      },
      builder: (context, state) {
      return  Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 21),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
            shadows: [
              BoxShadow(
                color: Color(0x115A6CEA),
                blurRadius: 50,
                offset: Offset(12, 26),
                spreadRadius: 0,
              ),
            ],
          ),
          child: CartItemBody(cartItemEntity: cartItemEntity,),
        );
      },

    );
  }
}
