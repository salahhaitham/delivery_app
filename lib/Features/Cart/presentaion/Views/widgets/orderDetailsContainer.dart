
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/AppTextStyles.dart';
import '../../Cubit/CartCubit/cart_cubit.dart';

class orderDetailsContainer extends StatelessWidget {
  const orderDetailsContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: BlocBuilder<CartCubit,CartState>(
          builder: (context, state) {
            return  Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Color(0xffE10C33),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, -2),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Sub-Total',
                        style: AppTextStyles.heading13semiBold.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '${context.read<CartCubit>().state.cart.calculateTotalCards()}EGP',
                        style: AppTextStyles.heading13semiBold.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Delivery charge',
                        style: AppTextStyles.heading13semiBold.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '10 EGP',
                        style: AppTextStyles.heading13semiBold.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total',
                        style: AppTextStyles.body16Bold.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '${context.read<CartCubit>().state.cart.calculateTotalCards()+10} EGP',
                        style: AppTextStyles.body16Bold.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('place my order'),
                    ),
                  ),
                ],
              ),
            );
          },

        ),
      ),
    );
  }
}