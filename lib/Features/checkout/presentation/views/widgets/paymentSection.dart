import 'package:delivery_app/Features/checkout/presentation/Cubit/checkout/checkout_Cubit.dart';
import 'package:delivery_app/core/utils/AppTextStyles.dart';
import 'package:delivery_app/core/utils/App_Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'deliveryChargeRow.dart';
import 'orderItemTile.dart';

class paymentSection extends StatelessWidget {
  const paymentSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final order = context.read<checkoutCubit>().state.orderEntity;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Order Summary", style: AppTextStyles.body16Bold),
          const SizedBox(height: 12),

          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: order.cart.cartItems.length,
            separatorBuilder: (_, __) => const SizedBox(height: 6),
            itemBuilder: (context, index) {
              final item = order.cart.cartItems[index];
              return OrderItemTile(item: item);
            },
          ),

          SizedBox(height: 8),

          deliveryChargeRow(order: order),
          const Divider(height: 24),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Total", style: AppTextStyles.body16Bold),
              Text(
                "${order.cart.calculateTotal()} EGP",
                style: AppTextStyles.body16Bold.copyWith(
                  color: App_Colors.kprimaryColor,
                ),
              ),
            ],
          ),
          SizedBox(height: 24),
          Container(
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: Color(0xffEFC7D5),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 12,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("delivery Address :", style: AppTextStyles.body16Bold),
                  SizedBox(height: 4),

                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "${order.addressEntity?.userLocation?.name} /Building: ${order.addressEntity?.buildingNumber} /apartment: ${order.addressEntity?.apartment}",
                          style: AppTextStyles.heading16semiBold,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),


        ],
      ),
    );
  }
}


