import 'package:delivery_app/Features/checkout/domain/OrderEntity.dart';
import 'package:delivery_app/Features/checkout/presentation/Cubit/checkout_Cubit.dart';
import 'package:delivery_app/Features/checkout/presentation/views/widgets/shipItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class shippingSection extends StatelessWidget {
  const shippingSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<checkoutCubit>().state.orderEntity.cart;
    final totalOrder =
        (cart.calculateTotalCards() + cart.calculateDeliveryCharge())
            .toStringAsFixed(1);
    final order = context.read<checkoutCubit>();
    return Column(
      children: [
        Shipitem(
          title: "Payment upon receipt",
          subTitle: "Delivery from place",
          price: totalOrder.toString(),
          isSelected:
              order.state.orderEntity.paymentMethod == PaymentMethod.cash,
          onaTap: () {
            order.selectPaymentMethod(PaymentMethod.cash);
          },
        ),
        SizedBox(height: 16),
        Shipitem(
          title: "Buy now and pay later",
          subTitle: "Please select a payment method",
          price: totalOrder.toString(),
          isSelected:
              order.state.orderEntity.paymentMethod == PaymentMethod.online,
          onaTap: () {
            order.selectPaymentMethod(PaymentMethod.online);
          },
        ),
      ],
    );
  }
}
